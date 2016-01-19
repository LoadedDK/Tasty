package com.tasty.qna.service;

import com.tasty.qna.dao.QnaDao;
import com.tasty.qna.model.Qna;
import com.webjjang.controller.ServiceInterface;

public class QnaUpdateService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		// 수정할 데이터를 받는다. - title, content, writer
		Qna qna = (Qna)obj;
		// 수정한 데이터를 Dao에게 넘긴다. 생성, 호출
		QnaDao dao = new QnaDao();
		dao.update(qna);
		return null;
	}

}
