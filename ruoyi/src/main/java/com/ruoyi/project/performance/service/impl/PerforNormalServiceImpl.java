package com.ruoyi.project.performance.service.impl;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.ruoyi.project.performance.domain.NormalTask;
import com.ruoyi.project.performance.domain.PerforNormal;
import com.ruoyi.project.performance.mapper.PerforNormalMapper;
import com.ruoyi.project.performance.service.IPerforNormalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PerforNormalServiceImpl implements IPerforNormalService {

  @Autowired
  PerforNormalMapper perforNormalMapper;

  @Override
  @Transactional
  public int insertNormalTasks(PerforNormal normal) {
    if(normal.getEvaluations().size()>0){
      Date date = normal.getDate();
      String type = normal.getType();
      String createBy = normal.getCreateBy();
      perforNormalMapper.deleteNormalTasks(type, date);
      List<NormalTask> normalTasks = normal.getEvaluations().stream().filter(task -> task.getOwnerId() != null).map(task -> {
        task.setDate(date);
        task.setType(type);
        task.setCreateBy(createBy);
        return task;
      }).collect(Collectors.toList());
      return perforNormalMapper.insertNormalTasks(normalTasks);
    }else {
      return 1;
    }

  }

  @Override
  public List<NormalTask> selectPerforNormalTasks(String type, Date date) {
    return perforNormalMapper.selectPerforNormalTasks(type, date);
  }
}
