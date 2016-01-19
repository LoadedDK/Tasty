package com.tasty.member.model;

import java.util.ArrayList;

public class MemberModel {
	private ArrayList<Member> list;
	private JspData jspData;

	public ArrayList<Member> getList() {
		return list;
	}

	public void setList(ArrayList<Member> list) {
		this.list = list;
	}

	public JspData getJspData() {
		return jspData;
	}

	public void setJspData(JspData jspData) {
		this.jspData = jspData;
	}
}
