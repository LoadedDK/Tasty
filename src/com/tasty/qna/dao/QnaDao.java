package com.tasty.qna.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tasty.common.CommonDao;
import com.tasty.qna.model.Qna;

public class QnaDao {

	public List<Qna> list(int startRow, int endRow) {
		// 필요한 객체를 try 밖에 선언 - close() 때문
		// 글리스트 - 연결, 상태, 결과
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = null;

		// DB에서 데이터를 받아 오는 프로그램
		try {
			// 1. 드라이버 확인
			Class.forName(CommonDao.driver);
			// 2. DB 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql 문장 작성
			String sql = "select no, title, content, writer, to_char(wdate, 'yyyy-mm-dd') wdate, hit, levNo "
					+ " from qna order by refNo desc, ordNo asc";
			sql = "select rownum rnum, no, title, content, writer, wdate, hit, levNo from ("+sql+")";
			sql = "select * from ("+sql+") where rnum between ? and ?";
			// 4. 실행 상태 - 데이터 셋팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			// 5. 실행
			// select - executeQuery() : 질의한다.
			// insert,update,delete - executeUpdate() : DB의 데이터가 수정된다.
			rs = pstmt.executeQuery();
			// 6. 출력 - view(출력)가 담당해야 하는 부분 - 객체저장 프로그램 작성
			list = new ArrayList<Qna>();
			// 모든 rs에 있는 데이터를 qna에 담고 qna를 List에 담는다.
			while (rs.next()) {
				list.add(new Qna(rs.getInt("no"), rs.getString("title"), rs.getString("content"), rs.getString("writer"), 
						rs.getString("wdate"), rs.getInt("hit"), rs.getInt("levNo")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public void write(Qna qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "insert into qna(no, title, content, writer, refNo, ordNo, levNo, parentNo) "
					+ " values(seq_qna.nextval, ?, ?, ?, seq_qna.nextval, 1, 0, seq_qna.nextval)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getTitle());
			pstmt.setString(2, qna.getContent());
			pstmt.setString(3, qna.getWriter());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void increase(int no) {
		// 필요한 객체를 선언한다.
		Connection con = null;
		PreparedStatement pstmt = null;
		// 사용할 정보를 정의한다. - 전역변수
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "update qna set hit = hit + 1 where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			System.out.println("조회수 증가 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public Qna view(int no) {
		// 필요한 객체 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 사용할 정보 정의 - 전역변수(멤버변수)
		try {
			// 1. 드라이버 확인
			Class.forName(CommonDao.driver);
			// 2. DB 연결
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문 작성
			String sql = "select no, title, content, writer, to_char(wdate, 'yyyy-mm-dd') wdate, hit from qna where no = ?";
			// 4. 상태, 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			// 5. 실행
			rs = pstmt.executeQuery();
			// 6. 표시
			if (rs.next()) { // 데이터가 있으면 채우고 넘김
				Qna qna = new Qna();
				qna.setNo(rs.getInt("no"));
				qna.setTitle(rs.getString("title"));
				qna.setContent(rs.getString("content"));
				qna.setWriter(rs.getString("writer"));
				qna.setWdate(rs.getString("wdate"));
				qna.setHit(rs.getInt("hit"));
				return qna;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		// 데이터가 없거나 DB 오류인 경우
		return null;
	}

	public void reply(int no, String answer) {
		// 필요한 객체 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1. 드라이버 확인
			Class.forName(CommonDao.driver);
			// 2. DB 접속
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 3. sql문 작성
			String sql = "update qna set answer = ? where no = ?";
			// 4. 상태, 데이터 세팅
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, no);
			// 5. 실행
			pstmt.executeUpdate();
			// 6. 표시
			System.out.println("답변하기|수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				// 7. 닫기
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public int totalRow() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "select count(no) from qna";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 첫번째 배열에 no의 카운트 정보가 있기 때문에 숫자 1을 입력
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public Qna replyView(int no) {
		// 필요한 객체 선언
				Connection con = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				// 사용할 정보 정의 - 전역변수(멤버변수)
				try {
					// 1. 드라이버 확인
					Class.forName(CommonDao.driver);
					// 2. DB 연결
					con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
					// 3. sql문 작성
					String sql = "select no, title, content, to_char(wdate, 'yyyy-mm-dd') wdate, hit, "
							+ " refNo, ordNo, levNo, parentNo from qna where no = ?";
					// 4. 상태, 데이터 세팅
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, no);
					// 5. 실행
					rs = pstmt.executeQuery();
					// 6. 표시
					if (rs.next()) { // 데이터가 있으면 채우고 넘김
						Qna qna = new Qna();
						qna.setNo(rs.getInt("no"));
						qna.setTitle(rs.getString("title"));
						qna.setContent(rs.getString("content"));
						qna.setWdate(rs.getString("wdate"));
						qna.setHit(rs.getInt("hit"));
						qna.setRefNo(rs.getInt("refNo"));
						qna.setOrdNo(rs.getInt("ordNo"));
						qna.setLevNo(rs.getInt("levNo"));
						qna.setParentNo(rs.getInt("parentNo"));
						return qna;
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
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
				// 데이터가 없거나 DB 오류인 경우
				return null;
	}

	public int minOrdNo(int refNo, int ordNo, int levNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "select nvl(min(ordNo),1) from qna where refNo = ? and ordNo > ? and levNo <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, refNo);
			pstmt.setInt(2, ordNo);
			pstmt.setInt(3, levNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
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
				e.printStackTrace();
			}
		}
		return 0;
	}

	public int maxOrdNo(int refNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "select nvl(max(ordNo),1) from qna where refNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, refNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
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
				e.printStackTrace();
			}
		}
		return 0;
	}
	
	public int countParentNo(int parentNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "select count(parentNo) from qna where parentNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parentNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (rs != null)
					rs.close();
				if (con != null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		return 0;
	}
	
	public int parentMaxOrdNo(int parentNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "select nvl(max(ordNo),1) from qna where parentNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, parentNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
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
				e.printStackTrace();
			}
		}
		return 0;
	}

	public void ordNoIncrease(int refNo, int ordNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "update qna set ordNo = ordNo + 1 where refNo = ? and ordNo >= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, refNo);
			pstmt.setInt(2, ordNo);
			pstmt.executeUpdate();
			System.out.println("ordNo 증가 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void replyWrite(Qna qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "insert into qna(no, title, content, writer, refNo, ordNo, levNo, parentNo) "
					+ " values(seq_qna.nextval, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getTitle());
			pstmt.setString(2, qna.getContent());
			pstmt.setString(3, qna.getWriter());
			pstmt.setInt(4, qna.getRefNo());
			pstmt.setInt(5, qna.getOrdNo());
			pstmt.setInt(6, qna.getLevNo());
			pstmt.setInt(7, qna.getParentNo());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)pstmt.close();
				if(con != null)con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void delete(int no) {
		Connection con = null;
		PreparedStatement pstmt = null;
		// 사용할 정보를 정의한다. - 전역변수
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "delete from qna where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
			System.out.println("삭제 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void update(Qna qna) {
		Connection con = null;
		PreparedStatement pstmt = null;
		// 사용할 정보를 정의한다. - 전역변수
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "update qna set title = ?, content = ?, writer = ? where no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, qna.getTitle());
			pstmt.setString(2, qna.getContent());
			pstmt.setString(3, qna.getWriter());
			pstmt.setInt(4, qna.getNo());
			pstmt.executeUpdate();
			System.out.println("수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int nextLevNo(int ordNo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			String sql = "select levNo from qna where ordNo = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ordNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
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
				e.printStackTrace();
			}
		}
		return 0;
	}

	public int nextLevMaxOrdNo(int ordNo) { 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			Class.forName(CommonDao.driver);
			con = DriverManager.getConnection(CommonDao.url, CommonDao.id, CommonDao.pw);
			// 미완성
			String sql = "select parentNo from qna where ordNo = ?";
			sql = "select nvl(max(ordNo),1) from qna where parentNo = (" + sql + ")";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ordNo);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
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
				e.printStackTrace();
			}
		}
		return 0;
	}

}
