<%@page import="com.tasty.notice.model.Pp"%>
<%@page import="com.tasty.notice.model.NoticeModel"%>
<%@page import="com.tasty.notice.service.NoticeListService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--  자바프로그램 적용 -->
<%
	int cpage=1;
    String pageStr=request.getParameter("page");
    if(pageStr!=null)
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
	request.setAttribute("pri", pri);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*선택후 선택한 것에 대한 모양지정 */
table {
	border-style: solid;
	border-color: black;
	width: 600px;
}

th {
	color: black;
	width: 100px;
	padding: 10px;
}
</style>
</head>
<body>
	<section>
		<div id="content">
			<h2>공지사항 리스트</h2>
			<ui>
			<button onclick="location='list.jsp?pri=cur'">현재공지</button>
			<button onclick="location='list.jsp?pri=old'">과거공지</button>
			<button onclick="location='list.jsp?pri=res'">미래공지</button>
			<button onclick="location='list.jsp?pri=all'">모든공지</button>

			<c:forEach var="notice" items="${list }">
				<li>
					<div id="list_content">
						<%-- ${board } --%>
						<a href="view.jsp?no=${notice.no}&page=${jspData.page}">${notice.title }</a><br>
							${notice.content}<br>
							게시일:${notice.wdate}<br>
							공지시작일:${notice.startDate}
					</div>
					
					<div class="list_img">
							<img src="../img/${notice.fileName }">
					</div>
				</li>
			</c:forEach>
			</ui>
		</div>
		<div id="pageMove">
			<!-- 	페이지 처리 = 반복문 처리-->
			[<a href="list.jsp?pri=${pri }&page=1">처음</a>] [<a
				href="list.jsp?pri=${pri }&page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }">&lt;&lt;</a>]
			[<a href="list.jsp?pri=${pri }&page=${jspData.page >1?jspData.page-1:1 }">&lt;</a>]

			<c:forEach var="i" begin="${jspData.startPage }"
				end="${jspData.endPage }">
				<!-- 블랭크가 들어가면 String이기때문에 오류가 발생한다.  -->
			[<a href="list.jsp?pri=${pri }&page=${i }">${i }</a>]
			</c:forEach>

			[<a
				href="list.jsp?pri=${pri}&page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }">&gt;</a>]
			[<a
				href="list.jsp?pri=${pri}&page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }">&gt;&gt;</a>]
			[<a href="list.jsp?pri=${pri}&page=${jspData.totalPage }">끝</a>]
		</div>
		<br> <br>
		<div id="list_btn">
			<button onclick="location='write.jsp'">글쓰기</button>
			<button onclick="location='../index.jsp'">돌아가기</button>
		</div>
	</section>
</body>
</html>