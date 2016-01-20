package com.tasty.member.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;

public class FindPwService implements ServiceInterface{
	@Override
	public Object service(Object obj) {
		String[] req = (String[]) obj;
		
		MemberDao dao = new MemberDao();

		String pw = dao.findPw(req[0], req[1]);

		return pw;
	}
}
