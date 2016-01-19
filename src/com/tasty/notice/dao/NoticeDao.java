/*
 * DB에 직접적으로 접근해서 데이터를 교류하는 클래스
 */
package com.tasty.notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.tasty.common.CommonDao;
import com.tasty.notice.model.Notice;

public abstract class NoticeDao { //  이 클래스는 OracleNoticeDao에 상속해준다. 
	// 필요한 객체 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	// NoticeDao는 부모 클래스이다. 일단 다른 것이 받을 수 있도록 추상메소드를 만듦
	public abstract List<Notice> list(int startRow,int endRow);

	public abstract void write(Notice notice);

	public Notice view(int no) { // view()
		// TODO Auto-generated method stub
		Notice notice = new Notice();
		try {
			// 드라이버 연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// sql문장
			String sql = "select no, title, content, to_char(wdate,'yyyy-mm-dd')wdate, "
					+ " to_char(startdate,'yyyy-mm-dd')startdate, "
					+ "to_char(enddate,'yyyy-mm-dd')enddate from notice where no = ?";
			// 상태 실행및 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 실행
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice.setNo(rs.getInt("no"));
				notice.setTitle(rs.getString("title"));
				notice.setContent(rs.getString("content"));
				notice.setWdate(rs.getString("Wdate"));
				notice.setStartDate(rs.getString("Startdate"));
				notice.setEndDate(rs.getString("enddate"));
				return notice;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 닫기
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
		return null;
	} // end of view()

	public void update(Notice notice, int no) { // update()
		// TODO Auto-generated method stub
		try {
			// 드라이버 연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// sql문장
			String sql = " update notice set title = ?, content = ?, startDate = ?, endDate = ? where no = ? ";
			// 상태 실행및 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getStartDate());
			pstmt.setString(4, notice.getEndDate());
			pstmt.setInt(5, no);
			// 실행
			pstmt.executeUpdate();
			System.out.println("수정이 되었습니다.\n");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	} // end of update()

	public void delete(int no) {
		// TODO Auto-generated method stub
		try {
			// 드라이버 연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// sql문장
			String sql = "delete from notice where no =?";
			// 상태 실행및 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 실행
			pstmt.executeUpdate();
			// 표시
			System.out.println("\n글이 삭제되었습니다." + "\n이전메뉴로 돌아갑니다.\n");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	} // end of delete()

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
			String sql = "update notice set "
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
