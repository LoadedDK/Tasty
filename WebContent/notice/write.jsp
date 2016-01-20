<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>공지사항 글쓰기</h2><br>
<form action="writeProcess.jsp" method="post" enctype="multipart/form-data">
글제목:<input name = "title"  /><br>
글내용:<textarea rows="5 " cols="40" name ="content"></textarea><br>
시작일: <input name = "startDate"  /><br>  
마감일: <input name = "endDate"  /><br>
첨부파일 <input type="file" name="fileName"><br/>
<button>작성</button>

</form>
</body>
</html>