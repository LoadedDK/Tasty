<%@page import="com.tasty.board.service.BoardWriteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../css/board/board_write.css">
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/qna/writeNull.js"></script>
</head>
<body>
	<div id="board_write_title">자유 게시판 글쓰기</div>
	<br><br>
	<form action="writeProcess.jsp" method="post" enctype="multipart/form-data" class="writeForm">
		<div id="form_wrapper">
			<ul>
			
				<li>
				<label>제목</label>
				<input id="title" class="writeForm" name="title" size="" /></li>
				
				<li>
				<label for="content">내용</label>
				<textarea name="content" id="content" class="writeForm"></textarea></li>
				
				<li>
				<label for="writer">글쓴이</label>
				<input name="writer" id="writer" class="writeForm" /></li>
				
				<li>
				<label for="file">첨부파일</label>
				<input type="file" name="fileName" id="file" class="writeForm"></li>
				
			</ul>
			<button id="board_write_btn">작성</button>
			<br>
		</div>
	</form>
</body>
</html>