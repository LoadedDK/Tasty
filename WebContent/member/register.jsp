<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/member/member.css">
</head>
<body>

<div id="content">

<h2>회원가입</h2>

<form action="registerProcess.jsp" method="post">
	<ul>
		<li><label>아이디</label><input type="text" name="id" id="id" /></li>
		<li><label>비밀번호</label><input type="password" name="pw" id="pw" /></li>
		<li><label>비밀번호 확인</label><input type="password"/></li>
		<li><label>이름</label><input type="text" name="name" id="name" /></li>
		<li><label>생년월일</label><input type="text" name="birth" id="birth" /></li>
		<li><label>연락처</label>
			<select name="tel1" id="tel1">
				<option>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			- <input type="text" name="tel2" id="tel2" /> - <input type="text" name="tel3" id="tel3" />
		</li>
		<li><label>이메일</label><input type="email" name="email" id="email" /></li>
	</ul>
	<button type="submit">작성</button>

</form>

</div>

</body>
</html>