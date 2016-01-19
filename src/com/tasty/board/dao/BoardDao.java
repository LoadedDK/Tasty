package com.tasty.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.tasty.board.model.Board;
import com.tasty.common.CommonDao;

public abstract class BoardDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Board> list = null;


	public abstract List<Board> list(int startRow, int endRow);
	public abstract void write(Board board);
	
	public Board view(int no) {
		Board board = new Board();
		try {
			//드라이버연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			//sql문장
			String sql = "select no,title,content,writer,to_char(wdate,'yyyy-mm-dd') as wdate,hit,fileName from board "
					+ " where no = ?";
			//상태실행
			pstmt = conn.prepareStatement(sql);
			//상태 실행 및 데이터입력
			pstmt.setInt(1, no);
			//sql문장 실행한 결과를 rs변수에 담는다
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setWriter(rs.getString("writer"));
				board.setWdate(rs.getString("wdate"));
				board.setFileName(rs.getString("fileName"));
				board.setHit(rs.getInt("hit"));
			}
			return board;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				//닫기
				if (rs != null)rs.close();
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return null;
	}

	public void update(Board board) {
		try {
			//드라이버연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			//sql문장
			String sql = " update board set title = ?, content = ?, writer = ?, fileName = ? where no = ? ";
			//상태 실행 및 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getWriter());
			pstmt.setString(4, board.getFileName());
			pstmt.setInt(5, board.getNo());
			//실행
			pstmt.executeUpdate();
			//표시
			System.out.println("수정이 되었습니다.\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				//닫기
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	} // end of update()

	public void delete(int no) {
		try {
			//드라이버연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			//sql문장
			String sql = "delete from board where no =?";
			//상태 실행 및 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			//실행
			pstmt.executeUpdate();
			//표시
			System.out.println("삭제되었습니다.");
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
	public void increase(int no) {
		// TODO Auto-generated method stub
		Connection con = null;
		PreparedStatement pstmt = null;
		// 사용할 정보를 정의한다. - 전역변수
		try {
			// 1. 드라이버 확인
			Class.forName(CommonDao.driver);
			// 2. DB 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql작성
			String sql = "update board set "
			+ " hit = hit + 1 where no =?";
			// 4. 상태 - 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행
			pstmt.executeUpdate();
			// 6. 표시
			//System.out.println("조횟수 + 1");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	public int totalRow() {
		// DB에서 데이터를 받아오는 프로그램 작성
		try {
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
