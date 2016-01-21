<%@page import="com.tasty.qna.model.Qna"%>
<%@page import="com.tasty.qna.service.QnaReplyViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
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
<title>QnA - 답변하기</title>
<link rel="stylesheet" type="text/css" href="../css/qna/reply.css">
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
<div id="form_wrapper">
<ul>
<!-- 원문내용을 보여주고 나머지를 입력하는 데이터들 -->
<li><label>제목</label><input name="title" value="[답변] ${qna.title}"></li>
<li><label>내용</label><textarea rows="5" cols="40" name="content">


=======[원문내용]=======
${qna.content}
</textarea></li>
<li><label>작성자</label><input name="writer"></li>
</ul>
<button>답변</button>
</div>
</form>
</body>
</html>