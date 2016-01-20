<%@page import="com.tasty.notice.service.NoticeViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ServiceInterface service = new NoticeViewService();
    request.setAttribute("notice", service.service((String)request.getParameter("no")));
    System.out.println(request.getParameter("no"));
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>공지사항 글수정</h2><br>
<form action="updateProcess.jsp" method="post">
글번호:<input name = "no" value="${notice.no }" readonly="readonly" /><br>
글제목:<input name = "title" value="${notice.title }" /><br>
글내용:<textarea rows="5 " cols="40" name ="content">${notice.content }</textarea><br>
시작일: <input name = "startDate" value = "${notice.startDate }"/><br>  
마감일: <input name = "endDate" value = "${notice.endDate }"/><br>

<button>글수정</button>
</form>
</body>
</html>