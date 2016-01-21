<%@page import="com.tasty.member.service.MemberViewService"%>
<%@page import="com.tasty.member.model.Member"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/member/member.css">
<title>회원정보보기</title>
</head>
<body>
<%
	if(id != null) {
		ServiceInterface service = new MemberViewService();
		request.setAttribute("member", service.service(id));
%>
<h2>회원 게시판 글보기</h2>
	<table>
		<tr>
			<th>아이디</th>
			<td>${member.id }</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${member.name }</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>${member.birth }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${member.tel }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${member.email }</td>
		</tr>
	</table>
	<button onclick="location='list.jsp'">회원 리스트</button>
<button onclick="location='update.jsp?id=${member.id}'">회원정보수정</button>
<button onclick="location='deleteProcess.jsp?id=${member.id}'">회원 탈퇴</button>

<%
	}
	else {
%>
		<br>오류 : 회원 아이디가 있어야 합니다.<br>
		<button onclick="history.back()">이전 페이지로</button>
<%
	}
%>

</body>
</html>
