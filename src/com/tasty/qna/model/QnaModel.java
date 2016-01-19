package com.tasty.qna.model;

import java.util.List;

import com.tasty.qna.model.JspData;

public class QnaModel {
	
	private List<Qna> list;
	private JspData jspData;
	
	public List<Qna> getList() {
		return list;
	}
	
	public void setList(List<Qna> list) {
		this.list = list;
	}
	
	public JspData getJspData() {
		return jspData;
	}
	
	public void setJspData(JspData jspData) {
		this.jspData = jspData;
	}
	
}
