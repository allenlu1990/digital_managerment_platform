package com.ruoyi.project.system.mapper;

import com.ruoyi.project.system.domain.SysUserLeader;

public interface SysUserLeaderMapper {

  void insertUserLeader(SysUserLeader userLeader);

  void deleteUserLeaderByUserId(Long userId);

  void updateUserLeader(SysUserLeader userLeader);
}
