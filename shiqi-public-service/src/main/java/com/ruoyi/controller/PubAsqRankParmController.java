package com.ruoyi.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.domain.AsqRankParm;
import com.ruoyi.service.IAsqRankParmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 排名参数Controller
 *
 * @author ruoyi
 * @date 2022-07-28
 */
@RestController
@RequestMapping("/public/rankParm/rankParm")
public class PubAsqRankParmController extends BaseController {
    @Autowired
    private IAsqRankParmService asqRankParmService;

    /**
     * 查询排名参数列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AsqRankParm asqRankParm) {
        startPage();
        List<AsqRankParm> list = asqRankParmService.selectAsqRankParmList(asqRankParm);
        return getDataTable(list);
    }

    /**
     * 导出排名参数列表
     */
    @Log(title = "排名参数" , businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AsqRankParm asqRankParm) {
        List<AsqRankParm> list = asqRankParmService.selectAsqRankParmList(asqRankParm);
        ExcelUtil<AsqRankParm> util = new ExcelUtil<AsqRankParm>(AsqRankParm.class);
        return util.exportExcel(list, "排名参数数据");
    }

    /**
     * 获取排名参数详细信息
     */
    @GetMapping(value = "/{rankParmId}")
    public AjaxResult getInfo(@PathVariable("rankParmId") Long rankParmId) {
        return AjaxResult.success(asqRankParmService.selectAsqRankParmByRankParmId(rankParmId));
    }

    /**
     * 新增排名参数
     */
    @Log(title = "排名参数" , businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AsqRankParm asqRankParm) {
//            asqRankParm1.setApplaudNum(asqRankParm1.getApplaudNum() + 1);
//            asqRankParm1.setCollectNum(asqRankParm1.getCollectNum() + 1);
//            asqRankParm1.setCommentNum(asqRankParm1.getCommentNum() + 1);
        AsqRankParm asqRankParm2 = new AsqRankParm();
        asqRankParm2.setBookId(asqRankParm.getBookId());
        List<AsqRankParm> asqRankParm1 = asqRankParmService.selectAsqRankParmList(asqRankParm2);
        if (asqRankParm1.size() == 0) {
            if (asqRankParm.getReadNum() != null) {
                asqRankParm.setReadNum(1L);
            }
            return toAjax(asqRankParmService.insertAsqRankParm(asqRankParm));
        } else {
            if (asqRankParm.getReadNum() != null) {
                asqRankParm1.get(0).setReadNum(asqRankParm1.get(0).getReadNum() + 1);
            }
            return toAjax(asqRankParmService.updateAsqRankParm(asqRankParm1.get(0)));
        }
    }

    /**
     * 修改排名参数
     */
    @Log(title = "排名参数" , businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AsqRankParm asqRankParm) {
        return toAjax(asqRankParmService.updateAsqRankParm(asqRankParm));
    }

    /**
     * 删除排名参数
     */
    @Log(title = "排名参数" , businessType = BusinessType.DELETE)
    @DeleteMapping("/{rankParmIds}")
    public AjaxResult remove(@PathVariable Long[] rankParmIds) {
        return toAjax(asqRankParmService.deleteAsqRankParmByRankParmIds(rankParmIds));
    }
}
