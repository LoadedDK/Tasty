<%@page import="com.tasty.member.service.FindIdService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	ServiceInterface service = new FindIdService();
	request.setAttribute("id", service.service(request.getParameter("email")));
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/member/find.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/member/find.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="content">
	<span>귀하의 아이디는 ${id } 입니다.</span><br><br>
	<a id="loginBtn">로그인</a>
	<a id="findBtn">비밀번호 찾기</a>
</div>
</body>
</html>