package com.ruoyi.project.performance.domain;

import com.ruoyi.framework.web.domain.BaseEntity;

public class EvaluationResult extends BaseEntity {

  private String approverName;

  private Long approverId;

  private String result;

  private String remark;

  public String getApproverName() {
    return approverName;
  }

  public void setApproverName(String approverName) {
    this.approverName = approverName;
  }

  public Long getApproverId() {
    return approverId;
  }

  public void setApproverId(Long approverId) {
    this.approverId = approverId;
  }

  public String getResult() {
    return result;
  }

  public void setResult(String result) {
    this.result = result;
  }

  @Override
  public String getRemark() {
    return remark;
  }

  @Override
  public void setRemark(String remark) {
    this.remark = remark;
  }

  @Override
  public String toString() {
    return "EvaluationResult{" +
        "approverName='" + approverName + '\'' +
        ", approverId=" + approverId +
        ", result='" + result + '\'' +
        ", remark='" + remark + '\'' +
        '}';
  }
}
