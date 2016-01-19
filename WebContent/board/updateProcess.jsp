
<%@page import="com.tasty.board.service.BoardUpdateService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
    <jsp:useBean id="board" class="com.tasty.board.model.Board"/>
    <jsp:setProperty property="*" name="board"/>
<%
ServiceInterface service = new BoardUpdateService();
service.service(board);
response.sendRedirect("view.jsp?no="+board.getNo());
%>