package com.tasty.member.service;

import java.util.ArrayList;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;

// 회원정보목록 보기
public class MemberIdListService implements ServiceInterface {
	@Override
	public Object service(Object obj) {
		
		MemberDao dao = new MemberDao(); // 회원정보를 불러오면서 출력
		
		ArrayList<String> list = dao.idList();
		
		return list;
	}
}
