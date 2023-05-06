package com.ruoyi.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.domain.AsqWriter;
import com.ruoyi.service.IAsqWriterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 作者管理Controller
 *
 * @author liefox
 * @date 2022-04-25
 */
@RestController
@RequestMapping("/public/writer/writer")
public class PubAsqWriterController extends BaseController
{
    @Autowired
    private IAsqWriterService asqWriterService;

    /**
     * 查询作者管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AsqWriter asqWriter)
    {
        startPage();
        List<AsqWriter> list = asqWriterService.selectAsqWriterList(asqWriter);
        return getDataTable(list);
    }


    /**
     * 获取作者管理详细信息
     */
    @GetMapping(value = "/{writerId}")
    public AjaxResult getInfo(@PathVariable("writerId") Long writerId)
    {
        return AjaxResult.success(asqWriterService.selectAsqWriterByWriterId(writerId));
    }



    /**
     * 修改作者管理
     */
    @PutMapping
    public AjaxResult edit(@RequestBody AsqWriter asqWriter)
    {
        return toAjax(asqWriterService.updateAsqWriter(asqWriter));
    }

}
