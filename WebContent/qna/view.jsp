<%@page import="com.tasty.qna.model.Qna"%>
<%@page import="com.tasty.qna.service.QnaViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 넘어오는 글번호를 받자
	String noStr = request.getParameter("no");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(noStr != null) {
	// boardViewService 생성 후 호출
	ServiceInterface service = new QnaViewService();
	Qna qna = (Qna)service.service(Integer.parseInt(noStr));
	// EL 객체를 사용하기 위해 request 객체에 board를 담는다.
	request.setAttribute("board", qna);
%>
<h2>질문답변 보기</h2>
번호 : ${board.no}<br/>
제목 : ${board.title}<br/>
내용 : ${board.content}<br/>
작성자 : ${board.writer}<br/>
작성일 : ${board.wdate}<br/>
조회수 : ${board.hit}<br/>
<button onclick="location='list.jsp?page=${param.page}'">글리스트</button>
<button onclick="location='update.jsp?no=${board.no}&page=${param.page}'">글수정</button>
<button onclick="location='deleteProcess.jsp?no=${board.no}'">글삭제</button>
<button onclick="location='reply.jsp?no=${board.no}'">답변하기</button>
<%
}	// 글번호가 넘어온 경우에만 처리
	else {	// 글번호가 넘어오지 않은 경우 처리
%>
	오류 : 글번호가 있어야 합니다.<br/>
	<button onclick="history.back()">이전 페이지로</button>
<%
	}
%>
</body>
</html>