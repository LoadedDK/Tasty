<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="findIdProcess.jsp" method="post">
	이메일 : <input type="email" name="email"><br>
	<input type="submit" value="아이디 찾기">
</form>

<br><br>

<form action="findPwProcess.jsp" method="post">
	아이디 : <input type="text" name="id"><br>
	이메일 : <input type="email" name="email"><br>
	<input type="submit" value="비밀번호 찾기">
</form>

</body>
</html>