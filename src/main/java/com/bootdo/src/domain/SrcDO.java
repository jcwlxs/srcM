package com.bootdo.src.domain;

import java.io.Serializable;
import java.util.Date;


/**
 * @author ljz
 * @email 1992lcg@163.com
 * @date 2017-12-16 22:48:07
 */
public class SrcDO implements Serializable {
    private static final long serialVersionUID = 1L;

    //
    private Long id;
    //
    private String name;
    //
    private String imgUrl;
    //
    private String link;
    //
    private String introduction;
    //
    private Date gmtCreate;
    //
    private Date gmtModified;

    /**
     * 设置：
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 获取：
     */
    public Long getId() {
        return id;
    }

    /**
     * 设置：
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取：
     */
    public String getName() {
        return name;
    }

    /**
     * 设置：
     */
    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    /**
     * 获取：
     */
    public String getImgUrl() {
        return imgUrl;
    }


    /**
     * 设置：
     */
    public void setLink(String link) {
        this.link = link;
    }

    /**
     * 获取：
     */
    public String getLink() {
        return link;
    }

    /**
     * 设置：
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * 获取：
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * 设置：
     */
    public void setGmtCreate(Date gmtCreate) {
        this.gmtCreate = gmtCreate;
    }

    /**
     * 获取：
     */
    public Date getGmtCreate() {
        return gmtCreate;
    }

    /**
     * 设置：
     */
    public void setGmtModified(Date gmtModified) {
        this.gmtModified = gmtModified;
    }

    /**
     * 获取：
     */
    public Date getGmtModified() {
        return gmtModified;
    }
}
