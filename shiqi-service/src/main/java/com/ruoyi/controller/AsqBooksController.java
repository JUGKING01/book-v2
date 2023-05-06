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
import com.ruoyi.domain.AsqBooks;
import com.ruoyi.service.IAsqBooksService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 期刊管理Controller
 *
 * @author ruoyi
 * @date 2022-03-22
 */
@RestController
@RequestMapping("/bookM/books")
public class AsqBooksController extends BaseController
{
    @Autowired
    private IAsqBooksService asqBooksService;

    /**
     * 查询期刊管理列表
     */
    @PreAuthorize("@ss.hasPermi('bookM:books:list')")
    @GetMapping("/list")
    public TableDataInfo list(AsqBooks asqBooks)
    {
        startPage();
        List<AsqBooks> list = asqBooksService.selectAsqBooksList(asqBooks);
        return getDataTable(list);
    }

    /**
     * 导出期刊管理列表
     */
    @PreAuthorize("@ss.hasPermi('bookM:books:export')")
    @Log(title = "期刊管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(AsqBooks asqBooks)
    {
        List<AsqBooks> list = asqBooksService.selectAsqBooksList(asqBooks);
        ExcelUtil<AsqBooks> util = new ExcelUtil<AsqBooks>(AsqBooks.class);
        return util.exportExcel(list, "期刊管理数据");
    }

    /**
     * 获取期刊管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('bookM:books:query')")
    @GetMapping(value = "/{bookId}")
    public AjaxResult getInfo(@PathVariable("bookId") Long bookId)
    {
        return AjaxResult.success(asqBooksService.selectAsqBooksByBookId(bookId));
    }

    /**
     * 新增期刊管理
     */
    @PreAuthorize("@ss.hasPermi('bookM:books:add')")
    @Log(title = "期刊管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AsqBooks asqBooks)
    {
        return toAjax(asqBooksService.insertAsqBooks(asqBooks));
    }

    /**
     * 修改期刊管理
     */
    @PreAuthorize("@ss.hasPermi('bookM:books:edit')")
    @Log(title = "期刊管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AsqBooks asqBooks)
    {
        return toAjax(asqBooksService.updateAsqBooks(asqBooks));
    }

    /**
     * 删除期刊管理
     */
    @PreAuthorize("@ss.hasPermi('bookM:books:remove')")
    @Log(title = "期刊管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{bookIds}")
    public AjaxResult remove(@PathVariable Long[] bookIds)
    {
        return toAjax(asqBooksService.deleteAsqBooksByBookIds(bookIds));
    }
}
