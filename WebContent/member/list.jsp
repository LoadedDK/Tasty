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
<title>Insert title here</title>
</head>
<body>

<h2>회원 리스트</h2>

	<table>
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
			<td><a href="view.jsp?id=${member.id }">${member.name }</a></td> 
			<td>${member.birth }</td>
			<td>${member.tel }</td>
			<td>${member.email }</td>
		</tr>
		</c:forEach>

	</table>
	<br>

	[<a href="list.jsp?page=1">처음</a>] 
	[<a href="list.jsp?page=${jspData.startPage > 1 ? jspData.startPage-jspData.pagesPerGroup : 1 }">&lt;&lt;</a>] 
	[<a href="list.jsp?page=${jspData.page > 1 ? jspData.page-1 : 1 }">&lt;</a>] 

	<c:forEach var="i" begin="${jspData.startPage }" end="${jspData.endPage }">
	[<a href="list.jsp?page=${i }">${i }</a>] 
	</c:forEach>

	[<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.page+1 : jspData.totalPage }">&gt;</a>] 
	[<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.endPage+1 : jspData.totalPage }">&gt;&gt;</a>] 
	[<a href="list.jsp?page=${jspData.totalPage }">끝</a>]

	<br><br>

	<button onclick="location='write.jsp'">회원가입</button>

</body>
</html>