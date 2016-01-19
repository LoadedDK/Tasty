<%@page import="com.tasty.qna.service.QnaDeleteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ServiceInterface service = new QnaDeleteService();
	service.service(Integer.parseInt(request.getParameter("no")));
	System.out.println("deleteProcess.jsp");
	response.sendRedirect("list.jsp");
%>