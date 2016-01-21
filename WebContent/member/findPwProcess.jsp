<%@page import="com.tasty.member.service.FindPwService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String[] req = {request.getParameter("id"), request.getParameter("email")};
	ServiceInterface service = new FindPwService();
	request.setAttribute("pw", service.service(req));
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
	<span>귀하의 비밀번호는 ${pw } 입니다.</span><br><br>
	<a id="loginBtn">로그인</a>
</div>
</body>
</html>