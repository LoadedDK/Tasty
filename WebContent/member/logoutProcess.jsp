<%@page import="com.tasty.member.model.Login"%>
<%@page import="com.tasty.member.service.LoginService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	ServiceInterface service = new LoginService();
	Login login = new Login();
	login.setId(request.getParameter("id"));
	login.setPw(request.getParameter("pw"));
	session.setAttribute("login", service.service(login));
	response.sendRedirect("index.jsp");
%>
