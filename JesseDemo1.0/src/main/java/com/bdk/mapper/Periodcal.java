package com.bdk.mapper;

import java.io.Serializable;
import java.util.Date;

/**
 * 期刊大刚对象
 * ClassName: Periodcal 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月11日上午9:40:12
 */
public class Periodcal implements Serializable{

	private static final long serialVersionUID = -6371258520442215096L;
	
	private int id;
	
	/**
	 * 报刊期号
	 */
	private int qknum;
	/**
	 * 期刊名称
	 */
	private String qkname;
	
	/**
	 * 是否设置为最新
	 */
	private IS_NEWEST isnew;
	
	/**
	 * 是否已发布
	 */
	private IS_RELEASE isrelease;
	
	/**
	 * 期刊添加时间
	 */
    private Date createtime;
	
	/**
	 * 期刊发行时间
	 */
    private Date releasetime;
    
    /**
     * 最新头条版文章标题
     */
    private String actitle;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getQknum() {
		return qknum;
	}

	public void setQknum(int qknum) {
		this.qknum = qknum;
	}

	public String getQkname() {
		return qkname;
	}

	public void setQkname(String qkname) {
		this.qkname = qkname;
	}

	public IS_NEWEST getIsnew() {
		return isnew;
	}

	public void setIsnew(IS_NEWEST isnew) {
		this.isnew = isnew;
	}

	public Date getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}

	public IS_RELEASE getIsrelease() {
		return isrelease;
	}

	public void setIsrelease(IS_RELEASE isrelease) {
		this.isrelease = isrelease;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getActitle() {
		return actitle;
	}

	public void setActitle(String actitle) {
		this.actitle = actitle;
	}
}
