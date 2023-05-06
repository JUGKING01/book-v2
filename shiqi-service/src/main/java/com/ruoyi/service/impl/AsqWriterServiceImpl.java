package com.ruoyi.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.AsqWriterMapper;
import com.ruoyi.domain.AsqWriter;
import com.ruoyi.service.IAsqWriterService;

/**
 * 作者管理Service业务层处理
 * 
 * @author liefox
 * @date 2022-04-25
 */
@Service
public class AsqWriterServiceImpl implements IAsqWriterService 
{
    @Autowired
    private AsqWriterMapper asqWriterMapper;

    /**
     * 查询作者管理
     * 
     * @param writerId 作者管理主键
     * @return 作者管理
     */
    @Override
    public AsqWriter selectAsqWriterByWriterId(Long writerId)
    {
        return asqWriterMapper.selectAsqWriterByWriterId(writerId);
    }

    /**
     * 查询作者管理列表
     * 
     * @param asqWriter 作者管理
     * @return 作者管理
     */
    @Override
    public List<AsqWriter> selectAsqWriterList(AsqWriter asqWriter)
    {
        return asqWriterMapper.selectAsqWriterList(asqWriter);
    }

    /**
     * 新增作者管理
     * 
     * @param asqWriter 作者管理
     * @return 结果
     */
    @Override
    public int insertAsqWriter(AsqWriter asqWriter)
    {
        return asqWriterMapper.insertAsqWriter(asqWriter);
    }

    /**
     * 修改作者管理
     * 
     * @param asqWriter 作者管理
     * @return 结果
     */
    @Override
    public int updateAsqWriter(AsqWriter asqWriter)
    {
        return asqWriterMapper.updateAsqWriter(asqWriter);
    }

    /**
     * 批量删除作者管理
     * 
     * @param writerIds 需要删除的作者管理主键
     * @return 结果
     */
    @Override
    public int deleteAsqWriterByWriterIds(Long[] writerIds)
    {
        return asqWriterMapper.deleteAsqWriterByWriterIds(writerIds);
    }

    /**
     * 删除作者管理信息
     * 
     * @param writerId 作者管理主键
     * @return 结果
     */
    @Override
    public int deleteAsqWriterByWriterId(Long writerId)
    {
        return asqWriterMapper.deleteAsqWriterByWriterId(writerId);
    }
}
