<%@page import="com.tasty.member.model.Member"%>
<%@page import="com.tasty.member.service.MemberViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	ServiceInterface service = new MemberViewService();
	request.setAttribute("member", service.service(request.getParameter("id")));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateProcess.jsp" method="post">
	아이디 : <input type="text" name="id" value="${member.id }" readonly="readonly" /><br>
	이름 : <input type="text" name="name" value="${member.name }" /><br>
	생년월일 : <input type="text" name="birth" value="${member.birth }" /><br>
	연락처 : <input type="text" name="tel" value="${member.tel }" /><br>
	이메일 : <input type="text" name="email" value="${member.email }" /><br>
	<button>작성</button>
</form>
</body>
</html>