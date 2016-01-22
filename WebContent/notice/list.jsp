<%@page import="com.tasty.notice.service.NoticeListService"%>
<%@page import="com.tasty.notice.model.NoticeModel"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@page import="com.tasty.notice.model.Pp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  자바프로그램 적용 -->
<%
	int cpage=1;
    String pageStr=request.getParameter("page");
    if(pageStr != "" && pageStr != null)
    	cpage=Integer.parseInt(pageStr);
	
	// 공지 시점 지정하는 변수 period로 전달 받기
	String pri = request.getParameter("pri");

	
	if(pri==null) pri="cur"; //기본적으로 현재 공지를 보여주도록 설정.
	
	Pp pp= new Pp();
	pp.setPeriod(pri);
	pp.setCpage(cpage);
	
	// NoticeListService 객체 생성 후 호출
	ServiceInterface service = new NoticeListService();
	NoticeModel model = (NoticeModel) service.service(pp);
	request.setAttribute("list", model.getList());
	request.setAttribute("jspData", model.getJspData());
	request.setAttribute("pri", pri );

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/notice/notice_list.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
	<section>
		<div id="content">
			<div id="list_head">오늘의 맛집</div>
			<c:if test="${grade eq 9 }">
			<div id="btn_wrapper">
			<a id="write_btn" href="write.jsp">글쓰기</a>
			</div><br>
			
				<div id="notice_list_pbtn">
					<a onclick="location='list.jsp?pri=cur'">현재공지</a>
					<a onclick="location='list.jsp?pri=old'">지난공지</a>
					<a onclick="location='list.jsp?pri=res'">미래공지</a>
					<a onclick="location='list.jsp?pri=all'">모든공지</a>
				</div>
			</c:if>
			<ul>
			<c:forEach var="notice" items="${list }">
				<li>
					<div class="list_content">
						<div id="list_title"><a href="view.jsp?no=${notice.no}&page=${jspData.page}"
						>${notice.title }</a>
						</div><br><br>
						<div id="list_content" class="textOver">${notice.content}</div><br>
						<div id="list_startDate">공지기간  :  ${notice.wdate} ~ ${notice.endDate }</div><br>
					</div>	
					
					<div class="list_img">
						<c:if test="${!empty notice.fileName }">
							<a href="view.jsp?no=${notice.no }&page=${jspData.page }"><img src="upload/${notice.fileName }" /></a>
						</c:if>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div id="pageMove">
			<a href="list.jsp?page=1"><span class="fa fa-step-backward"></span></a>
			<a href="list.jsp?page=${jspData.startPage > 1 ? jspData.startPage-jspData.pagesPerGroup : 1 }"><span class="fa fa-chevron-left"></span><span class="fa fa-chevron-left"></span></a>
			<a href="list.jsp?page=${jspData.page > 1 ? jspData.page-1 : 1 }"><span class="fa fa-chevron-left"></span></a>
		
			<c:forEach var="i" begin="${jspData.startPage }" end="${jspData.endPage }">
				<c:choose>
					<c:when test="${jspData.page eq i }">
						<span id="cpage">${i }</span>
					</c:when>
					<c:otherwise>
						<a href="list.jsp?page=${i }">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		
			<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.page+1 : jspData.totalPage }"><span class="fa fa-chevron-right"></span></a>
			<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.endPage+1 : jspData.totalPage }"><span class="fa fa-chevron-right"></span><span class="fa fa-chevron-right"></span></a>
			<a href="list.jsp?page=${jspData.totalPage }"><span class="fa fa-step-forward"></span></a>
		</div>
		<br> <br>

	</section>
</body>
</html>