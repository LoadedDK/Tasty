package com.tasty.member.service;

import java.util.ArrayList;

import com.tasty.controller.ServiceInterface;
import com.tasty.member.dao.MemberDao;
import com.tasty.member.model.JspData;
import com.tasty.member.model.Member;
import com.tasty.member.model.MemberModel;

// 회원정보목록 보기
public class MemberListService implements ServiceInterface {
	@Override
	public Object service(Object obj) {
		
		int page = (Integer) obj;
		int totalPage = 0; // 전체 페이지 = (전체글수-1) / 페이지당글수+1
		int totalRow = 0; // 전체 글수 = DB에서 가져온다. DAO의 메소드 호출
		int rowsPerPage = 3; // 한페이지에 보여줄 글의 개수
		int startRow = 0; // DB에서 가져올 글의 첫번째 순서(rownum) 번호
		int endRow = 0; // DB에서 가져올 글의 마지막 순서(rownum) 번호
		int pagesPerGroup = 3; // 한화면에 나타날 페이지의 갯수
		int startPage = 0; // 화면에 처음 시작하는 페이지
		int endPage = 0; // 화면에 나타나는 끝페이지
		
		MemberDao dao = new MemberDao(); // 회원정보를 불러오면서 출력
		
		totalRow = dao.totalRow();
		totalPage = (totalRow-1) / rowsPerPage + 1;
		startRow = (page-1) * rowsPerPage + 1;
		endRow = startRow + rowsPerPage - 1;
		startPage = (page-1) / pagesPerGroup * pagesPerGroup + 1;
		endPage = startPage + pagesPerGroup - 1;
		if(endPage > totalPage)
			endPage = totalPage;
		
		ArrayList<Member> list = dao.list(startRow, endRow);
		
		JspData jspData = new JspData(totalPage, startPage, endPage, page, pagesPerGroup);
		
		MemberModel model = new MemberModel();
		model.setList(list);
		model.setJspData(jspData);
		
		return model;
	}
}
