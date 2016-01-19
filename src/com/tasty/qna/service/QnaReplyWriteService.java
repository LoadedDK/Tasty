package com.tasty.qna.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.qna.dao.QnaDao;
import com.tasty.qna.model.Qna;

public class QnaReplyWriteService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		Qna qna = (Qna)obj;
		QnaDao dao = new QnaDao();
		// refNo가 같고 답변 대상글 보다 ordNo가 크면서
		// levNo가 같거나 작은 게시물 중에서 최소 ordNo값을 확인한다.
		// 원본글에 바로 답변을 다는 경우 minOrdNo는 1의 값을 가진다.
		if(dao.minOrdNo(qna.getRefNo(), qna.getOrdNo(), qna.getLevNo())==1)
			qna.setOrdNo(dao.maxOrdNo(qna.getRefNo())+1);
		else{
			qna.setOrdNo(qna.getOrdNo()+1);
			// 같은 parentNo를 갖는 답변글이 이미 있을 때
			if(dao.countParentNo(qna.getParentNo())>=1)
				qna.setOrdNo(dao.parentMaxOrdNo(qna.getParentNo())+1);
			// 밀어낼 글이 작성중인 글보다 levNo가 높을 때 건너뛰는 처리
			if(dao.nextLevNo(qna.getOrdNo())>qna.getLevNo())
				qna.setOrdNo(dao.nextLevMaxOrdNo(qna.getOrdNo())+1);
			dao.ordNoIncrease(qna.getRefNo(), qna.getOrdNo());
		}
		qna.setLevNo(qna.getLevNo() + 1);
		dao.replyWrite(qna);
		return null;
	}

}