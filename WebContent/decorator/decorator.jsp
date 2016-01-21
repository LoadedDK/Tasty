<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../favicon.png">
<link rel="icon" type="image/x-icon" href="../favicon.png">
<link rel="stylesheet" type="text/css" href="../decorator/decorator.css">
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
			<a href="../member/mypage.jsp">마이페이지</a>
			<a href="../member/list.jsp">회원관리</a>
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