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
	// NoticeListService 객체 생성 후 호출
	ServiceInterface service = new MainNoticeListService();
	NoticeModel model = (NoticeModel) service.service(cpage);
	request.setAttribute("list", model.getList());
	request.setAttribute("jspData", model.getJspData());
	
	int i = 1;
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 맛집</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
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
		<% if(session.getAttribute("id") != null) { %>
			<a href="../member/logoutProcess.jsp">
			<span id="logout"><%=session.getAttribute("name") %></span>
		<% } else { %>
			<a href="../member/loginProcess.jsp">
			<span id="login">로그인</span>
		<% } %>
		
		<img id="login_img" src="../img/login2.png">
		</a>
	</div>
</div>

<br><br><br><br><br>
<br><br><br><br><br>

<div id="content">
	
	<span id="logo">오늘의 맛집</span>
	
	<div id="notice_list">
		<span id="list_up" class="fa fa-chevron-up" onclick="list_up()"></span>
		<br>
			<!-- 맛집 리스트 작성 -->
			<div id="notice_list_inner">
				<table>
				<c:forEach var="notice" items="${list }">
					<tr><td><%=i++ %>. ${notice.title }</td></tr>
				</c:forEach>
				</table>
			</div>
		<br>
		<span id="list_down" class="fa fa-chevron-down" onclick="list_down()"></span>
	</div>
</div>

<div id="footer">
	
</div>

</body>
</html>