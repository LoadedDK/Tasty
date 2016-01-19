<%@page import="com.tasty.member.service.MemberDeleteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ServiceInterface service = new MemberDeleteService();
	service.service(Integer.parseInt(request.getParameter("id")));
	response.sendRedirect("list.jsp");
%>