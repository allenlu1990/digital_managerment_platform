package com.ruoyi.project.performance.mapper;

import java.util.Date;
import java.util.List;

import com.ruoyi.project.performance.domain.NormalTask;

public interface PerforNormalMapper {
  List<NormalTask> selectPerforNormalTasks(String type, Date date);

  int insertNormalTasks(List<NormalTask> normalTasks);

  void deleteNormalTasks(String type, Date date);
}
