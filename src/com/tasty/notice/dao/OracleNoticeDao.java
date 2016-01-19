package com.tasty.notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tasty.common.CommonDao;
import com.tasty.notice.model.Notice;


public class OracleNoticeDao extends NoticeDao {// 공통적으로 사용되는 것을 NoticeDao를 통해서 상속
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Notice> list = null;
		
		
	public List<Notice> list(int startRow,int endRow) { // 리스트 출력을 위한 메소드 

		try {
			Class.forName(CommonDao.driver);
			// 2. 연결
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문장 작성
			// 정렬하는 데이터 가져오기
			String sql = " select no,title, "
					+ " to_char(wdate, 'yyyy-mm-dd')wdate,startDate,endDate from notice order by no desc";
			// rownum 붙이기.
			sql = " select rownum rnum , no,title,writer, wdate, " + " hit from (  " + sql + " )";
			// 시작글과 끝글 번호 사이에 데이터 가져오기(where)
			sql = "select * from ( " + sql + " ) " + " where rnum between ? and ? ";
			// 4. 실행할 수 있는상태 - 데이터 셋팅( ? 가 있어야 데이터 세팅이 가능하다.)
			// System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			// 5. 실행
			// select - executeQuery() : 질의한다.
			// insert, update, delete - executeUpdate() : DB의 데이터가 수정된다.
			rs = pstmt.executeQuery();

			// 6. 출력 - view(출력) 담당 - 객체 저장
			list = new ArrayList<Notice>();
			// 모든 rs에 있는 데이터를 Notice에 담고 Notice를 List에 담는다.
			// rs는 데이터 마지막 그 위에 있다. 즉, rs는 아무런 데이터도 가지고 있지 않은 상태이다.
			while (rs.next()) {
				// next()해서 데이터를 찾는다. 있으면 true 없으면 false
				
				list.add(new Notice(rs.getInt("no"), 
									rs.getString("title"), 
									rs.getString("wdate"),
									rs.getString("startDate"), 
									rs.getString("endDate")));
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
	public void write(Notice notice) { // 글쓰기를 위한 메소드 
		// TODO Auto-generated method stub
		try {
			// 드라이버 연결 
			conn = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// sql문장 
			String sql = " insert into notice(no,title,content,startDate,endDate) values(notice_seq.nextval,?,?,?,?) ";
			// 상태실행및 데이터 입력
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getStartDate());
			pstmt.setString(4, notice.getEndDate());
			// 실행
			pstmt.executeUpdate();
			// 표시
			System.out.println("글이 성공적으로 작성되었습니다.\n");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 닫기
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	} // end of write()
}
