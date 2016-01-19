/*
 * jsp 화면에서 표시할때 필요한 데이터들
 */
package com.tasty.qna.model;

public class JspData {
	private int totalPage;
	private int startPage, endPage;
	private int page, pagesPerGroup;

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPagesPerGroup() {
		return pagesPerGroup;
	}

	public void setPagesPerGroup(int pagesPerGroup) {
		this.pagesPerGroup = pagesPerGroup;
	}

	@Override
	public String toString() {
		return "JspData [totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage + ", page="
				+ page + ", pagesPerGroup=" + pagesPerGroup + "]";
	}
	
}