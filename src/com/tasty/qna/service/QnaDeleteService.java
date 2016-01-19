package com.tasty.qna.service;

import com.tasty.qna.dao.QnaDao;
import com.webjjang.controller.ServiceInterface;

public class QnaDeleteService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		int no = (Integer)obj;
		QnaDao dao = new QnaDao();
		dao.delete(no);
		return null;
	}

}
