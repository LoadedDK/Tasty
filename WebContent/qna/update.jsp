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
<title>QnA - [${qna.title}] 수정하기</title>
<link rel="stylesheet" type="text/css" href="../css/qna/update.css">
</head>
<body>
<form action="updateProcess.jsp?page=${param.page}" method="post">
<h2>수정하기</h2>
<div id="form_wrapper">
<ul>
<li><label>번호</label><input name="no" value="${qna.no}" readonly="readonly"></li>
<li><label>제목</label><input name="title" value="${qna.title}"></li>
<li><label>내용</label><textarea rows="5" cols="40" name="content">${qna.content}</textarea></li>
<li><label>작성자</label><input name="writer" value="${qna.writer}"></li>
</ul>
<button>글수정</button>
</div>
</form>
</body>
</html>