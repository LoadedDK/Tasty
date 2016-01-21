<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- </head> -->
<!-- <body> -->
<!-- <h2>공지사항 글쓰기</h2><br> -->
<!-- <form action="writeProcess.jsp" method="post" enctype="multipart/form-data"> -->
<!-- 글제목:<input name = "title"  /><br> -->
<!-- 글내용:<textarea rows="5 " cols="40" name ="content"></textarea><br> -->
<!-- 시작일: <input name = "startDate"  /><br>   -->
<!-- 마감일: <input name = "endDate"  /><br> -->
<!-- 첨부파일 <input type="file" name="fileName"><br/> -->
<!-- <button>작성</button> -->

<!-- </form> -->
<!-- </body> -->
<!-- </html> -->
<link rel="stylesheet" type="text/css"
	href="../css/notice/notice_write.css">
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/qna/writeNull.js"></script>
</head>
<body>
	<div id="notice_write_title">공지사항 글쓰기</div>
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
				<label for="startDate">공지시작일</label>
				<input name="startDate" id="startDate" class="writeForm" /></li>
				<li>
				<label for="endDate">공지종료일</label>
				<input name="endDate" id="endDate" class="writeForm" /></li>
				<li>
				<label for="file">첨부파일</label>
				<input type="file" name="fileName" id="file" class="writeForm"></li>
			</ul>
			<button id="notice_write_btn">작성</button>
			<br>
		</div>
	</form>
</body>
</html>