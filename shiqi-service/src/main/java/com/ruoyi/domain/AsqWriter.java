package com.ruoyi.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 作者管理对象 asq_writer
 * 
 * @author liefox
 * @date 2022-04-25
 */
public class AsqWriter extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long writerId;

    /** 作者姓名 */
    @Excel(name = "作者姓名")
    private String writerName;

    /** 作者详情 */
    @Excel(name = "作者详情")
    private String writerInfo;

    /** 作者座右铭 */
    @Excel(name = "作者座右铭")
    private String writerIntro;

    /** 作者头像 */
    @Excel(name = "作者头像")
    private String writerPic;

    public void setWriterId(Long writerId) 
    {
        this.writerId = writerId;
    }

    public Long getWriterId() 
    {
        return writerId;
    }
    public void setWriterName(String writerName) 
    {
        this.writerName = writerName;
    }

    public String getWriterName() 
    {
        return writerName;
    }
    public void setWriterInfo(String writerInfo) 
    {
        this.writerInfo = writerInfo;
    }

    public String getWriterInfo() 
    {
        return writerInfo;
    }
    public void setWriterIntro(String writerIntro) 
    {
        this.writerIntro = writerIntro;
    }

    public String getWriterIntro() 
    {
        return writerIntro;
    }
    public void setWriterPic(String writerPic) 
    {
        this.writerPic = writerPic;
    }

    public String getWriterPic() 
    {
        return writerPic;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("writerId", getWriterId())
            .append("writerName", getWriterName())
            .append("writerInfo", getWriterInfo())
            .append("writerIntro", getWriterIntro())
            .append("writerPic", getWriterPic())
            .toString();
    }
}
