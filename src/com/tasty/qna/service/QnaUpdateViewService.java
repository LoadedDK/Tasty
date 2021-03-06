package com.tasty.qna.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.qna.dao.QnaDao;
import com.tasty.qna.model.Qna;

public class QnaUpdateViewService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		System.out.println("QnaUpdateViewService.service()");
		int no = (Integer)obj;
		QnaDao dao = new QnaDao();
		Qna qna = dao.view(no);
		return qna;
	} // end of service()
	
}
