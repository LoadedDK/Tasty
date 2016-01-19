<%@page import="com.tasty.qna.service.QnaWriteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="com.tasty.qna.model.Qna"/>
<jsp:setProperty property="*" name="board"/>
<%
	ServiceInterface service = new QnaWriteService();
	service.service(board);
	System.out.println("writeProcess.jsp");
	response.sendRedirect("list.jsp");
%>