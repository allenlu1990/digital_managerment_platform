<template>
  <div class="app-container">
    <el-form :inline="true" label-width="68px">
      <el-form-item label="责任人" label-width="85px" v-hasPermi="['system:user:list']">
        <el-select v-model="queryParams.ownerId" filterable placeholder="请选择" clearable size="small" @click.native="getUsers">
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
      <el-form-item>
        <el-button type="success" icon="el-icon-download" size="mini" @click="downloadResult">下载</el-button>
      </el-form-item>
    </el-form>

    <el-table id="resultTable" v-loading="loading" :data="resultList" row-key="applicationTitle" border :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
      <!-- <el-table-column label="序号" align="center" width="50" /> -->
      <el-table-column label="任务名称" align="center" prop="applicationTitle" :show-overflow-tooltip="true"/>
      <el-table-column label="责任人" align="center" prop="ownerName" />
      <el-table-column label="计划月份" align="center" prop="applicationDate" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.applicationDate, '{y}年{m}月') }}</span>
        </template>
      </el-table-column>
      <!-- <el-table-column label="状态" align="center" prop="status" :formatter="statusFormat" width="100"/> -->
      <el-table-column label="结果" align="center" prop="result" width="100"/>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
        <el-button
            size="middle"
            type="text"
            icon="el-icon-view"
            @click="handleView(scope.row)"
            v-if="scope.row.applicationId != undefined"
          >详情</el-button>
        </template>
      </el-table-column>
    </el-table>
<!-- 
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    /> -->

   <el-dialog title="评判详细界面" :visible.sync="open" width="700px">
      <el-form ref="form" :model="form" label-width="100px" size="mini">
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
          <el-col :span="24">
            <el-form-item label="考评结果：" > {{ form.result }} </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="考评详情：" > 
              <el-table :data="form.evaluations" style="width: 80%">
                  <el-table-column prop="approverName" label="评分人" width="90"></el-table-column>
                  <el-table-column prop="result" label="结果" width="90"></el-table-column>
                  <el-table-column prop="remark" label="说明"></el-table-column>
              </el-table>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <div slot="footer" class="dialog-footer">
        <el-button @click="open = false">关 闭</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listResult,getResultEvaluations} from "@/api/performance/result";
import { listUser } from "@/api/system/user";
import Editor from "@/components/Editor";
import FileSaver from "file-saver";
import XLSX from "xlsx";

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
      resultList: [],
      // 是否显示弹出层
      open: false,
      //用户可选列表
      userOptions: [],
      // 状态数据字典
      statusOptions: [],
     
      // 查询参数
      queryParams: {
        // pageNum: 1,
        // pageSize: 10,
        ownerId: undefined,
        applicationDate: undefined
      },
      // 表单参数
      form: {},
    };
  },
  created() {
    this.queryParams.applicationDate=this.parseTime(new Date());
    this.getList();
    this.getDicts("sys_notice_status").then(response => {
      this.statusOptions = response.data;
    });
    
  },
  methods: {
    /** 查询公告列表 */
    getList() {
      this.loading = true;
      listResult(this.queryParams).then(response => {
        this.resultList = response.data;
        // this.total = response.total;
        this.loading = false;
      });
    },
    getUsers(){
        listUser().then(response => {
          this.userOptions = response.rows;
        });
    },
    handleView(row) {
      this.form = row;
      getResultEvaluations(row.applicationId).then(response => {
          this.form.evaluations = response.data;
          this.open = true;
        });
    },

    // 公告状态字典翻译
    statusFormat(row, column) {
      return this.selectDictLabel(this.statusOptions, row.status);
    },
    /** 搜索按钮操作 */
    handleQuery() {
      // this.queryParams.pageNum = 1;
      this.getList();
    },
    downloadResult() {
        let wb = XLSX.utils.table_to_book(document.querySelector('#resultTable'));   // 这里就是表格
        let wbout = XLSX.write(wb, { bookType: 'xlsx', bookSST: true, type: 'array' });
        try {
          FileSaver.saveAs(new Blob([wbout], { type: 'application/octet-stream' }), this.parseTime(this.queryParams.applicationDate, '{y}年{m}月')+'结果.xlsx');  
        } catch (e)
        {
          if (typeof console !== 'undefined')
            console.log(e, wbout)
        }
        return wbout
      }
  }
};
</script>