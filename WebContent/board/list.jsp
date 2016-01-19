
<%@page import="com.tasty.board.model.BoardModel"%>
<%@page import="java.util.List"%>
<%@page import="com.tasty.board.service.BoardListService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!--  자바프로그램 적용 -->
<%
 	ServiceInterface service = new BoardListService(); 
	int cpage = 1; // default는 1이다.
	
	String pageStr = request.getParameter("page");
	if (pageStr != null)
		cpage = Integer.parseInt(pageStr);
	BoardModel model = (BoardModel) service.service(cpage);
	request.setAttribute("list", model.getList());
	request.setAttribute("jspData", model.getJspData());
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<c:forEach var="board" items="${list }">
${board.no }
${board.title }
</c:forEach>
</body>
</html>