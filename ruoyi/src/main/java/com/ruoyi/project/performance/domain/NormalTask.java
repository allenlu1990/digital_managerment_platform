package com.ruoyi.project.performance.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.web.domain.BaseEntity;

public class NormalTask extends BaseEntity {
  /** 考核时间段 */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date date;
  /** 考核类型 **/
  private String type;
  /** 考核人 **/
  private Long ownerId;
  /** 考核结果 **/
  private String result;
  /** 考核理由 **/
  private String reason;

  public Date getDate() {
    return date;
  }

  public void setDate(Date date) {
    this.date = date;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public Long getOwnerId() {
    return ownerId;
  }

  public void setOwnerId(Long ownerId) {
    this.ownerId = ownerId;
  }

  public String getResult() {
    return result;
  }

  public void setResult(String result) {
    this.result = result;
  }

  public String getReason() {
    return reason;
  }

  public void setReason(String reason) {
    this.reason = reason;
  }

  @Override
  public String toString() {
    return "NormalTask{" +
        "date=" + date +
        ", type='" + type + '\'' +
        ", ownerId=" + ownerId +
        ", result='" + result + '\'' +
        ", reason='" + reason + '\'' +
        '}';
  }
}
