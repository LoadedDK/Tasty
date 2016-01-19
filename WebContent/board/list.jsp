
<%@page import="com.tasty.board.model.BoardModel"%>
<%@page import="java.util.List"%>
<%@page import="com.tasty.board.service.BoardListService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	<style type="text/css">
/*선택후 선택한 것에 대한 모양지정 */
table{  border-style: solid;
		border-color: black;
		width: 600px;
	}
	th  {
	color: black;
	width: 100px;
	padding: 10px;
}
</style>
</head>
<body>
	<h2>회원 게시판 리스트</h2>
	<table>
	<tr>
	<th> 글번호</th><th> 제목</th> <th> 작성자 </th><th> 작성일 </th><th> 조회수 </th><th> 파일이름 </th>
	</tr>
	<c:forEach var="board" items="${list }">
	<tr>
    <th>	${board.getNo() }
	<th><a href="view.jsp?no=${board.no}">${board.title } </a>
	</th><th> ${board.writer }
	</th><th> ${board.wdate } 
	</th><th> ${board.hit } 
	</th><th> ${board.fileName }</th>
		<%-- 	<%	}  //  end of for%> --%>
	</tr>
	</c:forEach> 
	</table>
<!-- 	페이지 처리 = 반복문 처리--> 
[<a href="list.jsp?page=1">처음</a>] 
[<a href="list.jsp?page=${jspData.startPage >1?jspData.startPage-jspData.pagesPerGroup:1 }">&lt;&lt;</a>] 
[<a  href="list.jsp?page=${jspData.page >1?jspData.page-1:1 }">&lt;</a>] 

<c:forEach var = "i" begin="${jspData.startPage }" end ="${jspData.endPage }">
<!-- 블랭크가 들어가면 String이기때문에 오류가 발생한다.  -->
[<a href="list.jsp?page=${i }">${i }</a>]
</c:forEach>

[<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.page + 1 : jspData.totalPage }">&gt;</a>]
[<a href="list.jsp?page=${jspData.totalPage > jspData.endPage ? jspData.endPage + 1 : jspData.totalPage }">&gt;&gt;</a>]
[<a href="list.jsp?page=${jspData.totalPage }">끝</a>]
<br><br>
	<button onclick="location='write.jsp'">글쓰기</button>
</body>
</html>