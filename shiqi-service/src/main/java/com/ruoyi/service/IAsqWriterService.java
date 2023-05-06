package com.ruoyi.service;

import java.util.List;
import com.ruoyi.domain.AsqWriter;

/**
 * 作者管理Service接口
 * 
 * @author liefox
 * @date 2022-04-25
 */
public interface IAsqWriterService 
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
     * 批量删除作者管理
     * 
     * @param writerIds 需要删除的作者管理主键集合
     * @return 结果
     */
    public int deleteAsqWriterByWriterIds(Long[] writerIds);

    /**
     * 删除作者管理信息
     * 
     * @param writerId 作者管理主键
     * @return 结果
     */
    public int deleteAsqWriterByWriterId(Long writerId);
}
