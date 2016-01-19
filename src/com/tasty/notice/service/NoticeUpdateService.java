/*
 * 글수정을 위한 클래스 
 */
package com.tasty.notice.service;

import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.dao.OracleNoticeDao;
import com.tasty.notice.model.Notice;
import com.tasty.controller.ServiceInterface;


public class NoticeUpdateService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		// TODO Auto-generated method stub
		Notice notice = (Notice)obj;
		NoticeDao dao  = new OracleNoticeDao(); // 객체 생성 및 호출
		dao.update(notice,(int)obj); // dao객체를 통해서 메소드 처리
		return null;
	}

}
