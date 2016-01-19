<%@page import="com.tasty.qna.service.QnaUpdateViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ServiceInterface service = new QnaUpdateViewService();
	request.setAttribute("qna", service.service(Integer.parseInt(request.getParameter("no"))));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateProcess.jsp?page=${param.page}" method="post">
<h2>게시판 글수정</h2>
번호 : <input name="no" value="${qna.no}" readonly="readonly"><br/>
제목 : <input name="title" value="${qna.title}"><br/>
내용 : <textarea rows="5" cols="40" name="content">${qna.content}</textarea><br/>
작성자 : <input name="writer" value="${qna.writer}"><br/>
<button>글수정</button>
</form>
</body>
</html>