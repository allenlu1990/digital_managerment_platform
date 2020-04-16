<template>
  <div class="app-container">
    <el-form :model="dynamicValidateForm" ref="dynamicValidateForm" :rules="rules" label-width="100px" class="demo-dynamic">
      <el-row>
        <el-col :span="6">
          <el-form-item label="考核类型" prop="type" label-width="85px">
            <el-select v-model="dynamicValidateForm.type" filterable clearable placeholder="请选择" size="small">
              <el-option
                v-for="item in typeOptions"
                :key="item.dictValue"
                :label="item.dictLabel"
                :value="item.dictValue"
              ></el-option>
            </el-select>
          </el-form-item>
          </el-col>
          <el-col :span="8">
          <el-form-item label="考查月份" prop="date" label-width="85px">
            <el-date-picker value-format="yyyy-MM-dd HH:mm:ss" v-model="dynamicValidateForm.date" type="month" placeholder="选择月" @change="getEvaluations"></el-date-picker>
          </el-form-item>
        </el-col>
        <!-- <el-col :span="6">
          <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="getEvaluations">搜索</el-button>
          </el-form-item>
        </el-col> -->
      </el-row>
      <el-divider>填写需要考核的人员</el-divider>

    <el-row v-for="(evaluation, index) in dynamicValidateForm.evaluations" :key="index"> 
    <el-col :span="6" >
      <el-form-item :label="'责任人'+(index+1)" label-width="85px">
        <el-select v-model="evaluation.ownerId" filterable placeholder="请选择" clearable size="small">
          <el-option
            v-for="item in userOptions"
            :key="item.userId"
            :label="item.userName"
            :value="item.userId"
          ></el-option>
        </el-select>
      </el-form-item>
      </el-col>
      <el-col :span="12" >
       <el-form-item label="考评结果" prop="result" label-width="85px">
         <el-tooltip class="item" effect="dark" content="考评结果为A+或者B以下需要填写理由说明" placement="bottom-end">
          <el-select v-model="evaluation.result" filterable placeholder="请选择" clearable size="small" @change="resetRemark(evaluation)">
            <el-option
               v-for="item in resultOptions"
               :key="item.dictLabel"
               :label="item.remark"
               :value="item.dictLabel"
            ></el-option>
          </el-select>
         </el-tooltip>
         <el-button @click.prevent="removeDomain(evaluation)">删除</el-button>
        </el-form-item>
    </el-col>
    <el-col :span="14" >
      <el-form-item v-if="['A+','B-','C+','C','C-','D','D+','D-'].includes(evaluation.result)" label="考评理由" label-width="85px">
          <el-input
            type="textarea"
            :rows="2"
            placeholder="请输入内容"
            v-model="evaluation.reason">
          </el-input>
      </el-form-item>
    </el-col>
    </el-row>
    <el-col :span="24">
      <el-form-item>
        <el-button type="primary" @click="submitForm('dynamicValidateForm')">提交</el-button>
        <el-button @click="addDomain">新增人员</el-button>
      </el-form-item>
    </el-col>
    </el-form> 
  </div>
</template>

<script>
import { listEvaluations, addEvaluations } from "@/api/performance/normal";
import { listUser } from "@/api/system/user";
import Editor from "@/components/Editor";
export default {
  components: {
    Editor
  },
  data() {
    return {
      // 表单校验
      rules: {
        date: [
          { required: true, message: "必须选择考核月份", trigger: "blur" }
        ],
        type: [
          { required: true, message: "任务类型不能为空", trigger: "blur" }
        ]
      },
      //考评类型
      typeOptions: [],
      // 绩效结果数据字典
      resultOptions: [],
      userOptions:[],
     
      dynamicValidateForm: {
        evaluations: [
          {
            ownerId: "",
            result: "",
            reason: undefined,
          }
        ],
        type: undefined,
        date: undefined
      }
    };
  },
  created() {
    this.getUsers();
    this.getDicts("perfor_result_type").then(response => {
      this.resultOptions = response.data;
    });
    this.getDicts("perfor_normal_type").then(response => {
      this.typeOptions = response.data;
    });
  },
  methods: {
    getEvaluations(){
      this.$refs["dynamicValidateForm"].validate(valid => {
        if (valid) {
          listEvaluations(this.dynamicValidateForm.type,this.dynamicValidateForm.date).then(response => {
            this.dynamicValidateForm.evaluations = response.data;
          });
        }
      });
    },
    getUsers() {
      listUser().then(response => {
        this.userOptions = response.rows;
      });
    },
    reset() {
      this.dynamicValidateForm={
        evaluations: [
          {
            ownerId: "",
            result: "",
            reason: undefined,
          }
        ],
        type: undefined,
        date: undefined
      };
      this.resetForm("dynamicValidateForm");
    },
    resetRemark(evaluation){
      evaluation.reason = undefined
    },
    submitForm: function() {
      this.$refs["dynamicValidateForm"].validate(valid => {
        if (valid) {
             addEvaluations(this.dynamicValidateForm).then(response => {
              if (response.code === 200) {
                this.msgSuccess("修改成功");
                this.reset();
              } else {
                this.msgError(response.msg);
              }
            });
        }
      });
    },
    removeDomain(item) {
      var index = this.dynamicValidateForm.evaluations.indexOf(item);
      if (index !== -1) {
        this.dynamicValidateForm.evaluations.splice(index, 1);
      }
    },
    addDomain() {
      this.dynamicValidateForm.evaluations.push({
        ownerId: "",
        result: "",
        reason: ""
      });
    }
  }
};
</script>