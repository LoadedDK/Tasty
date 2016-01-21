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
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/board/board_view.js"></script>
</head>
<body>
	<%
		String noStr = request.getParameter("no");
		if (noStr != null) {
			ServiceInterface service = new BoardViewService();
			request.setAttribute("board", service.service(Integer.parseInt(noStr)));
	%>

		<div id="articleMain">
			<div id="articleTop">
				<div id="articleTitle">${board.title }</div>	
				<div id="articleWdate">${board.wdate}</div>
				<div id="articleWriter">${board.writer}</div>	
				<div id="articleContent">${board.content}</div>	<br>
				<div id="articleImage"><img src="../img/${board.fileName}"> </div>	
	
			
			</div>
	
			<br>
			
			<div id="btn_wrapper">
				<a class="view_btn" href="list.jsp?page=${param.page}">글목록</a>
				<a class="view_btn" href="update.jsp?no=${board.no }&page=${param.page}">글수정</a>
				<a class="view_btn" id="delete_btn" href="deleteProcess.jsp?no=${board.no }&page=${param.page}">글삭제</a>
			</div>
		</div>

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
