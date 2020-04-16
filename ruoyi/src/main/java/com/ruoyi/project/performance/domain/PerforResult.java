package com.ruoyi.project.performance.domain;

public class PerforResult extends PerforApplication {
  private Long id;
  private String result;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getResult() {
    return result;
  }

  public void setResult(String result) {
    this.result = result;
  }

  @Override
  public String toString() {
    return "PerforResult{" +
        "id=" + id +
        ", result='" + result + '\'' +
        '}';
  }
}
