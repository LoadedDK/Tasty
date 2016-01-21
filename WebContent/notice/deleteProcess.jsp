<%@page import="com.tasty.notice.service.NoticeDeleteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String no = request.getParameter("no");
ServiceInterface service = new  NoticeDeleteService();
service.service(no);

response.sendRedirect("list.jsp");
%>
