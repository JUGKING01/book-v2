package com.ruoyi.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.domain.AsqBooksRank;
import com.ruoyi.service.IAsqBooksService;
import com.ruoyi.system.service.ISysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
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
@RequestMapping("/public/user")
public class PubAsqUserController extends BaseController {
    @Autowired
    private ISysUserService userService;

    /**
     * 获取用户列表
     */
    @GetMapping("/number")
    public Integer usersNum()
    {
        return userService.getUsersNum();
    }

}
