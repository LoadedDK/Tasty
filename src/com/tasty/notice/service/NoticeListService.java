package com.tasty.notice.service;

import java.util.List;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.model.JspData;
import com.tasty.notice.model.Notice;
import com.tasty.notice.model.NoticeModel;
import com.tasty.notice.model.Pp;

public class NoticeListService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		Pp pp=(Pp)obj;
		List<Notice> noticeList = null;
		// 페이지 처리를 위한 변수 선언(int page, int totalPage, int totalRow...)
		int page=pp.getCpage();
		String period = pp.getPeriod();
		int totalPage=0;
		int totalRow=0;
		int rowsPerPage=3;
		int startRow=0;
		int endRow=0;
		int pagesPerGroup=3;
		int startPage=0;
		int endPage=0;
			
		// DB에서 데이터 가져오기 위한 dao를 생성 - 호출(list())
		//상속으로 구현되는 NoticeList
		NoticeDao noticeDao = new NoticeDao();
		
		// 전체 줄 수 구해오는 메소드 호출
		totalRow=noticeDao.totalRow(period);
		// + 전체 페이지 = {(전체 줄수 -1)/한 페이지 당 줄 수}+1
		totalPage = (totalRow-1)/rowsPerPage+1;
		// + 현재 페이지의 첫번째 줄 번호 = (현재페이지-1)*한 페이지당 글 수 +1
		startRow=(page-1)*rowsPerPage+1;
		// + 현재 페이지의 마지막 줄 번호 = 첫번 째 줄 번호 + 한 페이지당 글 수 -1
		endRow=startRow+rowsPerPage-1;
		// 시작 페이지 = (현재 페이지-1)/화면당 페이지 수 * 한 화면 당 페이지 수 +1
		startPage = (page-1)/pagesPerGroup*pagesPerGroup+1;
		// 끝 페이지 = 시작페이지+한 화면당 페이지수 -1 : 마지막 페이지를 넘을 수 없다
		endPage = startPage+pagesPerGroup-1;
		if(endPage>totalPage)
			endPage=totalPage;
		
		noticeList = noticeDao.list(period, startRow, endRow);
		
		// jsp에 totalPage 넘기기 위해 JspData 생성하고 담아둔다
		JspData jspData = new JspData();
		jspData.setTotalPage(totalPage);
		jspData.setStartPage(startPage);
		jspData.setEndPage(endPage);
		jspData.setPage(page);
		jspData.setPagesPerGroup(pagesPerGroup);
		
		NoticeModel model = new NoticeModel();
		model.setList(noticeList);
		model.setJspData(jspData);
		
		return model;
	}

}
