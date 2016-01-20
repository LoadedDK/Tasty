<%@page import="com.tasty.member.service.FindPwService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String[] req = {request.getParameter("id"), request.getParameter("email")};
	ServiceInterface service = new FindPwService();
	request.setAttribute("pw", service.service(req));
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
${pw }
</body>
</html>