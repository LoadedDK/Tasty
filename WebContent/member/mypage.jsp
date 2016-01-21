<%@page import="com.tasty.member.model.Member"%>
<%@page import="com.tasty.member.service.MemberViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ServiceInterface service = new MemberViewService();
	request.setAttribute("member", service.service(session.getAttribute("id")));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/member/mypage.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/member/mypage.js"></script>
<title>Insert title here</title>
</head>
<body>

<div id="content">

<form action="updateProcess.jsp" method="post">
	<ul>
		<li><label>아이디</label><input type="text" name="id" value="${member.id }" readonly="readonly" /></li>
		<li><label>비밀번호</label><input type="password" name="pw" /></li>
		<li><label>비밀번호 확인</label><input type="password" /></li>
		<li><label>이름</label><input type="text" name="name" value="${member.name }" /></li>
		<li><label>생년월일</label><input type="text" name="birth" value="${member.birth }" /></li>
		<li><label>연락처</label><input type="text" name="tel" value="${member.tel }" /></li>
		<li><label>이메일</label><input type="email" name="email" value="${member.email }" /></li>
		
	</ul>
	
	<a id="updateBtn">정보수정</a>

</form>

</div>

</body>
</html>