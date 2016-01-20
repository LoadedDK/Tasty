package com.tasty.notice.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.model.Notice;

public class NoticeViewService implements ServiceInterface {
	
	ServiceInterface service = null;
	
	@Override
	public Object service(Object obj) {
	// TODO Auto-generated method stub
		String no = (String)obj;
		NoticeDao dao = new NoticeDao();
		Notice notice = dao.view(no);
		return notice;
	}
}