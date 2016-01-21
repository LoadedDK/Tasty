<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/member/find.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/member/find.js"></script>
<title>아이디 / 비밀번호 찾기</title>
</head>
<body>
<div id="content">
	
	<h2>아이디 찾기</h2>
	
	<form action="findIdProcess.jsp" method="post">
		<ul>
			<li><label>이메일</label><input type="email" name="email" id="email" /></li>
		</ul>
		<a id="findIdBtn">아이디 찾기</a>
	</form>
	
	<br><br><br><br>
	
	<h2>비밀번호 찾기</h2>
	
	<form action="findPwProcess.jsp" method="post">
		<ul>
			<li><label>아이디</label><input type="text" name="id" id="id" /></li>
			<li><label>이메일</label><input type="email" name="email" id="email" /></li>
		</ul>
		<a id="findPwBtn">비밀번호 찾기</a>
	</form>

</div>
</body>
</html>