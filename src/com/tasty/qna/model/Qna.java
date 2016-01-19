/*
 * 질문답변의 데이터를 저장하는 클래스
 * 번호, 제목, 질문, 답변, 작성자, 작성일, 조회수
 */
package com.tasty.qna.model;

public class Qna {

	private int no;
	private String title, content, writer, wdate;
	private int hit;
	private int refNo;	// 관련글 번호 = 참조 번호 : 1차 정렬
	private int ordNo;	// 순서 번호 : 2차 정렬
	private int levNo;	// 들여쓰기 - 보여줄 때 사용한다.
	private int parentNo;	// 부모글번호 - 자동삭제(on delete cascade)

	public Qna(int no, String title, String writer, String wdate, int hit, int levNo) {
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.wdate = wdate;
		this.hit = hit;
		this.levNo = levNo;
	}
	
	public Qna(int no, String title, String content, String writer, String wdate, int hit, int levNo) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.wdate = wdate;
		this.hit = hit;
		this.levNo = levNo;
	}
	
	public Qna(){}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public int getOrdNo() {
		return ordNo;
	}

	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}

	public int getLevNo() {
		return levNo;
	}

	public void setLevNo(int levNo) {
		this.levNo = levNo;
	}

	public int getParentNo() {
		return parentNo;
	}

	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}

	@Override
	public String toString() {
		return "Qna [no=" + no + ", title=" + title + ", content=" + content + ", writer="
				+ writer + ", wdate=" + wdate + ", hit=" + hit + ", refNo=" + refNo + ", ordNo=" + ordNo + ", levNo="
				+ levNo + ", parentsNo=" + parentNo + "]";
	}
	
}
