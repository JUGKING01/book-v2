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
import com.ruoyi.domain.AsqRankParm;
import com.ruoyi.service.IAsqRankParmService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 排名参数Controller
 *
 * @author ruoyi
 * @date 2022-07-28
 */
@RestController
@RequestMapping("/rankParm/rankParm")
public class AsqRankParmController extends BaseController
{
    @Autowired
    private IAsqRankParmService asqRankParmService;

    /**
     * 查询排名参数列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AsqRankParm asqRankParm)
    {
        startPage();
        List<AsqRankParm> list = asqRankParmService.selectAsqRankParmList(asqRankParm);
        return getDataTable(list);
    }

    /**
     * 导出排名参数列表
     */
    @Log(title = "排名参数", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AsqRankParm asqRankParm)
    {
        List<AsqRankParm> list = asqRankParmService.selectAsqRankParmList(asqRankParm);
        ExcelUtil<AsqRankParm> util = new ExcelUtil<AsqRankParm>(AsqRankParm.class);
        return util.exportExcel(list, "排名参数数据");
    }

    /**
     * 获取排名参数详细信息
     */
    @GetMapping(value = "/{rankParmId}")
    public AjaxResult getInfo(@PathVariable("rankParmId") Long rankParmId)
    {
        return AjaxResult.success(asqRankParmService.selectAsqRankParmByRankParmId(rankParmId));
    }

    /**
     * 新增排名参数
     */
    @Log(title = "排名参数", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AsqRankParm asqRankParm)
    {
        return toAjax(asqRankParmService.insertAsqRankParm(asqRankParm));
    }

    /**
     * 修改排名参数
     */
    @Log(title = "排名参数", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AsqRankParm asqRankParm)
    {
        return toAjax(asqRankParmService.updateAsqRankParm(asqRankParm));
    }

    /**
     * 删除排名参数
     */
    @Log(title = "排名参数", businessType = BusinessType.DELETE)
	@DeleteMapping("/{rankParmIds}")
    public AjaxResult remove(@PathVariable Long[] rankParmIds)
    {
        return toAjax(asqRankParmService.deleteAsqRankParmByRankParmIds(rankParmIds));
    }
}
