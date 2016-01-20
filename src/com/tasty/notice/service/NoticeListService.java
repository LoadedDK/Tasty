package com.tasty.notice.service;

import java.util.List;

import com.tasty.controller.ServiceInterface;
import com.tasty.notice.dao.NoticeDao;
import com.tasty.notice.model.Notice;

public class NoticeListService implements ServiceInterface {

	@Override
	public Object service(Object obj) {
		// TODO Auto-generated method stub
		List<Notice> list = null;
		// DB에서 데이터 가져오기 위한 dao를 생성 - 호출(list)
		// obj : cur - 현재공지 // old - 지난공지 // res - 예약공지 // all - 모든공지
		NoticeDao dao = new NoticeDao();
		list = dao.list((String) obj);
		return list;
	}

}
