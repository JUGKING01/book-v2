package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.domain.AsqBooks;
import com.ruoyi.domain.AsqBooksRank;
import com.ruoyi.service.IAsqBooksService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/public/rank")
public class PubAsqRankController extends BaseController {
    @Autowired
    private IAsqBooksService asqBooksService;

    /**
     * 查询书库阅读总榜
     */
    @GetMapping("/readAllRank")
    public TableDataInfo list() {
        startPage();
        List<AsqBooksRank> list = asqBooksService.readAllRank();
        return getDataTable(list);
    }

}
