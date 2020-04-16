package com.ruoyi.project.performance.mapper;

import java.util.List;

import com.ruoyi.project.performance.domain.EvaluationResult;
import com.ruoyi.project.performance.domain.PerforResult;

public interface PerforResultMapper  {
  List<PerforResult> selectResultList(PerforResult result);

  int insertResult(Long applicationId);

  int updateResult(PerforResult perforResult);

  int deleteResultByApplicationId(Long applicationId);

  List<EvaluationResult> selectEvaluationsByApplicationId(Long applicationId);
}
