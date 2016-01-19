package com.tasty.notice.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.dao.OracleNoticeDao;
import com.tasty.notice.model.Notice;

public class NoticeWriteService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		NoticeDao dao = new OracleNoticeDao(); 
		Notice notice = new Notice();
		notice = (Notice)obj;
		dao.write(notice);
		return null;
	}

}
