package com.ruoyi.service;

import java.util.List;
import com.ruoyi.domain.AsqRankParm;

/**
 * 排名参数Service接口
 * 
 * @author ruoyi
 * @date 2022-07-28
 */
public interface IAsqRankParmService 
{
    /**
     * 查询排名参数
     * 
     * @param rankParmId 排名参数主键
     * @return 排名参数
     */
    public AsqRankParm selectAsqRankParmByRankParmId(Long rankParmId);

    /**
     * 查询排名参数列表
     * 
     * @param asqRankParm 排名参数
     * @return 排名参数集合
     */
    public List<AsqRankParm> selectAsqRankParmList(AsqRankParm asqRankParm);

    /**
     * 新增排名参数
     * 
     * @param asqRankParm 排名参数
     * @return 结果
     */
    public int insertAsqRankParm(AsqRankParm asqRankParm);

    /**
     * 修改排名参数
     * 
     * @param asqRankParm 排名参数
     * @return 结果
     */
    public int updateAsqRankParm(AsqRankParm asqRankParm);

    /**
     * 批量删除排名参数
     * 
     * @param rankParmIds 需要删除的排名参数主键集合
     * @return 结果
     */
    public int deleteAsqRankParmByRankParmIds(Long[] rankParmIds);

    /**
     * 删除排名参数信息
     * 
     * @param rankParmId 排名参数主键
     * @return 结果
     */
    public int deleteAsqRankParmByRankParmId(Long rankParmId);
}
