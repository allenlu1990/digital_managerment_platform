package com.ruoyi.project.performance.service.impl;

import java.util.AbstractMap;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.NumberUtils;
import com.ruoyi.project.performance.domain.OwnersInfo;
import com.ruoyi.project.performance.domain.PerforApproveTask;
import com.ruoyi.project.performance.domain.PerforResult;
import com.ruoyi.project.performance.mapper.PerforEvaluateMapper;
import com.ruoyi.project.performance.mapper.PerforResultMapper;
import com.ruoyi.project.performance.service.IPerforEvaluateService;
import com.ruoyi.project.system.domain.SysDictData;
import com.ruoyi.project.system.mapper.SysDictDataMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.ruoyi.common.constant.Constants.DEFAULT_SCORE;
import static com.ruoyi.common.utils.NumberUtils.changeNumberToLevel;

/**
 * 绩效审批Service业务层处理
 *
 * @author ruoyi
 * @date 2020-03-15
 */
@Service
public class PerforEvaluateServiceImpl implements IPerforEvaluateService {

  @Autowired
  private PerforEvaluateMapper performanceApproveTaskMapper;

  @Autowired
  SysDictDataMapper sysDictDataMapper;

  @Autowired
  PerforResultMapper perforResultMapper;

  /**
   * 查询绩效审批列表
   *
   * @param performanceApproveTask 绩效审批
   * @return 绩效审批
   */
  @Override
  public List<PerforApproveTask> selectPerforApproveTaskList(PerforApproveTask performanceApproveTask) {
    return performanceApproveTaskMapper.selectPerforApproveTaskList(performanceApproveTask);
  }

  /**
   * 新增绩效审批
   *
   * @param performanceApproveTask 绩效审批
   * @return 结果
   */
  @Override
  public int insertPerforApproveTask(PerforApproveTask performanceApproveTask) {
    return performanceApproveTaskMapper.insertPerforApproveTask(performanceApproveTask);
  }

  /**
   * 修改绩效审批
   *
   * @param performanceApproveTask 绩效审批
   * @return 结果
   */
  @Override
  public int updatePerforApproveTask(PerforApproveTask performanceApproveTask) {
    int re = performanceApproveTaskMapper.updatePerforApproveTask(performanceApproveTask);
    if (re > 0) {
      //更新结果表数据
      return updateResult(performanceApproveTask.getApplicationId());
    } else {
      return 0;
    }
  }

  /**
   * 删除绩效审批对象
   *
   * @param ids 需要删除的数据ID
   * @return 结果
   */
  @Override
  public int deletePerforApproveTaskByIds(String ids) {
    return performanceApproveTaskMapper.deletePerforApproveTaskByIds(Convert.toStrArray(ids));
  }

  /**
   * 删除绩效审批信息
   *
   * @param id 绩效审批ID
   * @return 结果
   */
  @Override
  public int deletePerforApproveTaskById(Long id) {
    return performanceApproveTaskMapper.deletePerforApproveTaskById(id);
  }

  @Override
  public List<OwnersInfo> getTaskOwners(PerforApproveTask approveTask) {
    return performanceApproveTaskMapper.getTaskOwners(approveTask);
  }

  private int updateResult(Long applicationId) {
    /**
     *
     * 查询各个等级的评分比例
     *
     * **/
    HashMap<Integer, Double> ranksRatioMap = new HashMap<>();
    List<SysDictData> ranksList = sysDictDataMapper.selectDictDataByType("perfor_evaluate_range");
    ranksList.stream().collect(Collectors.toMap(SysDictData::getDictSort, SysDictData::getDictValue))
        .forEach((k, v) -> ranksRatioMap.put(k.intValue(), Long.valueOf(v) / 100.0));

    List<PerforApproveTask> approveTasksList = performanceApproveTaskMapper.selectPerforEvaluateByApplicationId(applicationId);

    Map<Integer, List<String>> ranksResultMap = approveTasksList.stream().collect(Collectors.groupingBy(PerforApproveTask::getApproverRank))
        .entrySet().stream().map(v -> new AbstractMap.SimpleEntry<>(v.getKey(), v.getValue().stream().map(PerforApproveTask::getResult).collect(Collectors.toList())))
        .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));

    AtomicInteger numberResult = new AtomicInteger();
    ranksRatioMap.forEach((rank, ratio) -> {
      if (ranksResultMap.containsKey(rank)) {
        List<String> results = ranksResultMap.get(rank);
        results.removeAll(Collections.singleton(null));
        double average = results.stream().filter(result -> (!"".equals(result) || result != null))
            .map(NumberUtils::changeLevelToNumber)
            .mapToDouble(v -> v).average().orElse(DEFAULT_SCORE);
        numberResult.addAndGet(new Double(average * ranksRatioMap.get(rank)).intValue());
      } else {
        //没有的级别就按100算
        numberResult.addAndGet(new Double(ranksRatioMap.get(rank) * DEFAULT_SCORE).intValue());
      }
    });

    String stringResult = changeNumberToLevel(numberResult.get());
    PerforResult perforResult = new PerforResult();
    perforResult.setResult(stringResult);
    perforResult.setApplicationId(applicationId);
    return perforResultMapper.updateResult(perforResult);
  }


}
