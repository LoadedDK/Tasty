
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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />

</head>
<body>
	<section>
		<div id="content">
			<div id="list_head">맛집 이야기</div>
			<div id="btn_wrapper">
				<a id="write_btn" href="write.jsp">글쓰기</a>
			</div>
			<br>

			<ul>
				<c:forEach var="board" items="${list }">
					<li>
						<div class="list_content">
							<div id="list_title">
								<a href="view.jsp?no=${board.no}&page=${jspData.page}">${board.title }</a>
							</div>
							<br> <br>
							<div id="list_content" class="textOver">${board.content}</div>
							<br>
							<div id="list_wdate">${board.wdate}</div>
						</div>

						<div class="list_img">
							<c:if test="${!empty board.fileName }">
								<img src="../img/${board.fileName }" />
							</c:if>
						</div>

					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="pageMove">
			<!-- 	페이지 처리 = 반복문 처리-->
			<a href="list.jsp?page=1"><i class="fa fa-step-backward"></i></a>
			<a href="list.jsp?page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a>
			<a href="list.jsp?page=${jspData.page >1?jspData.page-1:1 }"><i class="fa fa-chevron-left"></i></a>

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

			<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }"><i class="fa fa-chevron-right"></i></a>
			<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }"><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a>
			<a href="list.jsp?page=${jspData.totalPage }"><i class="fa fa-step-forward"></i></a>
		</div>
	</section>
</body>
</html>