package com.bdk.mapper;

import java.io.Serializable;
import java.util.Date;

import com.bdk.conmon.PageEntity;

/**
 * 期刊文章对象
 * ClassName: Article 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月11日上午9:53:25
 */
public class Article extends PageEntity implements Serializable{

	private static final long serialVersionUID = -2062986295080294616L;
	
	// 文章id 自增
	private int id;
	/**
	 * 关联期刊id 参考 periocal表id
	 */
	private String qkid;
	/**
	 * 参考 periocal表qknum
	 */
	private String qknum;
	
	/**
	 * 参考 periocal表qkname
	 */
	private String qkname;
	
	/**
	 * 参考 periocal表releasetime 发行时间
	 */
	private String releasetime;
	/**
	 * 参考 periocal表releasetime 是否发布 Y、N
	 */
	private String isrelease;
	
	/**
	 * 文章标题
	 */
	private String title;
	
	/**
	 * 文章主图路径
	 */
	private String wzimage;
	
	/**
	 * 文章内容
	 */
	private String wzinfo;
	
	/**
	 * 文章类型编码，对应Artype中code
	 */
	private String type;
	
	/**
	 * 文章类型名称，对应Artype中type
	 */
	private String typename;

	/**
	 * 录入时间
	 */
	private Date writetime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWzimage() {
		return wzimage;
	}

	public void setWzimage(String wzimage) {
		this.wzimage = wzimage;
	}

	public String getWzinfo() {
		return wzinfo;
	}

	public void setWzinfo(String wzinfo) {
		this.wzinfo = wzinfo;
	}


	public Date getWritetime() {
		return writetime;
	}

	public void setWritetime(Date writetime) {
		this.writetime = writetime;
	}

	public String getQkid() {
		return qkid;
	}

	public void setQkid(String qkid) {
		this.qkid = qkid;
	}

	public String getQknum() {
		return qknum;
	}

	public void setQknum(String qknum) {
		this.qknum = qknum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getQkname() {
		return qkname;
	}

	public void setQkname(String qkname) {
		this.qkname = qkname;
	}
	public String getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(String releasetime) {
		this.releasetime = releasetime;
	}
	public String getIsrelease() {
		return isrelease;
	}

	public void setIsrelease(String isrelease) {
		this.isrelease = isrelease;
	}

	public String getTypename() {
		return typename;
	}

	public void setTypename(String typename) {
		this.typename = typename;
	}
}
