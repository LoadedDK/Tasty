<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="writeProcess.jsp" method="post">
<h2>질문하기</h2>
제목 : <input name="title"><br/>
내용 : <textarea rows="5" cols="40" name="content"></textarea><br/>
작성자 : <input name="writer"><br/>
<button>질문</button>
</form>
</body>
</html>