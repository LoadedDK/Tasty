package com.tasty.member.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;
import com.tasty.member.model.Login;

// 로그인 서비스
public class LoginService implements ServiceInterface {
	@Override
	public Object service(Object obj) {
		Login login= (Login) obj;
		
		MemberDao dao = new MemberDao();
		
		login = dao.login(login.getId(), login.getPw());
		login.setPw(null);
		
		return login;
	}
}
