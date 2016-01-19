<%@page import="com.tasty.qna.service.QnaReplyWriteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="com.tasty.qna.model.Qna"/>
<jsp:setProperty property="*" name="board"/>
<%
	ServiceInterface service = new QnaReplyWriteService();
	service.service(board);
	System.out.println("replyProcess.jsp");
	response.sendRedirect("list.jsp");
%>