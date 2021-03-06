<%@page import="com.tasty.member.model.MemberModel"%>
<%@page import="com.tasty.member.service.MemberListService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ServiceInterface service = new MemberListService();
	int cpage = 1;
	String pageStr = request.getParameter("page");
	if(pageStr != null)
		cpage = Integer.parseInt(pageStr);
	MemberModel model = (MemberModel) service.service(cpage);
	request.setAttribute("list", model.getList());
	request.setAttribute("jspData", model.getJspData());
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../css/member/list.css" />
</head>
<body>

<div id="content">
<h2>회원 리스트</h2>

	<table id="memberTable">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>연락처</th>
			<th>이메일</th>
		</tr>
		<c:forEach var="member" items="${list }">
		<tr>
			<td>${member.id }</td>
			<td>${member.name }</td> 
			<td>${member.birth }</td>
			<td>${member.tel }</td>
			<td>${member.email }</td>
		</tr>
		</c:forEach>

	</table>
	<br>

	<a href="list.jsp?page=1"><span class="fa fa-step-backward"></span></a>
	<a href="list.jsp?page=${jspData.startPage > 1 ? jspData.startPage-jspData.pagesPerGroup : 1 }"><span class="fa fa-chevron-left"></span><span class="fa fa-chevron-left"></span></a>
	<a href="list.jsp?page=${jspData.page > 1 ? jspData.page-1 : 1 }"><span class="fa fa-chevron-left"></span></a>

	<c:forEach var="i" begin="${jspData.startPage }" end="${jspData.endPage }">
		<c:choose>
			<c:when test="${jspData.page eq i }">
				<span id="cpage">${i }</span>
			</c:when>
			<c:otherwise>
				<a href="list.jsp?page=${i }">${i }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.page+1 : jspData.totalPage }"><span class="fa fa-chevron-right"></span></a>
	<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.endPage+1 : jspData.totalPage }"><span class="fa fa-chevron-right"></span><span class="fa fa-chevron-right"></span></a>
	<a href="list.jsp?page=${jspData.totalPage }"><span class="fa fa-step-forward"></span></a>
	
</div>

</body>
</html>