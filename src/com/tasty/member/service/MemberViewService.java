package com.tasty.member.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;
import com.tasty.member.model.Member;

public class MemberViewService implements ServiceInterface {
	@Override
	public Object service(Object obj) {
		String id = (String) obj;
		
		MemberDao dao = new MemberDao();
		
		Member member = dao.view(id);
		
		return member;
	}
}
