<%@page import="com.tasty.member.service.MemberUpdateService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.tasty.member.model.Member" />
<% request.setCharacterEncoding("utf-8"); %>
<jsp:setProperty name="member" property="*" />
<%
	ServiceInterface service = new MemberUpdateService();
	service.service(member);
	response.sendRedirect("view.jsp?id=" + member.getId());
%>
