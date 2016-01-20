/*
 * 글수정을 위한 클래스 
 */
package com.tasty.notice.service;

import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.model.Notice;
import com.tasty.controller.ServiceInterface;


public class NoticeUpdateService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		// TODO Auto-generated method stub
		Notice notice = (Notice) obj;
		// 수정한 데이터를 Dao에서 넘긴다. 생성 - 호출
		NoticeDao dao = new NoticeDao();
		dao.update(notice);
		return null;
	}

}
