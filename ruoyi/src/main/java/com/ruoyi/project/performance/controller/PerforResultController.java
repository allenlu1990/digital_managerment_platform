package com.ruoyi.project.performance.controller;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;

import com.ruoyi.project.performance.domain.PerforResult;
import com.ruoyi.project.performance.service.IPerforResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/performance/result")
public class PerforResultController extends BaseController {

  @Autowired
  IPerforResultService resultService;

  /**
   * 获取绩效结果列表
   */
  @PreAuthorize("@ss.hasPermi('performance:result:list')")
  @GetMapping("/list")
  public AjaxResult list(PerforResult result) {
    /**
     *
     * 自己只能看到自己的结果 除了 考核系统管理员可以看到全部人的
     *
     * **/
    if (result.getOwnerId() == null) {
      result.setOwnerId(SecurityUtils.getLoginUser().getUser().getUserId());
      SecurityUtils.getLoginUser().getUser().getRoles().forEach(role -> {
        if (role.getRoleId() == 100 || role.getRoleId() == 1 || "evaluation".equals(role.getRoleKey())) {
          result.setOwnerId(null);
        }
      });
    }

    return AjaxResult.success(resultService.selectResultList(result));
  }


  /**
   * 根据绩效申请编号获取评判详细信息
   */
  @PreAuthorize("@ss.hasPermi('performance:result:query')")
  @GetMapping(value = "/evaluations/{applicationId}")
  public AjaxResult getInfo(@PathVariable Long applicationId) {
    return AjaxResult.success(resultService.selectEvaluationsByApplicationId(applicationId));
  }
}
