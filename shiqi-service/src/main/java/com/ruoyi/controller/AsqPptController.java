package com.ruoyi.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.domain.AsqPpt;
import com.ruoyi.service.IAsqPptService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 前台首页幻灯片Controller
 * 
 * @author ruoyi
 * @date 2022-07-24
 */
@RestController
@RequestMapping("/ppt/ppt")
public class AsqPptController extends BaseController
{
    @Autowired
    private IAsqPptService asqPptService;

    /**
     * 查询前台首页幻灯片列表
     */
    @PreAuthorize("@ss.hasPermi('ppt:ppt:list')")
    @GetMapping("/list")
    public TableDataInfo list(AsqPpt asqPpt)
    {
        startPage();
        List<AsqPpt> list = asqPptService.selectAsqPptList(asqPpt);
        return getDataTable(list);
    }

    /**
     * 导出前台首页幻灯片列表
     */
    @PreAuthorize("@ss.hasPermi('ppt:ppt:export')")
    @Log(title = "前台首页幻灯片", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AsqPpt asqPpt)
    {
        List<AsqPpt> list = asqPptService.selectAsqPptList(asqPpt);
        ExcelUtil<AsqPpt> util = new ExcelUtil<AsqPpt>(AsqPpt.class);
        return util.exportExcel(list, "前台首页幻灯片数据");
    }

    /**
     * 获取前台首页幻灯片详细信息
     */
    @PreAuthorize("@ss.hasPermi('ppt:ppt:query')")
    @GetMapping(value = "/{pptId}")
    public AjaxResult getInfo(@PathVariable("pptId") Long pptId)
    {
        return AjaxResult.success(asqPptService.selectAsqPptByPptId(pptId));
    }

    /**
     * 新增前台首页幻灯片
     */
    @PreAuthorize("@ss.hasPermi('ppt:ppt:add')")
    @Log(title = "前台首页幻灯片", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AsqPpt asqPpt)
    {
        return toAjax(asqPptService.insertAsqPpt(asqPpt));
    }

    /**
     * 修改前台首页幻灯片
     */
    @PreAuthorize("@ss.hasPermi('ppt:ppt:edit')")
    @Log(title = "前台首页幻灯片", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AsqPpt asqPpt)
    {
        return toAjax(asqPptService.updateAsqPpt(asqPpt));
    }

    /**
     * 删除前台首页幻灯片
     */
    @PreAuthorize("@ss.hasPermi('ppt:ppt:remove')")
    @Log(title = "前台首页幻灯片", businessType = BusinessType.DELETE)
	@DeleteMapping("/{pptIds}")
    public AjaxResult remove(@PathVariable Long[] pptIds)
    {
        return toAjax(asqPptService.deleteAsqPptByPptIds(pptIds));
    }
}
