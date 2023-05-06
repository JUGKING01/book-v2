package com.ruoyi.service;

import java.util.List;
import com.ruoyi.domain.AsqBooks;
import com.ruoyi.domain.AsqBooksRank;

/**
 * 期刊管理Service接口
 *
 * @author ruoyi
 * @date 2022-03-22
 */
public interface IAsqBooksService
{
    /**
     * 查询期刊管理
     *
     * @param bookId 期刊管理主键
     * @return 期刊管理
     */
    public AsqBooks selectAsqBooksByBookId(Long bookId);

    /**
     * 查询期刊管理列表
     *
     * @param asqBooks 期刊管理
     * @return 期刊管理集合
     */
    public List<AsqBooks> selectAsqBooksList(AsqBooks asqBooks);

    /**
     * 新增期刊管理
     *
     * @param asqBooks 期刊管理
     * @return 结果
     */
    public int insertAsqBooks(AsqBooks asqBooks);

    /**
     * 修改期刊管理
     *
     * @param asqBooks 期刊管理
     * @return 结果
     */
    public int updateAsqBooks(AsqBooks asqBooks);

    /**
     * 批量删除期刊管理
     *
     * @param bookIds 需要删除的期刊管理主键集合
     * @return 结果
     */
    public int deleteAsqBooksByBookIds(Long[] bookIds);

    /**
     * 删除期刊管理信息
     *
     * @param bookId 期刊管理主键
     * @return 结果
     */
    public int deleteAsqBooksByBookId(Long bookId);

    public List<AsqBooksRank> readAllRank();
}
