package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.domain.AsqPpt;
import com.ruoyi.service.IAsqPptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前台首页幻灯片Controller
 *
 * @author ruoyi
 * @date 2022-07-24
 */
@RestController
@RequestMapping("/public/ppt/ppt")
public class PubAsqPptController extends BaseController
{
    @Autowired
    private IAsqPptService asqPptService;

    /**
     * 查询前台首页幻灯片列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AsqPpt asqPpt)
    {
        startPage();
        List<AsqPpt> list = asqPptService.selectAsqPptList(asqPpt);
        return getDataTable(list);
    }

    }
