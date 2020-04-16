package com.ruoyi.project.performance.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.ruoyi.project.performance.domain.PerforApplication;
import com.ruoyi.project.performance.domain.PerforApproveTask;
import com.ruoyi.project.performance.mapper.PerforApplicationMapper;
import com.ruoyi.project.performance.mapper.PerforEvaluateMapper;
import com.ruoyi.project.performance.mapper.PerforResultMapper;
import com.ruoyi.project.performance.service.IPerforApplicationService;
import com.ruoyi.project.system.mapper.SysDictDataMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.ruoyi.common.constant.Constants.LEADER_LEADER_RANK;
import static com.ruoyi.common.constant.Constants.LEADER_RANK;
import static com.ruoyi.common.constant.Constants.LEADER_SUBORDINATES_RANK;
import static com.ruoyi.common.constant.Constants.SUBORDINATES_RANK;

@Service
public class PerforApplicationServiceImpl implements IPerforApplicationService {

  @Autowired
  PerforApplicationMapper perforApplicationMapper;

  @Autowired
  SysDictDataMapper sysDictDataMapper;

  @Autowired
  PerforEvaluateMapper perforEvaluateMapper;

  @Autowired
  PerforResultMapper perforResultMapper;

  @Override
  public PerforApplication selectApplicationById(Long applicationId) {
    return perforApplicationMapper.selectApplicationById(applicationId);
  }

  @Override
  public List<PerforApplication> selectApplicationList(PerforApplication application) {
    return perforApplicationMapper.selectApplicationList(application);
  }

  @Override
  @Transactional
  public int insertApplication(PerforApplication application) {
    perforApplicationMapper.insertApplication(application);
    if (application.getApplicationId() > 0) {
      generateEvaluateTasks(application);
      return 1;
    } else {
      return 0;
    }
  }

  @Override
  public int updateApplication(PerforApplication application) {
    return perforApplicationMapper.updateApplication(application);
  }

  @Override
  @Transactional
  public int deleteApplicationById(Long applicationId) {
    int re = perforApplicationMapper.deleteApplicationById(applicationId);
    if (re <= 0) {
      return 0;
    }
    re = deleteEvaluateByApplicationId(applicationId);
    if (re <= 0) {
      return 0;
    }
    return deleteResultByApplicationId(applicationId);
  }

  private void generateEvaluateTasks(PerforApplication application) {
    Long applicationId = application.getApplicationId();
    Long ownerId = application.getOwnerId();

    HashMap<Integer, List<Long>> ranksIdMap = new HashMap<>();
    //TODO 确认人
    List<Long> confirmerIds = application.getConfirmerIds();
    //TODO 后续升级改成存储过程
    //找上级
    List<Long> leaderId = perforEvaluateMapper.selectCorrelateIds(ownerId);

    if (leaderId.size() > 0) {
      //找领导的下级（找平级）
      List<Long> leaderSubordinatesId = perforEvaluateMapper.selectReverseCorrelateIds(leaderId.get(0));
      leaderSubordinatesId.removeAll(confirmerIds);
      //去掉自己
      leaderSubordinatesId.remove(ownerId);
      ranksIdMap.put(LEADER_SUBORDINATES_RANK, leaderSubordinatesId);
      //找上上级
      List<Long> leaderLeaderId = perforEvaluateMapper.selectCorrelateIds(leaderId.get(0));
      leaderLeaderId.removeAll(confirmerIds);
      ranksIdMap.put(LEADER_LEADER_RANK, leaderLeaderId);
    }
    leaderId.removeAll(confirmerIds);
    leaderId.addAll(confirmerIds);
    ranksIdMap.put(LEADER_RANK, leaderId);
    //找下级
    List<Long> subordinatesId = perforEvaluateMapper.selectReverseCorrelateIds(ownerId);
    subordinatesId.removeAll(confirmerIds);
    ranksIdMap.put(SUBORDINATES_RANK, subordinatesId);

    ArrayList<PerforApproveTask> perforApproveTasks = new ArrayList<>();
    ranksIdMap.forEach((rank, v) -> {
      if (v.size() > 0) {
        v.forEach(id -> {
          PerforApproveTask approveTask = new PerforApproveTask();
          approveTask.setApproverId(id);
          approveTask.setApproverRank(rank);
          approveTask.setApplicationId(applicationId);
          perforApproveTasks.add(approveTask);
        });
      }
    });
    perforEvaluateMapper.insertPerforApproveTaskBatch(perforApproveTasks);
    generateResultTasks(applicationId);
  }

  private void generateResultTasks(Long applicationId) {
    perforResultMapper.insertResult(applicationId);
  }

  private int deleteEvaluateByApplicationId(Long applicationId) {
    return perforEvaluateMapper.deleteEvaluateByApplicationId(applicationId);
  }

  private int deleteResultByApplicationId(Long applicationId) {
    return perforResultMapper.deleteResultByApplicationId(applicationId);
  }
}
