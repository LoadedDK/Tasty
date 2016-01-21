<%@page import="com.tasty.qna.model.Qna"%>
<%@page import="com.tasty.qna.service.QnaViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 넘어오는 글번호를 받자
	String noStr = request.getParameter("no");
if(noStr != null) {
	// boardViewService 생성 후 호출
	ServiceInterface service = new QnaViewService();
	Qna qna = (Qna)service.service(Integer.parseInt(noStr));
	// EL 객체를 사용하기 위해 request 객체에 board를 담는다.
	request.setAttribute("board", qna);
	
	qna.setContent(qna.getContent().replace("\r\n", "<br>"));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA - [${board.title}]</title>
<link rel="stylesheet" type="text/css" href="../css/qna/view.css">
</head>
<body>
<div id="form_wrapper">
<div id="list_head">QnA 보기</div>
<table>
<tr><th>번호</th><td>${board.no}</td></tr>
<tr><th>제목</th><td>${board.title}</td></tr>
<tr><th>내용</th><td>${board.content}</td></tr>
<tr><th>작성자</th><td>${board.writer}</td></tr>
<tr><th>작성일</th><td>${board.wdate}</td></tr>
<tr><th>조회수</th><td>${board.hit}</td></tr>
</table>
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
</div>
</body>
</html>