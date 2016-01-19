<%@page import="com.tasty.board.service.BoardViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String noStr = request.getParameter("no"); 
if(noStr!=null){
ServiceInterface service = new BoardViewService();
request.setAttribute("board", service.service(Integer.parseInt(noStr)));}
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
${board.content}
</body>
</html>