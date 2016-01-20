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
<link rel="stylesheet" type="text/css" href="../css/board/img.css">
<style type="text/css">
/*선택후 선택한 것에 대한 모양지정 */
th {
	background: black;
	color: white;
	width: 60px;
}

td {
	width: 200px;
	border: solid 1px #888;
}

td, th {
	padding: 10px;
}

</style>
</head>
<body>
	<%
		String noStr = request.getParameter("no");
		if (noStr != null) {
			ServiceInterface service = new BoardViewService();
			request.setAttribute("board", service.service(Integer.parseInt(noStr)));
	%>

	<h2>회원 게시판 글보기</h2>
	<table>
		<tr>
			<th>글번호</th>
			<td>${board.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${board.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.content }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.wdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.hit }</td>
		</tr>
		<tr>
			<th>파일이름</th>
			<td>${board.fileName }</td>
		</tr>
		<tr>
			<th>이미지 사진</th>
			<td><img src="../img/food.jpg" ></td>
		</tr> 
	</table>
	<br>

	<button onclick="location = 'list.jsp'">글리스트</button>
	<button onclick="location = 'update.jsp?no=${board.no }' ">글수정</button>
	<button
		onclick="location = 'deleteProcess.jsp?no=${board.no }&page=${param.page}' ">글삭제</button>
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
