<%@page import="com.tasty.board.service.BoardViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
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
<link rel="stylesheet" type="text/css" href="../css/board/board_write.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/qna/writeNull.js"></script>

</head>
<body>
<div id="board_write_title" >게시판 글수정</div>
<br><br>
	<form action="updateProcess.jsp?page=${param.page }" method="post" enctype="multipart/form-data" class="writeForm">
		<div id="form_wrapper">
			<ul>
			
				<li>
				<label>번호</label>
				<input id="no" name="no" size="" value="${board.no}" readonly="readonly"/></li>

				<li>
				<label>제목</label>
				<input id="title" name="title" size="" value="${board.title}" class="writeForm"/></li>
				
				<li>
				<label for="content">내용</label>
				<textarea name="content" id="content" class="writeForm">${board.content} </textarea></li>
				
				<li>
				<label for="writer">글쓴이</label>
				<input name="writer" id="writer"  value="${board.writer}" readonly="readonly" class="writeForm"/></li>
				
				<li>
				<label for="file">첨부파일명</label>
				<span id="update_file">${board.fileName}</span>
				<input type="hidden" name="orgFileName" value="${board.fileName}" >
				</li>
				
				<li>
				<label for="file">첨부파일</label>
				<input type="file" name="fileName" id="file"></li>
			</ul>
			<button>작성</button>
			<br>
		</div>
	</form>
</body>
</html>