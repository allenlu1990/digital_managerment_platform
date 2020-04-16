<template>
  <div class="app-container">
    <el-form :inline="true" label-width="68px">
      <el-form-item label="责任人" label-width="85px">
        <el-select v-model="queryParams.ownerId" filterable placeholder="请选择" clearable size="small">
          <el-option
            v-for="item in userOptions"
            :key="item.userId"
            :label="item.userName"
            :value="item.userId"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="计划月份">
        <el-date-picker value-format="yyyy-MM-dd HH:mm:ss" v-model="queryParams.applicationDate" type="month" placeholder="选择月"></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
      </el-form-item>
    </el-form>

    <el-table v-loading="loading" :data="evaluateList">
      <el-table-column label="序号" align="center" type="index" width="50" />
      <el-table-column label="任务名称" align="center" prop="applicationTitle" :show-overflow-tooltip="true"/>
      <el-table-column label="责任人" align="center" prop="ownerName" />
      <el-table-column label="计划月份" align="center" prop="applicationDate" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applicationDate, '{y}年{m}月') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="状态" align="center" prop="status" :formatter="statusFormat" width="100"/>
      <el-table-column label="结果" align="center" prop="result" width="100"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
        <el-button
            size="middle"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-hasPermi="['performance:evaluate:update']"
          >评判</el-button>
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

   <el-dialog title="评判详细界面" :visible.sync="open" width="700px">
      <el-form ref="form" :model="form" :rules="rules" label-width="100px" size="mini">
        <el-row>
          <el-col :span="12">
            <el-form-item label="任务名称：">{{ form.applicationTitle }}</el-form-item>
            <el-form-item label="状态：">
              <div v-if="form.status == 0">正常</div>
              <div v-else-if="form.status == 1">关闭</div>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="责任人：">{{ form.ownerName }}</el-form-item>
            <el-form-item label="计划月份：">  
               {{ parseTime(form.applicationDate, '{y}年{m}月') }}
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-form-item label="月度任务百分比：" label-width="140px">{{ form.applicationPercentage }}%</el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="任务内容：" > <b v-html = 'form.applicationContent'></b> </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="考评结果" prop="result" label-width="85px">
          <el-select v-model="form.result" filterable placeholder="请选择" clearable size="small" @change="resetRemark">
            <el-option
               v-for="item in resultOptions"
               :key="item.dictLabel"
               :label="item.remark"
               :value="item.dictLabel"
            ></el-option>
         </el-select>
         <font color="red">(考评结果为A+或者B以下需要填写理由说明)</font>
        </el-form-item>
        <el-form-item v-if="['A+','B-','C+','C','C-','D','D+','D-'].includes(form.result)" label="考评理由" label-width="85px">
          <el-input
            type="textarea"
            :rows="2"
            placeholder="请输入内容"
            v-model="form.remark">
          </el-input>
        </el-form-item>
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
  listEvaluate,
  getEvaluate,
  updateEvaluate,
  listTaskOwners
} from "@/api/performance/evaluate";
import { listApplication } from "@/api/performance/application"
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
      evaluateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      //用户可选列表
      userOptions: [],
      // 状态数据字典
      statusOptions: [],
       // 绩效结果数据字典
      resultOptions: [],
      
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
        result: [
          { required: true, message: "考核成绩不能为空", trigger: "blur" }
        ]
      }
    };
  },
  created() {
    listTaskOwners().then(response => {
          this.userOptions = response.data;
        });
    this.getList();
    this.getDicts("sys_notice_status").then(response => {
      this.statusOptions = response.data;
    });
    this.getDicts("perfor_result_type").then(response => {
      this.resultOptions = response.data;
    });
  },
  methods: {
    getList() {
      this.loading = true;
      listEvaluate(this.queryParams).then(response => {
        // listApplication(this.queryParams).then(response => {
        this.evaluateList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    handleView(row) {
      this.open = true;
      this.form = row;
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
        status: "0",
        result: undefined,
        remark: undefined
      };
      this.resetForm("form");
    },
    resetRemark(){
      this.form.remark = undefined
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 提交按钮 */
    submitForm: function() {
      this.$refs["form"].validate(valid => {
        if (valid) {
             updateEvaluate(this.form).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              } else {
                this.msgError(response.msg);
              }
            });
        }
      });
    }
  }
};
</script>