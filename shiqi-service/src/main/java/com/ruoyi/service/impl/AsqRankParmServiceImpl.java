package com.ruoyi.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.AsqRankParmMapper;
import com.ruoyi.domain.AsqRankParm;
import com.ruoyi.service.IAsqRankParmService;

/**
 * 排名参数Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-28
 */
@Service
public class AsqRankParmServiceImpl implements IAsqRankParmService 
{
    @Autowired
    private AsqRankParmMapper asqRankParmMapper;

    /**
     * 查询排名参数
     * 
     * @param rankParmId 排名参数主键
     * @return 排名参数
     */
    @Override
    public AsqRankParm selectAsqRankParmByRankParmId(Long rankParmId)
    {
        return asqRankParmMapper.selectAsqRankParmByRankParmId(rankParmId);
    }

    /**
     * 查询排名参数列表
     * 
     * @param asqRankParm 排名参数
     * @return 排名参数
     */
    @Override
    public List<AsqRankParm> selectAsqRankParmList(AsqRankParm asqRankParm)
    {
        return asqRankParmMapper.selectAsqRankParmList(asqRankParm);
    }

    /**
     * 新增排名参数
     * 
     * @param asqRankParm 排名参数
     * @return 结果
     */
    @Override
    public int insertAsqRankParm(AsqRankParm asqRankParm)
    {
        return asqRankParmMapper.insertAsqRankParm(asqRankParm);
    }

    /**
     * 修改排名参数
     * 
     * @param asqRankParm 排名参数
     * @return 结果
     */
    @Override
    public int updateAsqRankParm(AsqRankParm asqRankParm)
    {
        return asqRankParmMapper.updateAsqRankParm(asqRankParm);
    }

    /**
     * 批量删除排名参数
     * 
     * @param rankParmIds 需要删除的排名参数主键
     * @return 结果
     */
    @Override
    public int deleteAsqRankParmByRankParmIds(Long[] rankParmIds)
    {
        return asqRankParmMapper.deleteAsqRankParmByRankParmIds(rankParmIds);
    }

    /**
     * 删除排名参数信息
     * 
     * @param rankParmId 排名参数主键
     * @return 结果
     */
    @Override
    public int deleteAsqRankParmByRankParmId(Long rankParmId)
    {
        return asqRankParmMapper.deleteAsqRankParmByRankParmId(rankParmId);
    }
}
