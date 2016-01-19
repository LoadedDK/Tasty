package com.tasty.member.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;

public class FindPwService implements ServiceInterface{
	@Override
	public Object service(Object obj) {
		String id = (String) obj;
		
		MemberDao dao = new MemberDao();

		String pw = dao.findId(id);

		return pw;
	}
}
