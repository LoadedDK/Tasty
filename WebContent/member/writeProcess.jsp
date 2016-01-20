<%@page import="com.tasty.member.service.MemberWriteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.tasty.member.model.Member" />
<% request.setCharacterEncoding("utf-8"); %>
<jsp:setProperty name="member" property="*" />
<%
	ServiceInterface service = new MemberWriteService();
	service.service(member);
	response.sendRedirect("list.jsp");
%>
