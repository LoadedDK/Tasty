/*
 * BoardModel에는 LIst<Board> 와 JspData의 
 *정보를 담을 수 있는 변수를 선언한다. 
 */
package com.tasty.board.model;

import java.util.List;

public class BoardModel {
 // 게시판 리스트를 담은 LIst 객체 변수 선언
	private List<Board> list;
	private JspData jspData;
	
	public List<Board> getList() {
		return list;
	}
	public void setList(List<Board> list) {
		this.list = list;
	}
	public JspData getJspData() {
		return jspData;
	}
	public void setJspData(JspData jspData) {
		this.jspData = jspData;
	}
	
}
