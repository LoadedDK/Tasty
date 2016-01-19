package com.tasty.member.model;

public class JspData {
	private int totalPage;
	private int startPage;
	private int endPage;
	private int page;
	private int pagesPerGroup;
	
	public JspData() {}
	
	public JspData(int totalPage, int startPage, int endPage, int page, int pagesPerGroup) {
		this.totalPage = totalPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.page = page;
		this.pagesPerGroup = pagesPerGroup;
	}

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
