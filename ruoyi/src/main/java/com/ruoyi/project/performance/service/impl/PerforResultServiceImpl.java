package com.ruoyi.project.performance.service.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.ruoyi.project.performance.domain.EvaluationResult;
import com.ruoyi.project.performance.domain.PerforResult;
import com.ruoyi.project.performance.domain.PerforResultParent;
import com.ruoyi.project.performance.mapper.PerforResultMapper;
import com.ruoyi.project.performance.service.IPerforResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.ruoyi.common.utils.NumberUtils.changeLevelToNumber;
import static com.ruoyi.common.utils.NumberUtils.changeNumberToLevel;

@Service
public class PerforResultServiceImpl implements IPerforResultService {
  @Autowired
  PerforResultMapper resultMapper;

  @Override
  public List<PerforResultParent> selectResultList(PerforResult result) {
    return generateTotalResult(resultMapper.selectResultList(result));
  }

  @Override
  public List<EvaluationResult> selectEvaluationsByApplicationId(Long applicationId) {
    return resultMapper.selectEvaluationsByApplicationId(applicationId);
  }

  private List<PerforResultParent> generateTotalResult(List<PerforResult> perforResults) {
    DateFormat df = new SimpleDateFormat("yyyy年MM月");
    Map<String, List<PerforResult>> collect = perforResults.stream().collect(Collectors.groupingBy(o -> df.format(o.getApplicationDate()) + "_" + o.getOwnerName()));
    ArrayList<PerforResultParent> perforResultParents = new ArrayList<>();
    collect.forEach((k, results) -> {
      if (results.size() > 0) {
        PerforResult perforResult = results.get(0);
        PerforResultParent perforResultParent = new PerforResultParent();
        perforResultParent.setOwnerName(perforResult.getOwnerName());
        perforResultParent.setApplicationDate(perforResult.getApplicationDate());
        perforResultParent.setChildren(results);
        perforResultParent.setApplicationTitle(k);
        double numberResult = results.stream().filter(result -> (!"".equals(result.getResult()) && result.getResult() != null))
            .map(result -> changeLevelToNumber(result.getResult()) * (result.getApplicationPercentage() / 100.0))
            .mapToDouble(v -> v).sum();
        perforResultParent.setResult(changeNumberToLevel(new Double(numberResult).intValue()));
        perforResultParents.add(perforResultParent);
      }
    });
    return perforResultParents;
  }
}
