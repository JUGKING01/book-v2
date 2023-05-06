package com.ruoyi.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.AsqPptMapper;
import com.ruoyi.domain.AsqPpt;
import com.ruoyi.service.IAsqPptService;

/**
 * 前台首页幻灯片Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-24
 */
@Service
public class AsqPptServiceImpl implements IAsqPptService 
{
    @Autowired
    private AsqPptMapper asqPptMapper;

    /**
     * 查询前台首页幻灯片
     * 
     * @param pptId 前台首页幻灯片主键
     * @return 前台首页幻灯片
     */
    @Override
    public AsqPpt selectAsqPptByPptId(Long pptId)
    {
        return asqPptMapper.selectAsqPptByPptId(pptId);
    }

    /**
     * 查询前台首页幻灯片列表
     * 
     * @param asqPpt 前台首页幻灯片
     * @return 前台首页幻灯片
     */
    @Override
    public List<AsqPpt> selectAsqPptList(AsqPpt asqPpt)
    {
        return asqPptMapper.selectAsqPptList(asqPpt);
    }

    /**
     * 新增前台首页幻灯片
     * 
     * @param asqPpt 前台首页幻灯片
     * @return 结果
     */
    @Override
    public int insertAsqPpt(AsqPpt asqPpt)
    {
        return asqPptMapper.insertAsqPpt(asqPpt);
    }

    /**
     * 修改前台首页幻灯片
     * 
     * @param asqPpt 前台首页幻灯片
     * @return 结果
     */
    @Override
    public int updateAsqPpt(AsqPpt asqPpt)
    {
        return asqPptMapper.updateAsqPpt(asqPpt);
    }

    /**
     * 批量删除前台首页幻灯片
     * 
     * @param pptIds 需要删除的前台首页幻灯片主键
     * @return 结果
     */
    @Override
    public int deleteAsqPptByPptIds(Long[] pptIds)
    {
        return asqPptMapper.deleteAsqPptByPptIds(pptIds);
    }

    /**
     * 删除前台首页幻灯片信息
     * 
     * @param pptId 前台首页幻灯片主键
     * @return 结果
     */
    @Override
    public int deleteAsqPptByPptId(Long pptId)
    {
        return asqPptMapper.deleteAsqPptByPptId(pptId);
    }
}
