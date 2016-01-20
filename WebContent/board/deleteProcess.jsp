<%@page import="com.tasty.board.service.BoardDeleteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ServiceInterface service = new BoardDeleteService();
service.service(Integer.parseInt(request.getParameter("no")));
response.sendRedirect("list.jsp?page="+Integer.parseInt(request.getParameter("page")));
%>
