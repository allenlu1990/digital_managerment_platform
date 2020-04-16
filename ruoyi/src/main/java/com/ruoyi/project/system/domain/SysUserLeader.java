package com.ruoyi.project.system.domain;

public class SysUserLeader {
  /** 用户ID */
  private Long userId;

  /** 角色ID */
  private Long leaderId;

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public Long getLeaderId() {
    return leaderId;
  }

  public void setLeaderId(Long leaderId) {
    this.leaderId = leaderId;
  }

  @Override
  public String toString() {
    return "SysUserLeader{" +
        "userId=" + userId +
        ", leaderId=" + leaderId +
        '}';
  }
}
