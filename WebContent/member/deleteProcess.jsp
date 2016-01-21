<%@page import="com.tasty.member.service.MemberDeleteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	setTimeout("location.href='../index.jsp'",3000);
</script>
<title>회원탈퇴</title>
<%
	request.setCharacterEncoding("UTF-8");
	ServiceInterface service = new MemberDeleteService();
	service.service(request.getParameter("id"));
	
	session.setAttribute("id", null);
	session.setAttribute("name", null);
	session.setAttribute("grade", null);
%>

탈퇴에 성공하였습니다.<br>
3초후에 메인 페이지로 이동합니다.
