package com.tasty.notice.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.dao.OracleNoticeDao;
import com.tasty.notice.model.Notice;

public class NoticeViewService implements ServiceInterface {
	ServiceInterface service = null;

	@Override
	public Object service(Object obj) {
		NoticeDao dao = new OracleNoticeDao(); // 생성 및 호출
		int no = (Integer)obj;
			dao.increase(no);
			Notice notice = dao.view(no);
			return notice;
		
	}
}