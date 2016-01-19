//package com.tasty.member.service;
//
//import com.tasty.controller.ServiceInterface;
//import com.tasty.member.dao.MemberDao;
//import com.tasty.member.model.Login;
//
//// 로그인 서비스
//public class LoginService implements ServiceInterface {
//	@Override
//	public Object service(Object obj) {
//		MemberDao dao = new MemberDao();
//		
//		Login login;
//		
//		login = dao.login(member.getId(), member.getPw()); // 로그인 실행
//		
//		Login.id = login.getId();
//		Login.name = login.getName();
//		Login.grade = login.getGrade();
//		
//		return null;
//	}
//}
