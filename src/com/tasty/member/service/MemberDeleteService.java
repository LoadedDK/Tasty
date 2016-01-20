package com.tasty.member.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;

public class MemberDeleteService implements ServiceInterface {
	@Override
	public Object service(Object obj) {
		MemberDao dao = new MemberDao();
		String id = (String) obj;
		int state = 0;
		
		state = dao.delete(id);
		
		return state;
	}
}
