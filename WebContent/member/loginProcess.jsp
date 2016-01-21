<%@page import="com.tasty.member.model.Login"%>
<%@page import="com.tasty.member.service.LoginService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<title>로그인</title>
<%
	request.setCharacterEncoding("UTF-8");
	ServiceInterface service = new LoginService();
	Login login = new Login();
	login.setId(request.getParameter("id"));
	login.setPw(request.getParameter("pw"));

	login = (Login) service.service(login);
	
	if(login != null) {
		session.setAttribute("id", login.getId());
		session.setAttribute("name", login.getName());
		session.setAttribute("grade", login.getGrade());
		
		String url = request.getParameter("url");
		
		if(url == null)
			url = "index.jsp";
		
		response.sendRedirect("../" + url);
	}
	else {
		%>
		<body>
		해당하는 정보가 없습니다.<br><br>
		<a href="javascript:history.back()" style="padding: 3px 10px; background: #00cdcd; color: white; font-weight: bolder; cursor: pointer; text-decoration: none;">뒤로가기</a>
		</body>
		<%
	}
%>
