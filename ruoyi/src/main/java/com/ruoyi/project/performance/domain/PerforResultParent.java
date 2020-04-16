package com.ruoyi.project.performance.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.web.domain.BaseEntity;

public class PerforResultParent extends BaseEntity {
  /** 申请ID */
  private Long applicationId;

  /** 申请标题 */
  private String applicationTitle;

  /** 被考核人名字 */
  private String ownerName;

  private String result;

  /** 考核时间段 */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date applicationDate;

  private List<PerforResult> children;

  public Long getApplicationId() {
    return applicationId;
  }

  public void setApplicationId(Long applicationId) {
    this.applicationId = applicationId;
  }

  public String getApplicationTitle() {
    return applicationTitle;
  }

  public void setApplicationTitle(String applicationTitle) {
    this.applicationTitle = applicationTitle;
  }

  public String getOwnerName() {
    return ownerName;
  }

  public void setOwnerName(String ownerName) {
    this.ownerName = ownerName;
  }

  public Date getApplicationDate() {
    return applicationDate;
  }

  public void setApplicationDate(Date applicationDate) {
    this.applicationDate = applicationDate;
  }

  public List<PerforResult> getChildren() {
    return children;
  }

  public void setChildren(List<PerforResult> children) {
    this.children = children;
  }

  public String getResult() {
    return result;
  }

  public void setResult(String result) {
    this.result = result;
  }
}
