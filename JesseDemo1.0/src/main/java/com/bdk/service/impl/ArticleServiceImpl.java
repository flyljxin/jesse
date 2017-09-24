package com.bdk.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bdk.dao.IArticleDao;
import com.bdk.mapper.Article;
import com.bdk.service.IArticleService;

@Service("articleService")
public class ArticleServiceImpl implements IArticleService {

	@Resource
	private IArticleDao articleDao;

	@Override
	public List<Article> findAll() {
		return articleDao.findAll();
	}

	@Override
	public Article findId(int id) {
		return articleDao.findId(id);
	}

	@Override
	public void updateArticle(Article article) {
		articleDao.updateArticle(article);
	}

	@Override
	public void insertArticle(Article article) {
		articleDao.insertArticle(article);
	}

	@Override
	public void delById(int id) {
		articleDao.delById(id);
	}

	@Override
	public List<Article> queryArticleList(Article article, int pageNo, int pageSize) {
		 List<Article> artices=articleDao.queryArticleList(article, (pageNo-1)*pageSize, pageSize);
		//过滤html标签
		 for (int i = 0; i < artices.size(); i++) {
				 String artc=artices.get(i).getWzinfo().replaceAll("<.*?>", "").replaceAll("\\s*|\t|\r|\n", "").replaceAll("&nbsp;", "");
				 if(artc != null && artc.length() > 20)
              {
					// System.out.println(artc.length());
                  artc = artc.substring(0, 20) + "......";
              }
				 artices.get(i).setWzinfo(artc);
			}
		return artices;
	}

	@Override
	public int queryTotal(Article article) {
		return articleDao.queryTotal(article);
	}

	@Override
	public List<Article> queryArticleListH5(Article article, int pageNo,
			int pageSize) {
		 List<Article> artices=articleDao.queryArticleListH5(article, (pageNo-1)*pageSize, pageSize);
			//过滤html标签
			 for (int i = 0; i < artices.size(); i++) {
					/* String artc=artices.get(i).getWzinfo().replaceAll("<.*?>", "").replaceAll("\\s*|\t|\r|\n", "").replaceAll("&nbsp;", "");*/
				 String artc=artices.get(i).getTitle();
					 if(artc != null && artc.length() > 35)
	              {
						// System.out.println(artc.length());
	                  artc = artc.substring(0, 35) + "......";
	              }
					 artices.get(i).setTitle(artc);
				}
			return artices;
	}
}
