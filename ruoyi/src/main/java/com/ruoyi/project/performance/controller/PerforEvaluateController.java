package com.ruoyi.project.performance.controller;

import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;

import com.ruoyi.project.performance.domain.PerforApproveTask;
import com.ruoyi.project.performance.service.IPerforEvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * 绩效审批Controller
 *
 * @author allen
 * @date 2020-03-15
 */
@RestController
@RequestMapping("/performance/evaluate")
public class PerforEvaluateController extends BaseController {

  @Autowired
  private IPerforEvaluateService approveTaskService;

  /**
   * 查询绩效审批列表
   */
  @PreAuthorize("@ss.hasPermi('performance:evaluate:list')")
  @GetMapping("/list")
  @ResponseBody
  public TableDataInfo list(PerforApproveTask approveTask) {
    startPage();
    approveTask.setApproverId(SecurityUtils.getLoginUser().getUser().getUserId());
    List<PerforApproveTask> list = approveTaskService.selectPerforApproveTaskList(approveTask);
    return getDataTable(list);
  }

  /**
   * 修改结果
   */
  @PreAuthorize("@ss.hasPermi('performance:evaluate:update')")
  @Log(title = "修改结果", businessType = BusinessType.UPDATE)
  @PutMapping
  public AjaxResult edit(@RequestBody PerforApproveTask approveTask) {
    return toAjax(approveTaskService.updatePerforApproveTask(approveTask));
  }


  /**
   * 获取被考核人员
   */
//  @PreAuthorize("@ss.hasPermi('system:dict:query')")
  @GetMapping(value = "/task/owners")
  public AjaxResult getTaskOwners(PerforApproveTask approveTask)
  {
    approveTask.setApproverId(SecurityUtils.getLoginUser().getUser().getUserId());
    return AjaxResult.success(approveTaskService.getTaskOwners(approveTask));
  }


}
