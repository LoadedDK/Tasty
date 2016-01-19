<%@page import="com.tasty.board.service.BoardWriteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<h2>회원 게시판 글쓰기</h2>
<form action="writeProcess.jsp" method="post">
	제목:<input name="title" /><br/>
	내용:<textarea rows="5" cols="40" name="content"> </textarea><br/>
	글쓴이:<input name="writer" /><br/>
	<button>작성</button>
</form>
</body>
</html>