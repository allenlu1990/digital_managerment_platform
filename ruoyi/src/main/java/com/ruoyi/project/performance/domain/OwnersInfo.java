package com.ruoyi.project.performance.domain;

import java.io.Serializable;

public class OwnersInfo implements Serializable {
  private Long userId;
  private String userName;
  private String deptName;

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getDeptName() {
    return deptName;
  }

  public void setDeptName(String deptName) {
    this.deptName = deptName;
  }

  @Override
  public String toString() {
    return "OwnersInfo{" +
        "userId=" + userId +
        ", userName='" + userName + '\'' +
        ", deptName='" + deptName + '\'' +
        '}';
  }
}
