<%@page import="com.tasty.qna.model.Qna"%>
<%@page import="com.tasty.qna.service.QnaReplyViewService"%>
<%@page import="com.webjjang.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 글번호를 받는다.
	int no = Integer.parseInt(request.getParameter("no"));
	ServiceInterface service = new QnaReplyViewService();
	Qna qna = (Qna)service.service(no);
	// EL 객체로 사용하기 위해 request에 담는다.
	request.setAttribute("qna", qna);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="replyProcess.jsp" method="post">
<h2>답변하기</h2>
<!-- 원문내용의 그 외 데이터들 : type="hidden" 으로 안보이게 처리 -->
<input type="hidden" name="no" value="${qna.no}">
<input type="hidden" name="refNo" value="${qna.refNo}">
<input type="hidden" name="ordNo" value="${qna.ordNo}">
<input type="hidden" name="levNo" value="${qna.levNo}">
<input type="hidden" name="parentNo" value="${qna.no}">

<!-- 원문내용을 보여주고 나머지를 입력하는 데이터들 -->
제목 : <input name="title" value="[답변] ${qna.title}"><br/>
내용 : <textarea rows="5" cols="40" name="content">


--[원문내용]-----------------------
${qna.content}
</textarea><br/>
작성자 : <input name="writer"><br/>
<button>답변</button>
</form>
</body>
</html>