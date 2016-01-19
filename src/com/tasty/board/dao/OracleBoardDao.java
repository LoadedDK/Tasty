package com.tasty.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tasty.board.model.Board;
import com.tasty.common.CommonDao;

public class OracleBoardDao extends BoardDao {//공통적으로 사용되는 것을 BoardDao를 통해서 상속
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Board> list = null;

	public List<Board> list(int startRow, int endRow) {
		// DB에서 데이터를 받아오는 프로그램 작성
		try {
			Class.forName(CommonDao.driver);
			// 2. 연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문장 작성
			// 정렬하는 데이터 가져오기
			String sql = " select no,title,writer,"
					+ " to_char(wdate, 'yyyy-mm-dd')wdate,hit from board order by no desc";
			// rownum 붙이기.
			sql = " select rownum rnum , no,title,writer, wdate, " + " hit from (  " + sql + " )";
			// 시작글과 끝글 번호 사이에 데이터 가져오기(where)
			sql = "select * from ( " + sql + " ) " + " where rnum between ? and ? ";
			// 4. 실행할 수 있는상태 - 데이터 셋팅( ? 가 있어야 데이터 세팅이 가능하다.)
//			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			// 5. 실행
			// select - executeQuery() : 질의한다.
			// insert, update, delete - executeUpdate() : DB의 데이터가 수정된다.
			rs = pstmt.executeQuery();

			// 6. 출력 - view(출력) 담당 - 객체 저장
			list = new ArrayList<Board>();
			// 모든 rs에 있는 데이터를 Board에 담고 Board를 List에 담는다.
			// rs는 데이터 마지막 그 위에 있다. 즉, rs는 아무런 데이터도 가지고 있지 않은 상태이다.
			while (rs.next()) {
				// next()해서 데이터를 찾는다. 있으면 true 없으면 false
				list.add(new Board(rs.getInt("no"), rs.getString("title"), rs.getString("writer"),
						rs.getString("wdate"), rs.getInt("hit")));
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				// 7. 닫기
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return list;
	}

	public void write(Board board) {
		try {
			Class.forName(CommonDao.driver);
			//드라이버연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			//sql문장
			String sql = "insert into board " + 
						 "( no,title,content,writer) " + 
						 " values (board_seq.nextval,"
					+ " ?,?,?)";
			//상태 실행 및 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getWriter());
			//실행
			pstmt.executeUpdate();
			//표시
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//닫기
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public int totalRow() {
		// DB에서 데이터를 받아오는 프로그램 작성
		try {
			// 1. 드라이버를 확인
			Class.forName(CommonDao.driver);

			// 2. 연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문장 작성
			String sql = "select count(no) from board ";

			// 4. 실행할 수 있는상태 - 데이터 셋팅( ? 가 있어야 데이터 세팅이 가능하다.)
			pstmt = conn.prepareStatement(sql);

			// 5. 실행
			// select - executeQuery() : 질의한다.
			// insert, update, delete - executeUpdate() : DB의 데이터가 수정된다.
			rs = pstmt.executeQuery();

			// 6. 출력 - view(출력) 담당 - 객체 저장
			// 모든 rs에 있는 데이터를 Board에 담고 Board를 List에 담는다.
			// rs는 데이터 마지막 그 위에 있다. 즉, rs는 아무런 데이터도 가지고 있지 않은 상태이다.
			if (rs.next()) {
				// next()해서 데이터를 찾는다. 있으면 true 없으면 false
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			try {
				// 7. 닫기
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return 0;
	}
}
