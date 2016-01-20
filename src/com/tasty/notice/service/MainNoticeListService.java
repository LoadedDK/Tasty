package com.tasty.notice.service;

import java.util.List;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.model.Notice;

public class MainNoticeListService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		List<Notice> list = null;

		NoticeDao noticeDao = new NoticeDao();
		
		list = noticeDao.listMain();
		
		return list;
	}
}
