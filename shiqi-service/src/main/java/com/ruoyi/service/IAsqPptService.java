package com.ruoyi.service;

import java.util.List;
import com.ruoyi.domain.AsqPpt;

/**
 * 前台首页幻灯片Service接口
 * 
 * @author ruoyi
 * @date 2022-07-24
 */
public interface IAsqPptService 
{
    /**
     * 查询前台首页幻灯片
     * 
     * @param pptId 前台首页幻灯片主键
     * @return 前台首页幻灯片
     */
    public AsqPpt selectAsqPptByPptId(Long pptId);

    /**
     * 查询前台首页幻灯片列表
     * 
     * @param asqPpt 前台首页幻灯片
     * @return 前台首页幻灯片集合
     */
    public List<AsqPpt> selectAsqPptList(AsqPpt asqPpt);

    /**
     * 新增前台首页幻灯片
     * 
     * @param asqPpt 前台首页幻灯片
     * @return 结果
     */
    public int insertAsqPpt(AsqPpt asqPpt);

    /**
     * 修改前台首页幻灯片
     * 
     * @param asqPpt 前台首页幻灯片
     * @return 结果
     */
    public int updateAsqPpt(AsqPpt asqPpt);

    /**
     * 批量删除前台首页幻灯片
     * 
     * @param pptIds 需要删除的前台首页幻灯片主键集合
     * @return 结果
     */
    public int deleteAsqPptByPptIds(Long[] pptIds);

    /**
     * 删除前台首页幻灯片信息
     * 
     * @param pptId 前台首页幻灯片主键
     * @return 结果
     */
    public int deleteAsqPptByPptId(Long pptId);
}
