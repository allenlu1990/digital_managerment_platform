package com.ruoyi.project.performance.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.framework.web.domain.BaseEntity;

public class PerforNormal extends BaseEntity {

  /** 考核时间段 */
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date date;
  /** 考核类型 **/
  private String type;
  /** 考核人群 **/
  private List<NormalTask> evaluations;

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

  public List<NormalTask> getEvaluations() {
    return evaluations;
  }

  public void setEvaluations(List<NormalTask> evaluations) {
    this.evaluations = evaluations;
  }

  @Override
  public String toString() {
    return "PerforNormal{" +
        "date=" + date +
        ", type='" + type + '\'' +
        ", evaluations=" + evaluations +
        '}';
  }
}
