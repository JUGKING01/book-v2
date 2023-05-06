package com.ruoyi.service.impl;

import java.util.List;

import com.ruoyi.domain.AsqBooksRank;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.mapper.AsqBooksMapper;
import com.ruoyi.domain.AsqBooks;
import com.ruoyi.service.IAsqBooksService;

/**
 * 期刊管理Service业务层处理
 *
 * @author ruoyi
 * @date 2022-03-22
 */
@Service
public class AsqBooksServiceImpl implements IAsqBooksService
{
    @Autowired
    private AsqBooksMapper asqBooksMapper;

    /**
     * 查询期刊管理
     *
     * @param bookId 期刊管理主键
     * @return 期刊管理
     */
    @Override
    public AsqBooks selectAsqBooksByBookId(Long bookId)
    {
        return asqBooksMapper.selectAsqBooksByBookId(bookId);
    }

    /**
     * 查询期刊管理列表
     *
     * @param asqBooks 期刊管理
     * @return 期刊管理
     */
    @Override
    public List<AsqBooks> selectAsqBooksList(AsqBooks asqBooks)
    {
        return asqBooksMapper.selectAsqBooksList(asqBooks);
    }

    /**
     * 新增期刊管理
     *
     * @param asqBooks 期刊管理
     * @return 结果
     */
    @Override
    public int insertAsqBooks(AsqBooks asqBooks)
    {
        return asqBooksMapper.insertAsqBooks(asqBooks);
    }

    /**
     * 修改期刊管理
     *
     * @param asqBooks 期刊管理
     * @return 结果
     */
    @Override
    public int updateAsqBooks(AsqBooks asqBooks)
    {
        return asqBooksMapper.updateAsqBooks(asqBooks);
    }

    /**
     * 批量删除期刊管理
     *
     * @param bookIds 需要删除的期刊管理主键
     * @return 结果
     */
    @Override
    public int deleteAsqBooksByBookIds(Long[] bookIds)
    {
        return asqBooksMapper.deleteAsqBooksByBookIds(bookIds);
    }

    /**
     * 删除期刊管理信息
     *
     * @param bookId 期刊管理主键
     * @return 结果
     */
    @Override
    public int deleteAsqBooksByBookId(Long bookId)
    {
        return asqBooksMapper.deleteAsqBooksByBookId(bookId);
    }

    @Override
    public List<AsqBooksRank> readAllRank() {
        return asqBooksMapper.readAllRank();
    }
}
