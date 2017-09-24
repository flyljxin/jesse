package com.bdk.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdk.mapper.Article;

/**
 * 期刊文章管理Dao
 * ClassName: IArticleDao 
 * @Description: 
 * @author yuechongwu
 * @date 2017年5月11日下午3:36:40
 */
public interface IArticleDao {

	/**
	 * 获取所有文章对象
	 * @Description:
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:18:03
	 * @version:1.0.0
	 */
	public List<Article> findAll();

	/**
	 * 根据id获取文章对象
	 * @Description: 
	 * @param id
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:18:32
	 * @version:1.0.0
	 */
	public Article findId(int id);

	/**
	 * 根据ID修改文章对象
	 * @Description: 
	 * @param id
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:18:49
	 * @version:1.0.0
	 */
	public void updateArticle(Article article);
	
	/**
	 * 增加文章对象
	 * @Description:
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:43:40
	 * @version:1.0.0
	 */
	public void insertArticle(Article article);
	
	/**
	 * 删除文章
	 * @Description:
	 * @param id
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月17日上午11:40:13
	 * @version:1.0.0
	 */
	public void delById(int id);
	
	/**
	 * 分页查询期刊文章内容
	 * @Description:
	 * @param article
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月17日下午3:45:21
	 * @version:1.0.0
	 */
	public List<Article> queryArticleList(@Param("article")Article article, @Param("pageStart")int pageStart, @Param("pageSize")int pageSize);
	
	/**
	 * 根据条件查询期刊文章总条数
	 * @Description:
	 * @param article
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月17日下午4:45:23
	 * @version:1.0.0
	 */
	public int queryTotal(@Param("article")Article article);
	
	/**
	 * 前台分页查询期刊文章内容
	 * @Description: 
	 * @param article
	 * @param pageStart
	 * @param pageSize
	 * @return
	 * @author 岳崇武
	 * @date 2017年6月8日下午5:40:27
	 * @version:1.0.0
	 */
	public List<Article> queryArticleListH5(@Param("article")Article article, @Param("pageStart")int pageStart, @Param("pageSize")int pageSize);
}
