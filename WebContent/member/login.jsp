<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/member/login.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/member/login.js"></script>
</head>
<body>

<div id="content">

<h2>로그인</h2>

<form action="loginProcess.jsp" method="post">
	<ul>
		<li><label>아이디</label><input type="text" name="id" id="id" /></li>
		<li><label>비밀번호</label><input type="password" name="pw" id="pw" /></li>
	</ul>
	<a id="loginBtn">로그인</a>
	<a id="findBtn">아이디 / 비밀번호 찾기</a>
</form>

</div>

</body>
</html>