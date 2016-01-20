/*
 * DB에 직접적으로 접근해서 데이터를 교류하는 클래스
 */
package com.tasty.notice.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tasty.common.CommonDao;
import com.tasty.notice.model.Notice;

//public abstract class NoticeDao { //  이 클래스는 OracleNoticeDao에 상속해준다. 
// 필요한 객체 선언
public class NoticeDao {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	List<Notice> list = null;
	Notice notice = null;

	public List<Notice> list(String str, int startRow, int endRow) {
		// TODO Auto-generated method stub
		// 필요한 객체 선언 - try 밖에 선언 - close()
		// 글리스트 - 열결, 상태, 결과 객체가 필요

		// DB에서 데이터를 받아오는 프로그램 작성
		try {
			// 1. 드라이버를 확인
			Class.forName(CommonDao.driver);

			// 2. 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문장 작성
			String sql = " select no,title, " + " to_char(wdate,'yyyy-mm-dd')wdate, "
					+ " to_char(startdate,'yyyy-mm-dd')startDate, " + " to_char(enddate,'yyyy-mm-dd')endDate, "
					+ " fileName from notice ";
			// 공지 일정에 따른 where 추가
			switch (str) {
			case "old": // 지난 공지 조건 추가
				sql += " where ENDDATE < sysdate-1 ";
				break;
			case "res": // 예약 공지 조건 추가
				sql += " where STARTDATE > sysdate ";
				break;
			case "cur": // 현재 공지 조건 추가
				sql += " where STARTDATE <= SYSDATE and ENDDATE>= sysdate-1 ";
				break;
			default: // 모든 공지니까 조건이 필요 없다.
				break;
			}
			sql += " order by no desc ";
			
			// 3-2) rownum 붙이기
			sql = "select rownum rnum, no, title, wdate, startDate, endDate, fileName  "
					+ " from (" + sql + ")";
			// 3-3) 시작 글과 끝글의 번호 사이에 데이터 가져오기 (where 사용)
			sql = "select no, title, wdate, startDate, endDate, fileName from (" + sql + ") "
					+ "where rnum between ? and ?";

			// 4. 실행할 수 있는상태 - 데이터 셋팅( ? 가 있어야 데이터 세팅이 가능하다.)
			pstmt = con.prepareStatement(sql);
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
				list.add(new Notice(rs.getInt("no"), rs.getString("title"), rs.getString("wdate"),
						rs.getString("startDate"), rs.getString("endDate"), rs.getString("fileName")));
			}
			return list;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				// 7. 닫기
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	public void write(Notice notice) {
		// TODO Auto-generated method stub
		try {
			// 1. 드라이버 확인
			Class.forName(CommonDao.driver);
			// 2. 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql 작성
			String sql = " insert into notice(no,title,content,startDate,endDate) "
					+ " values(notice_seq.nextval,?,?,?,? ) ";
			// 4. 상태 실행및 데이터 입력
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getStartDate());
			pstmt.setString(4, notice.getEndDate());
			// 5. 실행
			pstmt.executeUpdate();
			// 6. 표시
			System.out.println("글 작성 완료!!");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 실행파일 닫기
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

	public Notice view(String no) {
		// TODO Auto-generated method stub
		try {
			// 1. 확인
			Class.forName(CommonDao.driver);
			// 2. 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문장
			String sql = "select no, title, content, to_char(wdate,'yyyy-mm-dd') wDate, "
					+ " to_char(startdate,'yyyy-mm-dd') startDate, "
					+ " to_char(enddate,'yyyy-mm-dd') endDate from notice where no = ? ";
			// 4. 상태 실행 및 데이터 입력
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시
			if (rs.next()) {
				Notice notice = new Notice();
				notice.setNo(rs.getInt(1)); // 숫자도 가능하다
				notice.setTitle(rs.getString(2));
				notice.setContent(rs.getString(3));
				notice.setWdate(rs.getString(4));
				notice.setStartDate(rs.getString(5));
				notice.setEndDate(rs.getString(6));
				return notice;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return null;
	}

	public void delete(Object obj) {
		try {
			// 1. 확인
			Class.forName(CommonDao.driver);
			// 2. 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문장
			String sql = "delete from notice where no = ?";
			// 4. 상태 실행 및 데이터입력
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, (String) obj);
			// 5. 실행
			pstmt.executeUpdate();
			// 6. 표시
			System.out.println("삭제되었습니다!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
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

	public void update(Notice notice) {
		// TODO Auto-generated method stub
		try {
			// 1. 드라이버 확인
			Class.forName(CommonDao.driver);
			// 2. 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql 작성
			String sql = " update notice set  title = ?,content = ?,startDate = ?,endDate = ? where no = ? ";
			// 4. 상태 실행및 데이터 입력
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getStartDate());
			pstmt.setString(4, notice.getEndDate());
			// 5. 실행
			pstmt.setInt(5, notice.getNo());
			pstmt.executeUpdate();
			// 6. 표시
			System.out.println("글 수정 완료!!");

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				// 7. 실행파일 닫기
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
	
	public int totalRow(String str) {
		try {
			Class.forName(CommonDao.driver);
			
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			
			String sql = "select count(no) from notice ";
			
			switch (str) {
			case "old": // 지난 공지 조건 추가
				sql += " where ENDDATE < sysdate-1 ";
				break;
			case "res": // 예약 공지 조건 추가
				sql += " where STARTDATE > sysdate ";
				break;
			case "cur": // 현재 공지 조건 추가
				sql += " where STARTDATE <= SYSDATE and ENDDATE>= sysdate-1 ";
				break;
			default: // 모든 공지니까 조건이 필요 없다.
				break;
			}
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())
				return rs.getInt("count(no)");
		}
		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(con != null)
					con.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
	
}
