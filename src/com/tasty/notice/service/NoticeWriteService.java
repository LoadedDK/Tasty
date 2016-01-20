package com.tasty.notice.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.model.Notice;

public class NoticeWriteService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		// TODO Auto-generated method stub
		Notice notice = (Notice) obj;
		
		// 입력받은 데이터(Notice)를 DB에 저장한다. - dao
		// NoticeDao 생성 - 호출 
		NoticeDao dao = new NoticeDao();
		dao.write(notice);
		return null;
	}
	

}
