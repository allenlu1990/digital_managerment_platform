package com.ruoyi.project.performance.mapper;

import java.util.ArrayList;
import java.util.List;

import com.ruoyi.project.performance.domain.OwnersInfo;
import com.ruoyi.project.performance.domain.PerforApproveTask;


/**
 * 绩效审批Mapper接口
 *
 * @author ruoyi
 * @date 2020-03-15
 */
public interface PerforEvaluateMapper {
  /**
   * 查询绩效审批
   *
   * @param applicationId 绩效申请ID
   * @return 绩效审批
   */
  public List<PerforApproveTask> selectPerforEvaluateByApplicationId(Long applicationId);

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
   * 删除绩效审批
   *
   * @param id 绩效审批ID
   * @return 结果
   */
  public int deletePerforApproveTaskById(Long id);

  /**
   * 批量删除绩效审批
   *
   * @param ids 需要删除的数据ID
   * @return 结果
   */
  public int deletePerforApproveTaskByIds(String[] ids);

  List<OwnersInfo> getTaskOwners(PerforApproveTask approveTask);

  List<Long> selectCorrelateIds(Long id);

  List<Long> selectReverseCorrelateIds(Long id);

  void insertPerforApproveTaskBatch(ArrayList<PerforApproveTask> perforApproveTasks);

  int deleteEvaluateByApplicationId(Long applicationId);
}
