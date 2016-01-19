package com.tasty.qna.service;

import java.util.List;

import com.tasty.qna.dao.QnaDao;
import com.tasty.qna.model.Qna;
import com.tasty.qna.model.QnaModel;
import com.tasty.qna.model.JspData;
import com.webjjang.controller.ServiceInterface;

public class QnaListService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		List<Qna> list = null;
		
		// page 처리를 위한 변수 선언
		// page : 현재 page = 보여줄 페이지 (기본 = 1)
		int page = (Integer)obj;
		int totalPage = 0;	// 전체 페이지 = (전체글수-1)/페이지당 줄 수+1
		int totalRow = 0;	// 전체 글수 = DB에서 가져온다. DAO의 메소드 호출
		int rowsPerPage = 20;	// 한 페이지에 보여줄 줄의 개수
		int startRow = 0;	// DB에서 가져올 글의 첫번째 순서(rownum)번호
		// startRow = (page-1)*rowsPerPage+1
		int endRow = 0;	// DB에서 가져올 글의 마지막 순서(rownum)번호
		// endRow = startRow+rowsPerPage-1
		
		int pagesPerGroup = 3;	// 한 화면에 나타날 페이지의 갯수
		int startPage = 0;	// 화면에 처음 시작하는 페이지
		// (page-1)/pagesPerGroup*pagesPerGroup+1
		int endPage = 0;	// 화면에 나타나는 끝 페이지
		// startPage+pagesPerGroup-1 : 마지막 페이지를 넘을 수 없다.
		
		// DB에서 데이터를 가져오기 위한 dao를 생성, 호출(list())
		QnaDao dao = new QnaDao();
	
		// 전체 줄 수를 구해오는 메소드 호출
		totalRow = dao.totalRow();
		// 전체 페이지 = (전체 줄 수-1)/한 페이지당 줄 수+1
		totalPage = (totalRow-1)/rowsPerPage+1;
		// 현재 페이지의 첫번째 줄 번호 = (현재 페이지-1)*페이지당 줄 수+1
		startRow = (page-1)*rowsPerPage+1;
		// 현재 페이지의 마지막 줄 번호 = 첫번째 줄 번호+페이지당 줄 수-1
		endRow = startRow+rowsPerPage-1;
		
		// 시작페이지 = (현재페이지-1)/한 화면당 페이지 수*한 화면당 페이지 수+1
		startPage = (page-1)/pagesPerGroup*pagesPerGroup+1;
		// 끝페이지 = 시작페이지+한 화면당 페이지 수-1
		endPage = startPage+pagesPerGroup-1;
		if(endPage > totalPage) endPage = totalPage;
		
		System.out.println("QnaListService.service().totalRow : "+totalRow);
		list = dao.list(startRow, endRow);
		// jsp에 totalPage를 넘기기 위해서 JspData를 생성 후 담는다.
		JspData jspData = new JspData();
		jspData.setTotalPage(totalPage);
		jspData.setStartPage(startPage);
		jspData.setEndPage(endPage);
		jspData.setPage(page);
		jspData.setPagesPerGroup(pagesPerGroup);
		QnaModel model = new QnaModel();
		model.setList(list);
		model.setJspData(jspData);		
		return model;
	}

}
