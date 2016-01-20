<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원가입</h2>
<form action="writeProcess.jsp" method="post">
	아이디 : <input type="text" name="id" />
	<br>
	비밀번호 : <input type="text" name="pw" />
	<br>
	이름 : <input type="text" name="name" />
	<br>
	생년월일 : <input type="text" name="birth" />
	<br>
	연락처: <input type="text" name="tel" />
	<br>
	이메일 : <input type="text" name="email" />
	<br>
	<button type="submit">작성</button>
</form>
</body>
</html>