package com.bdk.mapper;

import java.io.Serializable;


/**
 * 图标实体
 * ClassName: Sysimages 
 * @Description: 
 * @author yuechongwu
 * @date 2017年5月10日下午2:04:15
 */
public class Sysimages implements Serializable{

	/**
	 * @Fields serialVersionUID 
	 */
	private static final long serialVersionUID = -465870154887616171L;
	
	private int id;
	//封面整张图片
	private String fmtp_info;
	//系统通用顶部log图片
	private String sys_logo;
	//首页底部LOGO
	private String sydb_logo;
	//弹出二维码
	private String tc_twocode;
	//企业文化整张图片
	private String qywh_info;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSys_logo() {
		return sys_logo;
	}
	public void setSys_logo(String sys_logo) {
		this.sys_logo = sys_logo;
	}
	public String getSydb_logo() {
		return sydb_logo;
	}
	public void setSydb_logo(String sydb_logo) {
		this.sydb_logo = sydb_logo;
	}
	public String getTc_twocode() {
		return tc_twocode;
	}
	public void setTc_twocode(String tc_twocode) {
		this.tc_twocode = tc_twocode;
	}
	public String getQywh_info() {
		return qywh_info;
	}
	public void setQywh_info(String qywh_info) {
		this.qywh_info = qywh_info;
	}
	public String getFmtp_info() {
		return fmtp_info;
	}
	public void setFmtp_info(String fmtp_info) {
		this.fmtp_info = fmtp_info;
	}
}
