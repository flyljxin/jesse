package com.bdk.conmon;

/**
 * 分页查询公共类
 * @Description:
 * @return
 * @author Wu Jingde
 * @date 2017年6月2日上午9:43:26
 * @version:1.0.0
 */
public class PageEntity {
	private int currPage=1; //当前页
	
	private int pageNums=5; //每页条数

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageNums() {
		return pageNums;
	}

	public void setPageNums(int pageNums) {
		this.pageNums = pageNums;
	}
}
