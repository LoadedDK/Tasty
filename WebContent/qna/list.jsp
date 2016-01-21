<%@page import="com.tasty.qna.model.QnaModel"%>
<%@page import="com.tasty.qna.service.QnaListService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// BoardListService 객체를 생성 후 호출
	ServiceInterface service = new QnaListService();
	int cpage = 1;
	String pageStr = request.getParameter("page");
	if(pageStr!=null)
		cpage = Integer.parseInt(pageStr);
	QnaModel model = (QnaModel)service.service(cpage);
	// jstl과 EL 객체에서 사용하기 위해 request에 list를 담는다.
	request.setAttribute("list", model.getList());
	// page에 표시하거나 처리를 위한 데이터(JspData)도 request에 담는다.
	request.setAttribute("jspData", model.getJspData());
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QnA</title>
<link rel="stylesheet" type="text/css" href="../css/qna/list.css">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
</head>
<body>
<div id="listWrapper">
<div id="list_head">QnA</div>
<div id="btn_wrapper">
<a href="write.jsp" id="writebtn">질문하기</a>
</div>
<section id="qnaListSection">
<!-- jstl의 core를 사용하여 작성 
taglib 디렉티브에서 jstl을 쓰겠다고 먼저 선언 -->
<c:forEach var="qna" items="${list}">
<c:if test="${qna.levNo==0}">
<div id="Question">
<div id="qTitle" class="textOver">${qna.no}. <a href="view.jsp?no=${qna.no}&page=${jspData.page}">${qna.title}</a></div><br/>
<div id="qContent" class="textOver">${qna.content}</div><br/>
<div id="qWriter">${qna.writer} / ${qna.wdate} / ${qna.hit}</div><br/>
</div>
</c:if>
<c:if test="${qna.levNo>=1}">
<!-- 답변이므로 제목을 출력하기 전에 들여쓰기 처리를 한다 -->
<div id="Answer">
<div id="aTitle" class="textOver">${qna.no}.
<c:forEach begin="1" end="${qna.levNo*5}">&nbsp;</c:forEach>
<a href="view.jsp?no=${qna.no}&page=${jspData.page}">${qna.title}</a></div>
<div id="aWriter">${qna.writer} / ${qna.wdate} / ${qna.hit}</div><br/>
</div>
</c:if>
</c:forEach>
</section>
<%-- <% } %> --%>
<div id="pageDiv">
<!-- 페이지 처리 : 반복문 -->
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
</div>
</body>
</html>