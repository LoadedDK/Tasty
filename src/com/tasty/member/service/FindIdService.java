package com.tasty.member.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;

public class FindIdService implements ServiceInterface{
	@Override
	public Object service(Object obj) {
		String email = (String) obj;
		
		MemberDao dao = new MemberDao();

		String id = dao.findId(email);

		return id;
	}
}
