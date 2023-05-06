package com.ruoyi.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 期刊管理对象 asq_books
 *
 * @author ruoyi
 * @date 2022-03-22
 */
public class AsqBooks extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long bookId;

    /** 期刊作者姓名 */
    @Excel(name = "期刊作者姓名")
    private String bookWriterName;

    /** 期刊名 */
    @Excel(name = "期刊名")
    private String bookName;

    /** 期刊类型 */
    @Excel(name = "期刊类型")
    private String bookType;

    /** 出版日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出版日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bookPubDate;

    /** 上传日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上传日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date bookUpDate;

    /** 出版社 */
    @Excel(name = "出版社")
    private String bookPress;

    /** 期刊封面 */
    @Excel(name = "期刊封面")
    private String bookCover;

    /** 期刊的pdf */
    private String bookPdfUrl;

    /** 期刊的审核
     *  0 待审核
     *  1 审核成功
     *  2 审核失败
     * */
    private Integer bookAudit;


    public String getBookPdfUrl() {
        return bookPdfUrl;
    }

    public void setBookPdfUrl(String bookPdfUrl) {
        this.bookPdfUrl = bookPdfUrl;
    }

    public Integer getBookAudit() {
        return bookAudit;
    }

    public void setBookAudit(Integer bookAudit) {
        this.bookAudit = bookAudit;
    }

    public void setBookId(Long bookId)
    {
        this.bookId = bookId;
    }

    public Long getBookId()
    {
        return bookId;
    }
    public void setBookWriterName(String bookWriterName)
    {
        this.bookWriterName = bookWriterName;
    }

    public String getBookWriterName()
    {
        return bookWriterName;
    }
    public void setBookName(String bookName)
    {
        this.bookName = bookName;
    }

    public String getBookName()
    {
        return bookName;
    }
    public void setBookType(String bookType)
    {
        this.bookType = bookType;
    }

    public String getBookType()
    {
        return bookType;
    }
    public void setBookPubDate(Date bookPubDate)
    {
        this.bookPubDate = bookPubDate;
    }

    public Date getBookPubDate()
    {
        return bookPubDate;
    }
    public void setBookUpDate(Date bookUpDate)
    {
        this.bookUpDate = bookUpDate;
    }

    public Date getBookUpDate()
    {
        return bookUpDate;
    }
    public void setBookPress(String bookPress)
    {
        this.bookPress = bookPress;
    }

    public String getBookPress()
    {
        return bookPress;
    }
    public void setBookCover(String bookCover)
    {
        this.bookCover = bookCover;
    }

    public String getBookCover()
    {
        return bookCover;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("bookId", getBookId())
            .append("bookWriterName", getBookWriterName())
            .append("bookName", getBookName())
            .append("bookType", getBookType())
            .append("bookPubDate", getBookPubDate())
            .append("bookUpDate", getBookUpDate())
            .append("bookPress", getBookPress())
            .append("bookCover", getBookCover())
            .toString();
    }
}
