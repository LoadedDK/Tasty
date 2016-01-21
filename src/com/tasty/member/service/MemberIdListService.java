package com.tasty.member.service;

import java.util.ArrayList;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;

public class MemberIdListService implements ServiceInterface {
	@Override
	public Object service(Object obj) {
		
		MemberDao dao = new MemberDao();
		
		ArrayList<String> list = dao.idList();
		
		return list;
	}
}
