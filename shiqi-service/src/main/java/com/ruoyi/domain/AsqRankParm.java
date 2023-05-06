package com.ruoyi.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 排名参数对象 asq_rank_parm
 * 
 * @author ruoyi
 * @date 2022-07-28
 */
public class AsqRankParm extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long rankParmId;

    /** 期刊id */
    @Excel(name = "期刊id")
    private Long bookId;

    /** 阅读数 */
    @Excel(name = "阅读数")
    private Long readNum;

    /** 赞同数 */
    @Excel(name = "赞同数")
    private Long applaudNum;

    /** 评论数 */
    @Excel(name = "评论数")
    private Long commentNum;

    /** 加入书架数 */
    @Excel(name = "加入书架数")
    private Long collectNum;

    public void setRankParmId(Long rankParmId) 
    {
        this.rankParmId = rankParmId;
    }

    public Long getRankParmId() 
    {
        return rankParmId;
    }
    public void setBookId(Long bookId) 
    {
        this.bookId = bookId;
    }

    public Long getBookId() 
    {
        return bookId;
    }
    public void setReadNum(Long readNum) 
    {
        this.readNum = readNum;
    }

    public Long getReadNum() 
    {
        return readNum;
    }
    public void setApplaudNum(Long applaudNum) 
    {
        this.applaudNum = applaudNum;
    }

    public Long getApplaudNum() 
    {
        return applaudNum;
    }
    public void setCommentNum(Long commentNum) 
    {
        this.commentNum = commentNum;
    }

    public Long getCommentNum() 
    {
        return commentNum;
    }
    public void setCollectNum(Long collectNum) 
    {
        this.collectNum = collectNum;
    }

    public Long getCollectNum() 
    {
        return collectNum;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rankParmId", getRankParmId())
            .append("bookId", getBookId())
            .append("readNum", getReadNum())
            .append("applaudNum", getApplaudNum())
            .append("commentNum", getCommentNum())
            .append("collectNum", getCollectNum())
            .toString();
    }
}
