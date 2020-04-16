package com.ruoyi.project.performance.service;

import java.util.Date;
import java.util.List;

import com.ruoyi.project.performance.domain.NormalTask;
import com.ruoyi.project.performance.domain.PerforNormal;

public interface IPerforNormalService {

  int insertNormalTasks(PerforNormal normal);

  List<NormalTask> selectPerforNormalTasks(String type, Date date);
}
