package com.ruoyi.project.performance.mapper;

import java.util.List;

import com.ruoyi.project.performance.domain.PerforApplication;

public interface PerforApplicationMapper {

  /**
   * 查询申请信息
   *
   * @param applicationId 申请ID
   * @return 申请信息
   */
  public PerforApplication selectApplicationById(Long applicationId);

  /**
   * 查询申请列表
   *
   * @param application 申请信息
   * @return 申请集合
   */
  public List<PerforApplication> selectApplicationList(PerforApplication application);

  /**
   * 新增申请
   *
   * @param application 申请信息
   * @return 结果
   */
  public int insertApplication(PerforApplication application);

  /**
   * 修改申请
   *
   * @param application 申请信息
   * @return 结果
   */
  public int updateApplication(PerforApplication application);

  /**
   * 删除申请信息
   *
   * @param applicationId 申请ID
   * @return 结果
   */
  public int deleteApplicationById(Long applicationId);
}
