<%@page import="com.tasty.member.service.FindPwService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String[] req = {request.getParameter("id"), request.getParameter("email")};
	ServiceInterface service = new FindPwService();
	
	String pw = (String) service.service(req);
	
	request.setAttribute("pw", pw);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/member/find.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/member/find.js"></script>
<title>비밀번호 찾기</title>
</head>
<body>

<h2>비밀번호 찾기</h2>

<div id="content">
	<c:choose>
		<c:when test="${!empty pw }">
			<span>귀하의 비밀번호는 ${pw } 입니다.</span><br><br>
			<a id="loginBtn">로그인</a>
		</c:when>

		<c:otherwise>
			<span>해당하는 정보가 없습니다.</span><br><br>
			<a href="javascript:history.back()">뒤로가기</a>
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>