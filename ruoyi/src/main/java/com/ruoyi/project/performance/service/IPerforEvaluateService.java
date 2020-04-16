package com.ruoyi.project.performance.service;

import java.util.List;

import com.ruoyi.project.performance.domain.OwnersInfo;
import com.ruoyi.project.performance.domain.PerforApproveTask;


/**
 * 绩效审批Service接口
 *
 * @author ruoyi
 * @date 2020-03-15
 */
public interface IPerforEvaluateService {

  /**
   * 查询绩效审批列表
   *
   * @param performanceApproveTask 绩效审批
   * @return 绩效审批集合
   */
  public List<PerforApproveTask> selectPerforApproveTaskList(PerforApproveTask performanceApproveTask);

  /**
   * 新增绩效审批
   *
   * @param performanceApproveTask 绩效审批
   * @return 结果
   */
  public int insertPerforApproveTask(PerforApproveTask performanceApproveTask);

  /**
   * 修改绩效审批
   *
   * @param performanceApproveTask 绩效审批
   * @return 结果
   */
  public int updatePerforApproveTask(PerforApproveTask performanceApproveTask);

  /**
   * 批量删除绩效审批
   *
   * @param ids 需要删除的数据ID
   * @return 结果
   */
  public int deletePerforApproveTaskByIds(String ids);

  /**
   * 删除绩效审批信息
   *
   * @param id 绩效审批ID
   * @return 结果
   */
  public int deletePerforApproveTaskById(Long id);


  List<OwnersInfo> getTaskOwners(PerforApproveTask approveTask);
}
