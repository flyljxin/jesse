package com.bdk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdk.mapper.Periodcal;

public interface IPeriodcalService {

	/**
	 * 获取所有期刊对象
	 * @Description: 
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:22:57
	 * @version:1.0.0
	 */
	public List<Periodcal> findAll();
	
	/**
	 * 获取最新的所属期刊列表  （前五条）
	 * @Description:
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月25日上午11:52:53
	 * @version:1.0.0
	 */
	public List<Periodcal> findList();
	
	/**
	 * 根据ID获取期刊对象
	 * @Description: 
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:24:14
	 * @version:1.0.0
	 */
	public Periodcal findById(int id);
	
	/**
	 * 根据ID修改期刊对象
	 * @Description: 
	 * @param id
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:25:46
	 * @version:1.0.0
	 */
	public void updatePeriodcal(Periodcal periodcal);
	
	/**
	 * 增加期刊对象
	 * @Description: 
	 * @param periodcal
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:52:20
	 * @version:1.0.0
	 */
	public void insertPeriodcal(Periodcal periodcal);
	
	/**
	 * 根据期刊号获取期刊对象
	 * @Description: 
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:24:14
	 * @version:1.0.0
	 */
	public Periodcal findByQknum(String qknum);
	
	/**
	 * 根据条件查询期刊列表
	 * @Description:
	 * @param queryString
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月15日下午2:51:17
	 * @version:1.0.0
	 */
	public List<Periodcal> queryPeriodcalList(String periodcalName,String qkNo, int pageNo, int pageSize);
	
	/**
	 * 根据条件查询期刊列表总数
	 * @Description:
	 * @param periodcalName
	 * @param qknum
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月15日下午5:06:50
	 * @version:1.0.0
	 */
	public int queryTotal(String periodcalName, String qknum);
	/**
	 * 查看更多期刊
	 * @Description:
	 * @param id
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月18日下午5:44:28
	 * @version:1.0.0
	 */
	public List<Periodcal> findMore(int pageNo, int pageSize);
	
	/**
	 * 查看更多期刊总数
	 * @Description:
	 * @param id
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月18日下午5:44:28
	 * @version:1.0.0
	 */
	public int findMoreTotal();
	
	/**
	 * 发布期刊
	 * @Description:
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月19日下午3:42:21
	 * @version:1.0.0
	 */
	public void releasePeriodcal(int id);
	
	/**
	 * @Description: 获取最新一期期刊
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月23日上午11:28:13
	 * @version:1.0.0
	 */
	public Periodcal getLatestPeriodcal();

	/**
	 * 取消发布
	 * @Description: 
	 * @param parseInt
	 * @author 岳崇武
	 * @date 2017年5月31日上午10:10:48
	 * @version:1.0.0
	 */
	public void cancelReleasePeriodcal(int parseInt);
}
