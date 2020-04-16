package com.ruoyi.project.performance.service;

import java.util.List;

import com.ruoyi.project.performance.domain.EvaluationResult;
import com.ruoyi.project.performance.domain.PerforResult;
import com.ruoyi.project.performance.domain.PerforResultParent;

public interface IPerforResultService {
  /**
   * 查询结果列表
   *
   * @param result 申请信息
   * @return 申请集合
   */
  public List<PerforResultParent> selectResultList(PerforResult result);


  List<EvaluationResult> selectEvaluationsByApplicationId(Long applicationId);
}
