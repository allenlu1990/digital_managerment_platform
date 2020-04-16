package com.ruoyi.project.performance.domain;

/**
 * 绩效审批对象 performance_approve_task
 *
 * @author ruoyi
 * @date 2020-03-15
 */
public class PerforApproveTask extends PerforApplication {
  private static final long serialVersionUID = 1L;

  /**
   * 任务ID
   */
  private Long id;
  /**
   * 审批人ID
   */
  private Long approverId;

  /**
   * 审批人rank
   */
  private Integer approverRank;
  /**
   * 评审结果
   */
  private String result;

//  public PerforApproveTask(Long approverId, Integer approverRank,Long applicationId) {
//    this.approverId = approverId;
//    this.approverRank = approverRank;
//    setApplicationId(applicationId);
//  }

  public static long getSerialVersionUID() {
    return serialVersionUID;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
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

  public Integer getApproverRank() {
    return approverRank;
  }

  public void setApproverRank(Integer approverRank) {
    this.approverRank = approverRank;
  }

  @Override
  public String toString() {
    return "PerforApproveTask{" +
        "id=" + id +
        ", approverId=" + approverId +
        ", approverRank=" + approverRank +
        ", result='" + result + '\'' +
        '}';
  }
}
