<%@page import="com.tasty.member.service.MemberDeleteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	ServiceInterface service = new MemberDeleteService();
	service.service(request.getParameter("id"));
	response.sendRedirect("list.jsp");
%>