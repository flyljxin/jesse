package com.bdk.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bdk.mapper.Article;

/**
 * 期刊文章对象实现
 * ClassName: IArticleService 
 * @Description:
 * @author yuechongwu
 * @date 2017年5月11日下午4:07:51
 */
public interface IArticleService {

	/**
	 * 获取所有文章对象
	 * @Description:
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:08:50
	 * @version:1.0.0
	 */
	public List<Article> findAll();
	
	/**
	 * 根据ID获取文章对象
	 * @Description:
	 * @param id
	 * @return
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:10:24
	 * @version:1.0.0
	 */
	public Article findId(int id);
	
	/**
	 * 修改文章对象
	 * @Description: 
	 * @param id
	 * @author 岳崇武
	 * @date 2017年5月11日下午4:11:46
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
	 * @Description:
	 * @param qknum
	 * @param title
	 * @param artype
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年5月17日下午3:26:18
	 * @version:1.0.0
	 */
	public List<Article> queryArticleList(Article article, int pageNo, int pageSize);
	
	/**
	 * @Description:
	 * @param qknum
	 * @param title
	 * @param artype
	 * @return
	 * @return
	 * @author Wu Jingde
	 * @date 2017年6月5日下午3:12
	 * @version:1.0.0
	 */
	public List<Article> queryArticleListH5(Article article, int pageNo, int pageSize);
	
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
}
