
<%@page import="com.tasty.board.model.BoardModel"%>
<%@page import="java.util.List"%>
<%@page import="com.tasty.board.service.BoardListService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--  자바프로그램 적용 -->
<%
	ServiceInterface service = new BoardListService();
	int cpage = 1; // default는 1이다.

	String pageStr = request.getParameter("page");
	if (pageStr != null)
		cpage = Integer.parseInt(pageStr);
	BoardModel model = (BoardModel) service.service(cpage);
	request.setAttribute("list", model.getList());
	request.setAttribute("jspData", model.getJspData());
%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/board/board_list.css">

</head>
<body>
	<section>
		<div id="content">
			<div id="list_head"> <h2>맛집 이야기</h2></div>
			<div id="list_btn">
			<a id="write_btn" href="write.jsp">글쓰기</a>
		</div><br>
		
			<ul>
				<c:forEach var="board" items="${list }">
					<li>
						<div class="list_content">
							<a href="view.jsp?no=${board.no}&page=${jspData.page}">${board.title }</a><br>
							${board.content}<br>
							${board.wdate}
						</div>
						
						<div class="list_img">
							<img src="../img/${board.fileName }">
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="pageMove">
			<!-- 	페이지 처리 = 반복문 처리-->
			[<a href="list.jsp?page=1">처음</a>] [<a
				href="list.jsp?page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }">&lt;&lt;</a>]
			[<a href="list.jsp?page=${jspData.page >1?jspData.page-1:1 }">&lt;</a>]

			<c:forEach var="i" begin="${jspData.startPage }"
				end="${jspData.endPage }">
				<!-- 블랭크가 들어가면 String이기때문에 오류가 발생한다.  -->
			[<a href="list.jsp?page=${i }">${i }</a>]
			</c:forEach>

			[<a
				href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }">&gt;</a>]
			[<a
				href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }">&gt;&gt;</a>]
			[<a href="list.jsp?page=${jspData.totalPage }">끝</a>]
		</div>
		<br>
	
		
	</section>
</body>
</html>