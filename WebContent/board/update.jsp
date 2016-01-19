<%@page import="com.tasty.board.service.BoardViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
String noStr = request.getParameter("no"); 
if(noStr!=null){
ServiceInterface service = new BoardViewService();
request.setAttribute("board", service.service(Integer.parseInt(noStr)));}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2>자유 게시판 글쓰기</h2>
<form action="updateProcess.jsp" method="post">
	글번호:<input type="hidden" name="no" value="${board.no}"/>
	제목:<input name="title" value="${board.title }" /><br/>
	내용:<textarea rows="5" cols="40" name="content" > ${board.content }</textarea><br/>
	글쓴이:<input name="writer" value="${board.writer }" readonly="readonly"/><br/>
	<button>작성</button>
</form>
</body>
</html>