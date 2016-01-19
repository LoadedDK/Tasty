package com.tasty.qna.service;

import com.tasty.qna.dao.QnaDao;
import com.tasty.qna.model.Qna;
import com.webjjang.controller.ServiceInterface;

public class QnaReplyViewService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		System.out.println("QnaViewService.service()");
		// 화면에 보여줄 글 번호 입력
		int no = (Integer)obj;
		// 입력한 글번호의 게시글을 DB에서 가져오기
		// DB를 처리하는 BoardDao 객체 생성, 호출
		QnaDao dao = new QnaDao();
		Qna qna = dao.replyView(no);
		return qna;
	} // end of service()
	
}
