<%@page import="com.tasty.member.model.Member"%>
<%@page import="com.tasty.member.service.MemberViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	ServiceInterface service = new MemberViewService();
	Member member = (Member) service.service(session.getAttribute("id"));
	request.setAttribute("member", member);
	
	String tel1 = member.getTel().substring(0,3);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/member/mypage.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/member/mypage.js"></script>
<title>마이페이지</title>
</head>
<body>

<div id="content">

<h2>마이페이지</h2>

<c:choose>
	<c:when test="${!empty id }">

		<form action="updateProcess.jsp" method="post">
			<input type="hidden" id="oldPw1" value="${member.pw }">
			<ul>
				<li><label>아이디</label><input type="text" name="id" value="${member.id }" readonly="readonly" /></li>
				<li><label>현재 비밀번호</label><input type="password" id="oldPw2" /></li>
				<li><label>새로운 비밀번호</label><input type="password" name="pw" id="newPw1" /></li>
				<li><label>비밀번호 확인</label><input type="password" id="newPw2" /></li>
				<li><label>이름</label><input type="text" id="name" name="name" value="${member.name }" /></li>
				<li><label>생년월일</label><input type="text" id="birth" name="birth" value="${member.birth }" /></li>
				<li><label>연락처</label>
				
					<select name="tel1" id="tel1" >
						<option <% if(tel1.equals("010")) { %> selected="selected"<% } %>>010</option>
						<option <% if(tel1.equals("011")) { %> selected="selected"<% } %>>011</option>
						<option <% if(tel1.equals("016")) { %> selected="selected"<% } %>>016</option>
						<option <% if(tel1.equals("017")) { %> selected="selected"<% } %>>017</option>
						<option <% if(tel1.equals("018")) { %> selected="selected"<% } %>>018</option>
						<option <% if(tel1.equals("019")){ %> selected="selected"<% } %>>019</option>
					</select>
					- <input type="text" name="tel2" id="tel2" value="${fn:substring(member.tel, 4, 8) }" /> - <input type="text" name="tel3" id="tel3" value="${fn:substring(member.tel, 9, 13) }" />
				</li>
				<li><label>이메일</label><input type="email" id="email" name="email" value="${member.email }" /></li>
			</ul>
			
			<a id="updateBtn">정보수정</a>
		</form>
		
		<br><br>
		
		<form action="deleteProcess.jsp" method="post">
			<input type="hidden" id="id" name="id" value="${member.id }">
			<a id="deleteBtn">회원탈퇴</a>
		</form>

	</c:when>
	<c:otherwise>
		로그인 후 이용해주세요.
	</c:otherwise>
</c:choose>

</div>

</body>
</html>