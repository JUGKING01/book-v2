package com.ruoyi.mapper;

import java.util.List;
import com.ruoyi.domain.AsqWriter;

/**
 * 作者管理Mapper接口
 * 
 * @author liefox
 * @date 2022-04-25
 */
public interface AsqWriterMapper 
{
    /**
     * 查询作者管理
     * 
     * @param writerId 作者管理主键
     * @return 作者管理
     */
    public AsqWriter selectAsqWriterByWriterId(Long writerId);

    /**
     * 查询作者管理列表
     * 
     * @param asqWriter 作者管理
     * @return 作者管理集合
     */
    public List<AsqWriter> selectAsqWriterList(AsqWriter asqWriter);

    /**
     * 新增作者管理
     * 
     * @param asqWriter 作者管理
     * @return 结果
     */
    public int insertAsqWriter(AsqWriter asqWriter);

    /**
     * 修改作者管理
     * 
     * @param asqWriter 作者管理
     * @return 结果
     */
    public int updateAsqWriter(AsqWriter asqWriter);

    /**
     * 删除作者管理
     * 
     * @param writerId 作者管理主键
     * @return 结果
     */
    public int deleteAsqWriterByWriterId(Long writerId);

    /**
     * 批量删除作者管理
     * 
     * @param writerIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAsqWriterByWriterIds(Long[] writerIds);
}
