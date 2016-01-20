/*
 * 글삭제를 위한 클래스 
 */
package com.tasty.notice.service;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;

public class NoticeDeleteService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		// TODO Auto-generated method stub
		NoticeDao dao = new NoticeDao();
		dao.delete(obj);
		return null;
	}

}