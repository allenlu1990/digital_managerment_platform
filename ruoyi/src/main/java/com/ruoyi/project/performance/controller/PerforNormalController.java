package com.ruoyi.project.performance.controller;

import java.util.Date;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.project.performance.domain.PerforNormal;
import com.ruoyi.project.performance.service.IPerforNormalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
@RequestMapping("/performance/normal")
public class PerforNormalController extends BaseController {

  @Autowired
  IPerforNormalService perforNormalService;

  /**
   * 获取绩效申请列表
   */
  @PreAuthorize("@ss.hasPermi('performance:normal:list')")
  @GetMapping(value = "/{type}/{date}")
  public AjaxResult list(@PathVariable String type, @PathVariable Date date) {
    return AjaxResult.success(perforNormalService.selectPerforNormalTasks(type,date));
  }

  /**
   * 添加申请
   */
  @PreAuthorize("@ss.hasPermi('performance:normal:list')")
  @Log(title = "日常考核", businessType = BusinessType.INSERT)
  @PostMapping
  public AjaxResult add(@RequestBody PerforNormal normal) {
    normal.setCreateBy(SecurityUtils.getUsername());
    return toAjax(perforNormalService.insertNormalTasks(normal));
  }
}
