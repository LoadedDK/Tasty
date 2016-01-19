package com.tasty.member.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;
import com.tasty.member.model.Member;

public class MemberWriteService implements ServiceInterface {
	@Override
	public Object service(Object obj) {
		
		Member member = (Member) obj;
		
		MemberDao dao = new MemberDao();
		
		dao.write(member);
		
		return null;
	}
}
