<%@page import="com.tasty.notice.service.MainNoticeListService"%>
<%@page import="com.tasty.notice.model.NoticeModel"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int cpage=1;
    String pageStr=request.getParameter("page");
    if(pageStr!=null)
    	cpage=Integer.parseInt(pageStr);
    
	ServiceInterface service = new MainNoticeListService();
	request.setAttribute("list", service.service(null));
	
	int i = 1;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 맛집</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<script src="../js/main.js"></script>
</head>
<body>

<div id="back"></div>

<div id="header">
	<div id="nav_main">
		<a href="./notice/list.jsp">오늘의 맛집</a>
		<a href="./board/list.jsp">맛집 이야기</a>
		<a href="./qna/list.jsp">QnA</a>
		<a href="./member/mypage.jsp">마이페이지</a>
		<a href="./member/list.jsp">회원관리</a>
	</div>
	
	<div id="login_div">
	
		<c:choose>
			<c:when test="${!empty name }">
				<a href="../member/logoutProcess.jsp">
				<span id="logout">${name }</span>
			</c:when>
			<c:otherwise>
				<a href="../member/login.jsp">
				<span id="login">로그인</span>
			</c:otherwise>
		</c:choose>
	
		<img id="login_img" src="../img/login2.png">
		</a>
	</div>
</div>

<c:set var="i" value="0" />

<div id="content">
	
	<span id="logo">오늘의 맛집</span>
	
	<div id="notice_list">
		<div id="notice_list_inner">
			<table>
			<c:forEach var="notice" items="${list }">
				<tr><td><a href="../notice/view.jsp?no=${notice.no }">${i=i+1 }. ${notice.title }</a></td></tr>
			</c:forEach>
			</table>
		</div>
	</div>
</div>

<div id="footer">
	
</div>

</body>
</html>