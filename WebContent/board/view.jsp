<%@page import="com.tasty.board.service.BoardViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/board/board_view.css">
</head>
<body>
	<%
		String noStr = request.getParameter("no");
		if (noStr != null) {
			ServiceInterface service = new BoardViewService();
			request.setAttribute("board", service.service(Integer.parseInt(noStr)));
	%>

	<section>

		<div id="articleTop">
			<div id="articleTitle"><h3>${board.title }</h3> </div>	
			<div id="articleWdate">${board.wdate}</div>	
			<div id="articleWriter">${board.writer}</div>	
			<div id="articleContent">${board.content}</div>	
			<div id="articleImage"><img src="../img/${board.fileName}"> </div>	

		
		</div>

		<br>
		<a href="list.jsp">글리스트</a>
		<a href="update.jsp?no=${board.no }">글수정</a>
		<a href="deleteProcess.jsp?no=${board.no }&page=${param.page}">글삭제</a>

	</section>

	<%
		} // 글번호가 넘어온 경우 처리
		else { // 글번호가 넘어오지 않는 경우 처리
	%>
	<br>
	<br> 오류: 글번호가 있어야 합니다.
	<br>
	<br>
	<button onclick="history.back()">이전 페이지로</button>
	<%
		}
	%>
</body>
</html>
