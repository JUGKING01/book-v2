package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.domain.AsqBooks;
import com.ruoyi.domain.AsqPpt;
import com.ruoyi.service.IAsqBooksService;
import com.ruoyi.service.IAsqPptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 前台首页幻灯片Controller
 *
 * @author ruoyi
 * @date 2022-07-24
 */
@RestController
@RequestMapping("/public/bookM/books")
public class PubAsqBooksController extends BaseController {
    @Autowired
    private IAsqBooksService asqBooksService;

    /**
     * 查询前台期刊列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AsqBooks asqBooks) {
        startPage();
        List<AsqBooks> list = asqBooksService.selectAsqBooksList(asqBooks);
        return getDataTable(list);
    }
    /**
     * 获取期刊详细信息
     */
    @GetMapping(value = "/{bookId}")
    public AjaxResult getInfo(@PathVariable("bookId") Long bookId)
    {
        return AjaxResult.success(asqBooksService.selectAsqBooksByBookId(bookId));
    }

}
