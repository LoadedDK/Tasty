<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../favicon.png">
<link rel="icon" type="image/x-icon" href="../favicon.png">
<link rel="stylesheet" type="text/css" href="../decorator/decorator.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#logoutBtn").click(function() {
		if(confirm("로그아웃하시겠습니까?"))
			window.location = "../member/logoutProcess.jsp";
	});
});
</script>
<title>오늘의 맛집 - <decorator:title /></title>
<decorator:head />
</head>
<body>
<div id="wrapper">
	<header>
		<div id="main_title">
			<a href="../index.jsp"><span>오늘의 맛집</span></a>
		</div>
		<div id="main_nav">
			<a href="../notice/list.jsp">오늘의 맛집</a>
			<a href="../board/list.jsp">맛집 이야기</a>
			<a href="../qna/list.jsp">QnA</a>
			
			<c:if test="${!empty id }">
				<c:choose>
					<c:when test="${grade eq 1 }">
						<a href="../member/mypage.jsp">마이페이지</a>
					</c:when>
					<c:when test="${grade eq 9 }">
						<a href="../member/list.jsp">회원관리</a>
					</c:when>
				</c:choose>
			</c:if>
			
		</div>
		
		<div id="login_div">
	
		<c:choose>
			<c:when test="${!empty name }">
				<a id="logoutBtn">
				<span id="logout">${name }</span>
			</c:when>
			<c:otherwise>
				<a href="../member/login.jsp?url=<%= request.getRequestURI() %>">
				<span id="login">로그인</span>
			</c:otherwise>
		</c:choose>
	
		<img id="login_img" src="../img/login.png">
		</a>
		
	</div>
	</header>
	<div id="content_wrapper">
		<decorator:body />
	</div>
	<footer>
		ⓒ Copyright 2016 Today's Restaurant
	</footer>
</div>
</body>
</html>