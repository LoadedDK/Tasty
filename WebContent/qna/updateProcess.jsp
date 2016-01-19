<%@page import="com.tasty.qna.service.QnaUpdateService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="qna" class="com.tasty.qna.model.Qna"/>
<jsp:setProperty property="*" name="qna"/>
<%
	// update 하는 서비스 생성 후 호출
	ServiceInterface service = new QnaUpdateService();
	service.service(qna);
	System.out.println("updateProcess.jsp");
	response.sendRedirect("view.jsp?no="+qna.getNo()+"&page="+request.getParameter("page"));
%>