package com.ruoyi.project.performance.controller;

import java.util.List;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.aspectj.lang.annotation.Log;
import com.ruoyi.framework.aspectj.lang.enums.BusinessType;
import com.ruoyi.framework.web.controller.BaseController;
import com.ruoyi.framework.web.domain.AjaxResult;
import com.ruoyi.framework.web.page.TableDataInfo;
import com.ruoyi.project.performance.domain.PerforApplication;
import com.ruoyi.project.performance.service.IPerforApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/performance/application")
public class PerforApplicationController extends BaseController {

  @Autowired
  IPerforApplicationService applicationService;

  /**
   * 获取绩效申请列表
   */
  @PreAuthorize("@ss.hasPermi('performance:application:list')")
  @GetMapping("/list")
  public TableDataInfo list(PerforApplication application) {
    startPage();
    application.setOwnerId(SecurityUtils.getLoginUser().getUser().getUserId());
    List<PerforApplication> list = applicationService.selectApplicationList(application);
    return getDataTable(list);
  }

  /**
   * 根据绩效申请编号获取详细信息
   */
  @PreAuthorize("@ss.hasPermi('performance:application:query')")
  @GetMapping(value = "/{applicationId}")
  public AjaxResult getInfo(@PathVariable Long applicationId) {
    return AjaxResult.success(applicationService.selectApplicationById(applicationId));
  }

  /**
   * 添加申请
   */
  @PreAuthorize("@ss.hasPermi('performance:application:add')")
  @Log(title = "绩效申请", businessType = BusinessType.INSERT)
  @PostMapping
  public AjaxResult add(@RequestBody PerforApplication application) {
    application.setCreateBy(SecurityUtils.getUsername());
    /**
     * 如果OwnerId为null 自己填写自己的任务
     * **/
    if(application.getOwnerId() ==null){
      application.setOwnerId(SecurityUtils.getLoginUser().getUser().getUserId());
    }
    return toAjax(applicationService.insertApplication(application));
  }

  /**
   * 修改申请
   */
  @PreAuthorize("@ss.hasPermi('performance:application:update')")
  @Log(title = "绩效申请", businessType = BusinessType.UPDATE)
  @PutMapping
  public AjaxResult edit(@RequestBody PerforApplication application) {
    application.setUpdateBy(SecurityUtils.getUsername());
    return toAjax(applicationService.updateApplication(application));
  }

  /**
   * 删除申请
   */
  @PreAuthorize("@ss.hasPermi('performance:application:remove')")
  @Log(title = "绩效申请", businessType = BusinessType.DELETE)
  @DeleteMapping("/{applicationId}")
  public AjaxResult remove(@PathVariable Long applicationId) {
    return toAjax(applicationService.deleteApplicationById(applicationId));
  }
}
