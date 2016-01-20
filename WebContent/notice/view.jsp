<%@page import="com.tasty.controller.ServiceInterface"%>
<%@page import="com.tasty.notice.service.NoticeViewService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%	
	request.setCharacterEncoding("utf-8");

	String no = request.getParameter("no");;
	if(no!=null){
	ServiceInterface service = new NoticeViewService();
	request.setAttribute("notice", service.service(no));
	System.out.println(no);


%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>


	<h2>공지사항 글보기</h2>
	<table>
		<tr>
			<th>글번호</th>
			<td>${notice.no }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${notice.title }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${notice.content }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${notice.wdate }</td>
		</tr>
		<tr>
			<th>시작일</th>
			<td>${notice.startDate}</td>
		</tr>
		<tr>
			<th>종료일</th>
			<td>${notice.endDate }</td>
		</tr>
		<tr>
			<th></th>
			<td><img src="../img/${notice.fileName}"> </td>
		</tr>
		
		
	</table>
	<br>

	<button onclick="location = 'list.jsp'">글리스트</button>
	<button onclick="location = 'update.jsp?no=${notice.no }' ">글수정</button>
	<button
		onclick="location = 'deleteProcess.jsp?no=${notice.no }&page=${param.page}' ">글삭제</button>
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
</html>