package com.tasty.board.service;

import com.tasty.board.dao.BoardDao;
import com.tasty.board.dao.OracleBoardDao;
import com.tasty.board.model.Board;
import com.tasty.controller.ServiceInterface;

public class BoardViewService implements ServiceInterface {

	ServiceInterface service = null;

	@Override
	public Object service(Object obj) {
		BoardDao dao = new OracleBoardDao();//생성 및 호출
		int no = (Integer)obj;
			dao.increase(no);
			Board board = dao.view(no); 
			return board;
	}
}

