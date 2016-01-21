<%@page import="com.tasty.notice.model.Notice"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@page import="com.tasty.notice.service.NoticeViewService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%	
	request.setCharacterEncoding("utf-8");
%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/notice/notice_view.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/notice/notice_view.js"></script>
</head>
<body>
	<%
		String no = request.getParameter("no");;
		if(no!=null){
		ServiceInterface service = new NoticeViewService();
		Notice notice = (Notice)service.service(no);
		
		notice.setContent(notice.getContent().replace("\r\n", "<br>"));

		request.setAttribute("notice", notice);
	 	
	%>
	<div id="articleMain">
		<div id="articleTop">
			<div id="articleTitle">${notice.title }</div>
			<div id="articleWdate"><b>공지날짜</b> ${notice.startDate} ~ ${notice.endDate}</div>
			<div id="articleContent">${notice.content}</div>
			<div id="articleImage">
				<c:if test="${!empty notice.fileName }">

					<img src="../upload/${notice.fileName}"/>
				</c:if>		
			</div>
		</div>
		<br>
		<div>
			<div id="btn_wrapper">
				<a class="view_btn" href="list.jsp?page=${param.page}">글목록</a>
				<a class="view_btn" href="update.jsp?no=${notice.no }&page=${param.page}">글수정</a>
				<a class="view_btn" id="delete_btn" href="deleteProcess.jsp?no=${notice.no }&page=${param.page}">글삭제</a>
			</div>			
			
<!-- 			<ul> -->
<!-- 				<li><a href="list.jsp">글리스트</a></li> -->
<%-- 				<li><a href="update.jsp?no=${notice.no }">글수정</a></li> --%>
<!-- 				<li><a -->
<%-- 					href="deleteProcess.jsp?no=${notice.no }&page=${param.page}">글삭제</a></li> --%>
<!-- 			</ul> -->
		</div>
	</div>
	<!-- 	<h2>공지사항 글보기</h2> -->
<!-- 	<table> -->
<!-- 		<tr> -->
<!-- 			<th>글번호</th> -->
<%-- 			<td>${notice.no }</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>제목</th> -->
<%-- 			<td>${notice.title }</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>내용</th> -->
<%-- 			<td>${notice.content }</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>작성일</th> -->
<%-- 			<td>${notice.wdate }</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>시작일</th> -->
<%-- 			<td>${notice.startDate}</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th>종료일</th> -->
<%-- 			<td>${notice.endDate }</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<th></th> -->
<%-- 			<td><img src="../img/${notice.fileName}"> </td> --%>
<!-- 		</tr> -->
<!-- 	<br> -->
<!-- 	<button onclick="location = 'list.jsp'">글리스트</button> -->
<%-- 	<button onclick="location = 'update.jsp?no=${notice.no }' ">글수정</button> --%>
<%-- 	<button onclick="location = 'deleteProcess.jsp?no=${notice.no }&page=${param.page}' ">글삭제</button> --%>
	<%
		} // 글번호가 넘어온 경우 처리
		else { // 글번호가 넘어오지 않는 경우 처리
	%>
	<br>
	<br> 오류: 글번호가 있어야 합니다.
	<br>
	<br>
	<button onclick="history.back()">이전 페이지로</button>
	<%
		}
	%>
</body>
</html>