<%@page import="com.tasty.notice.service.NoticeUpdateService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
    <jsp:useBean id="notice" class="com.tasty.notice.model.Notice"/>
    <jsp:setProperty property="*" name="notice"/>
    
    <%
    ServiceInterface service = new NoticeUpdateService();
    service.service(notice);
    response.sendRedirect("view.jsp?no="+notice.getNo());
    %>
