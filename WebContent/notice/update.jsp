<%@page import="com.tasty.notice.service.NoticeViewService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	if(no!=null){
		ServiceInterface service = new NoticeViewService();
	    request.setAttribute("notice", service.service((String)request.getParameter("no")));
    }
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
<div id="notice_write_title" >공지사항 글수정</div>
<br><br>
	<form action="updateProcess.jsp?page=${param.page }" method="post" enctype="multipart/form-data" class="writeForm">
		<div id="form_wrapper">
			<ul>
				<li>
				<label>번호</label>
				<input id="no" name="no" size="" value="${notice.no}" readonly="readonly"/></li>
				<li>
				<label>제목</label>
				<input id="title" name="title" size="" value="${notice.title}" class="writeForm"/></li>
				<li>
				<label for="content">내용</label>
				<textarea name="content" id="content" class="writeForm">${notice.content} </textarea></li>
				<li>
				<label for="startDate">공지시작일</label>
				<input name="startDate" id="startDate" class="writeForm" value="${notice.startDate }" /></li>
				<li>
				<label for="endDate">공지종료일</label>
				<input name="endDate" id="endDate" class="writeForm" value="${notice.endDate }" /></li>
				<li>
				<label for="file">첨부파일명</label>
				<span id="update_file">${notice.fileName}</span>
				<input type="hidden" name="orgFileName" value="${notice.fileName}" >
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