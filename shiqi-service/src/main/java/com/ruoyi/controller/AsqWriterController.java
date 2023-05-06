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
import com.ruoyi.domain.AsqWriter;
import com.ruoyi.service.IAsqWriterService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 作者管理Controller
 * 
 * @author liefox
 * @date 2022-04-25
 */
@RestController
@RequestMapping("/writer/writer")
public class AsqWriterController extends BaseController
{
    @Autowired
    private IAsqWriterService asqWriterService;

    /**
     * 查询作者管理列表
     */
    @PreAuthorize("@ss.hasPermi('writer:writer:list')")
    @GetMapping("/list")
    public TableDataInfo list(AsqWriter asqWriter)
    {
        startPage();
        List<AsqWriter> list = asqWriterService.selectAsqWriterList(asqWriter);
        return getDataTable(list);
    }

    /**
     * 导出作者管理列表
     */
    @PreAuthorize("@ss.hasPermi('writer:writer:export')")
    @Log(title = "作者管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AsqWriter asqWriter)
    {
        List<AsqWriter> list = asqWriterService.selectAsqWriterList(asqWriter);
        ExcelUtil<AsqWriter> util = new ExcelUtil<AsqWriter>(AsqWriter.class);
        return util.exportExcel(list, "作者管理数据");
    }

    /**
     * 获取作者管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('writer:writer:query')")
    @GetMapping(value = "/{writerId}")
    public AjaxResult getInfo(@PathVariable("writerId") Long writerId)
    {
        return AjaxResult.success(asqWriterService.selectAsqWriterByWriterId(writerId));
    }

    /**
     * 新增作者管理
     */
    @PreAuthorize("@ss.hasPermi('writer:writer:add')")
    @Log(title = "作者管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AsqWriter asqWriter)
    {
        return toAjax(asqWriterService.insertAsqWriter(asqWriter));
    }

    /**
     * 修改作者管理
     */
    @PreAuthorize("@ss.hasPermi('writer:writer:edit')")
    @Log(title = "作者管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AsqWriter asqWriter)
    {
        return toAjax(asqWriterService.updateAsqWriter(asqWriter));
    }

    /**
     * 删除作者管理
     */
    @PreAuthorize("@ss.hasPermi('writer:writer:remove')")
    @Log(title = "作者管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{writerIds}")
    public AjaxResult remove(@PathVariable Long[] writerIds)
    {
        return toAjax(asqWriterService.deleteAsqWriterByWriterIds(writerIds));
    }
}
