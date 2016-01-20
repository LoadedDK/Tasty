<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오늘의 맛집</title>
<link rel="stylesheet" type="text/css" href="../css/main.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<script src="../js/main.js"></script>
</head>
<body>

<div id="header">

</div>

<div id="content">
	<div id="nav_main">
		<a href="./notice/list.jsp">오늘의 맛집</a>
		<a href="./board/list.jsp">맛집 이야기</a>
		<a href="./qna/list.jsp">QnA</a>
		<a href="./member/mypage.jsp">마이페이지</a>
		<a href="./member/list.jsp">회원관리</a>
	</div>
	
	<div id="login">
		로그인
		<img id="login_img" src="../img/login2.png">
	</div>
	
	<br><br><br>
	
	<span id="logo">오늘의 맛집</span>
	
	<div id="notice_list">
		<span id="list_up" class="fa fa-chevron-up" onclick="list_up()"></span>
		<br>
			<!-- 맛집 리스트 작성 -->
			<div id="notice_list_inner">
				<table>
					<tr><td>1. 화상손만두</td></tr>
					<tr><td>2. 민주네 떡볶이</td></tr>
					<tr><td>3. 란주탕수육</td></tr>
					<tr><td>4. 맛있다해</td></tr>
					<tr><td>5. 응</td></tr>
				</table>
			</div>
		<br>
		<span id="list_down" class="fa fa-chevron-down" onclick="list_down()"></span>
	</div>
</div>

<div id="footer">
	
</div>

</body>
</html>