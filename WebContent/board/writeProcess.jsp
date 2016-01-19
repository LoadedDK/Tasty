<%@page import="com.tasty.board.service.BoardWriteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="board" class="com.tasty.board.model.Board"/>
<jsp:setProperty property="*" name="board"/>
<%
ServiceInterface service = new BoardWriteService();
service.service(board);
response.sendRedirect("list.jsp");
%>    

