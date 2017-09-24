package com.bdk.mapper;

import java.io.Serializable;

/**
 * 参数实体类
 * ClassName: Sysparams 
 * @Description: 
 * @author yuechongwu
 * @date 2017年5月9日上午10:23:47
 */
public class Sysparams implements Serializable{
	
	private static final long serialVersionUID = -2495347883004134240L;
	
	private int id;
	//首页下方左侧按钮
	private String sydb_zcan;
	//首页下方右侧按钮
	private String sydb_ycan;
	//首页底部版权文字
	private String sydb_bqwz;
	//企业文化页面底部按钮文字
	private String qywh_dban;
	//期刊详情页面底部按钮
	private String qkxq_dban;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSydb_zcan() {
		return sydb_zcan;
	}
	public void setSydb_zcan(String sydb_zcan) {
		this.sydb_zcan = sydb_zcan;
	}
	public String getSydb_ycan() {
		return sydb_ycan;
	}
	public void setSydb_ycan(String sydb_ycan) {
		this.sydb_ycan = sydb_ycan;
	}
	public String getSydb_bqwz() {
		return sydb_bqwz;
	}
	public void setSydb_bqwz(String sydb_bqwz) {
		this.sydb_bqwz = sydb_bqwz;
	}
	public String getQywh_dban() {
		return qywh_dban;
	}
	public void setQywh_dban(String qywh_dban) {
		this.qywh_dban = qywh_dban;
	}
	public String getQkxq_dban() {
		return qkxq_dban;
	}
	public void setQkxq_dban(String qkxq_dban) {
		this.qkxq_dban = qkxq_dban;
	}
}