<template>
  <div class="app-container">
    <el-form :inline="true" label-width="68px">
      <el-form-item label="任务名称">
        <el-input
          v-model="queryParams.applicationTitle"
          placeholder="请输入任务名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <!-- <el-form-item label="操作人员">
        <el-input
          v-model="queryParams.createBy"
          placeholder="请输入操作人员"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item> -->

      <el-form-item label="计划月份">
        <el-date-picker value-format="yyyy-MM-dd HH:mm:ss" v-model="queryParams.applicationDate" type="month" placeholder="选择月"></el-date-picker>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button
          type="primary"
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['performance:application:add']"
        >新增</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="applicationList">
      <el-table-column label="序号" align="center" type="index" width="50" />
      <el-table-column label="任务名称" align="center" prop="applicationTitle" :show-overflow-tooltip="true"/>
      <!-- <el-table-column label="被考核人员" align="center" prop="ownerName" /> -->
      <el-table-column label="计划月份" align="center" prop="applicationDate" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applicationDate, '{y}年{m}月') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" :formatter="statusFormat" width="100"/>
      <el-table-column label="创建者" align="center" prop="createBy" width="100" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['performance:application:update']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['performance:application:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改申请对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="780px">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
           <el-col :span="12">
            <el-form-item label="任务名称" prop="applicationTitle">
              <el-input v-model="form.applicationTitle" placeholder="请输入任务名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="状态">
              <el-radio-group v-model="form.status">
                <el-radio
                  v-for="dict in statusOptions"
                  :key="dict.dictValue"
                  :label="dict.dictValue"
                >{{dict.dictLabel}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
               <el-form-item label="计划月份" prop="applicationDate">
                  <el-date-picker value-format="yyyy-MM-dd HH:mm:ss" v-model="form.applicationDate" type="month" placeholder="选择月"></el-date-picker>
               </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="月度任务百分比" prop="applicationPercentage" label-width="120px">
               <el-input-number v-model="form.applicationPercentage" :min="0" :max="100" size="small"></el-input-number>
            </el-form-item>
          </el-col>
         <el-col :span="12">
               <el-form-item v-if="form.applicationId == undefined" label="确认人">
                  <el-select v-model="form.confirmerIds" filterable multiple placeholder="请选择" clearable size="small">
                  <el-option
                     v-for="item in userOptions"
                     :key="item.userId"
                     :label="item.userName"
                     :value="item.userId"
                  ></el-option>
               </el-select>
               </el-form-item>
         </el-col>
         <el-col :span="12">
            <el-form-item label="责任人" v-if="form.applicationId == undefined" label-width="85px" v-hasPermi="['performance:application:distribution']">
            <el-select v-model="form.ownerId" filterable placeholder="请选择" clearable size="small">
              <el-option
                v-for="item in userOptions"
                :key="item.userId"
                :label="item.userName"
                :value="item.userId"
              ></el-option>
            </el-select>
          </el-form-item>
         </el-col>
          <el-col :span="24">
            <el-form-item label="任务内容">
              <Editor v-model="form.applicationContent" />
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer" style="padding-top:20px">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listApplication,
  getApplication,
  delApplication,
  addApplication,
  updateApplication
} from "@/api/performance/application";
import { listUser } from "@/api/system/user";
import Editor from "@/components/Editor";

export default {
  components: {
    Editor
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 申请表格数据
      applicationList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //用户可选列表
      userOptions: [],

      // 状态数据字典
      statusOptions: [],
      
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        ownerId: undefined,
        createBy: undefined,
        applicationDate: undefined
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        applicationDate: [
          { required: true, message: "必须选择计划月份", trigger: "blur" }
        ],
        applicationTitle: [
          { required: true, message: "任务名称不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    listUser().then(response => {
          this.userOptions = response.rows;
        });
    this.getList();
    this.getDicts("sys_notice_status").then(response => {
      this.statusOptions = response.data;
    });
  },
  methods: {
    /** 查询公告列表 */
    getList() {
      this.loading = true;
      listApplication(this.queryParams).then(response => {
        this.applicationList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 公告状态字典翻译
    statusFormat(row, column) {
      return this.selectDictLabel(this.statusOptions, row.status);
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        applicationId: undefined,
        ownerId: undefined,
        applicationDate: undefined,
        applicationContent: undefined,
        confirmerIds: [],
        status: "0",
        applicationPercentage: 0
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加工作任务";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      getApplication(row.applicationId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改工作任务";
      });
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.applicationId != undefined) {
            updateApplication(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          } else {
            addApplication(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      this.$confirm(
        '是否确认删除此绩效申请?',
        "警告",
        {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning"
        }
      )
        .then(function() {
           console.log("row.applicationId:"+row.applicationId);
          return delApplication(row.applicationId);
        })
        .then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        })
        .catch(function() {});
    }
  }
};
</script>