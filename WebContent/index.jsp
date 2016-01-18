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
	<a href="#">오늘의 맛집</a>
	<br>
	
	<span class="logo">오늘의 맛집</span>
	
	<div id="notice_list">
		<span id="list_up" class="fa fa-chevron-up" onclick="list_up()"></span>
		
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
		
		<span id="list_down" class="fa fa-chevron-down" onclick="list_down()"></span>
	</div>
</div>

<div id="footer">
	
</div>

</body>
</html>