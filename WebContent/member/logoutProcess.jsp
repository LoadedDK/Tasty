<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	session.setAttribute("id", null);
	session.setAttribute("name", null);
	session.setAttribute("grade", null);

	response.sendRedirect("../index.jsp");
%>
