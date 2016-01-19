package com.tasty.qna.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.qna.dao.QnaDao;
import com.tasty.qna.model.Qna;

public class QnaWriteService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		// 데이터를 입력받는다 - 제목, 내용, 작성자
		// 입력받는 객체 생성, 호출 : Board
		Qna qna = (Qna)obj;
		// 입력받은 데이터를 DB에 저장한다. -dao
		// BoardDao 생성, 호출
		QnaDao dao = new QnaDao();
		dao.write(qna);
		return null;
	}

}
