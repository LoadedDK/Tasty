<%@page import="com.tasty.member.model.Login"%>
<%@page import="com.tasty.member.service.LoginService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	ServiceInterface service = new LoginService();
	Login login = new Login();
// 	login.setId(request.getParameter("id"));
// 	login.setPw(request.getParameter("pw"));

	login.setId("karlos");
	login.setPw("4936");

	login = (Login) service.service(login);
	
	session.setAttribute("id", login.getId());
	session.setAttribute("name", login.getName());
	session.setAttribute("grade", login.getGrade());
	
	response.sendRedirect("../index.jsp");
%>
