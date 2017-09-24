package com.bdk.dao;

import java.util.List;

import com.bdk.mapper.Artype;

/**
 * 板块类型管理
 * ClassName: IArtypeDao 
 * @Description: 
 * @author ChenQuan
 * @date 2017年5月11日上午10:02:12
 */
public interface IArtypeDao {
	
	/**
	 * 获取所有类型
	 * @Description:
	 * @return
	 * @author ChenQuan
	 * @date 2017年5月11日上午10:03:48
	 * @version:1.0.0
	 */
	public List<Artype> getAllType();
	
	
	/**
	 * 根据code获取type对象
	 * @Description:
	 * @param code
	 * @return
	 * @author ChenQuan
	 * @date 2017年5月11日上午10:05:01
	 * @version:1.0.0
	 */
	public Artype getType(int code);
	
	/**
	 * 修改类型名称
	 * @Description:
	 * @param code
	 * @author ChenQuan
	 * @date 2017年5月11日上午10:04:50
	 * @version:1.0.0
	 */
	public void  updateType(Artype artype);

}
