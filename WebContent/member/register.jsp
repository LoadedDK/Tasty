<%@page import="java.util.ArrayList"%>
<%@page import="com.tasty.member.service.MemberIdListService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	ServiceInterface service = new MemberIdListService();
	@SuppressWarnings("unchecked")
	ArrayList<String> list = (ArrayList<String>) service.service(null);
	String[] idList = list.toArray(new String[list.size()]);
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/member/register.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="../js/member/register.js"></script>
<script type="text/javascript">

var id = new Array();
<%
	for(String id : idList)
		out.println("id.push('" + id + "');");
%>

</script>
</head>
<body>

<div id="content">

<h2>회원가입</h2>

<form action="registerProcess.jsp" method="post">
	<ul>
		<li><label>아이디</label><input type="text" name="id" id="id" /></li>
		<li><label>비밀번호</label><input type="password" name="pw" id="pw" /></li>
		<li><label>비밀번호 확인</label><input type="password"/></li>
		<li><label>이름</label><input type="text" name="name" id="name" /></li>
		<li><label>생년월일</label><input type="text" name="birth" id="birth" /></li>
		<li><label>연락처</label>
			<select name="tel1" id="tel1">
				<option>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			- <input type="text" name="tel2" id="tel2" /> - <input type="text" name="tel3" id="tel3" />
		</li>
		<li><label>이메일</label><input type="email" name="email" id="email" /></li>
	</ul>
	<a id="registerBtn">회원가입</a>

</form>

</div>

</body>
</html>