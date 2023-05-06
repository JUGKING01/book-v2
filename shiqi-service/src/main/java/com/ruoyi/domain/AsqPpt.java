package com.ruoyi.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 前台首页幻灯片对象 asq_ppt
 * 
 * @author ruoyi
 * @date 2022-07-24
 */
public class AsqPpt extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long pptId;

    /** 名称 */
    @Excel(name = "名称")
    private String pptName;

    /** 图片 */
    @Excel(name = "图片")
    private String pptPic;

    /** 跳转路径 */
    @Excel(name = "跳转路径")
    private String pptUrl;

    /** 排序 */
    @Excel(name = "排序")
    private Long pptDesc;

    /** 类型 */
    @Excel(name = "类型")
    private Long pptType;

    public void setPptId(Long pptId) 
    {
        this.pptId = pptId;
    }

    public Long getPptId() 
    {
        return pptId;
    }
    public void setPptName(String pptName) 
    {
        this.pptName = pptName;
    }

    public String getPptName() 
    {
        return pptName;
    }
    public void setPptPic(String pptPic) 
    {
        this.pptPic = pptPic;
    }

    public String getPptPic() 
    {
        return pptPic;
    }
    public void setPptUrl(String pptUrl) 
    {
        this.pptUrl = pptUrl;
    }

    public String getPptUrl() 
    {
        return pptUrl;
    }
    public void setPptDesc(Long pptDesc) 
    {
        this.pptDesc = pptDesc;
    }

    public Long getPptDesc() 
    {
        return pptDesc;
    }
    public void setPptType(Long pptType) 
    {
        this.pptType = pptType;
    }

    public Long getPptType() 
    {
        return pptType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("pptId", getPptId())
            .append("pptName", getPptName())
            .append("pptPic", getPptPic())
            .append("pptUrl", getPptUrl())
            .append("pptDesc", getPptDesc())
            .append("pptType", getPptType())
            .toString();
    }
}
