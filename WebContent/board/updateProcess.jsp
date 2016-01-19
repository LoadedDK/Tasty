
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.tasty.board.model.Board"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.tasty.board.service.BoardUpdateService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>

<%
	String uploadPath=request.getServletContext().getRealPath("upload");
 
	int size=100*1024*1024;
 
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	
	Board board = new Board();
	int no = Integer.parseInt(multi.getParameter("no"));
	board.setNo(no);
	board.setTitle(multi.getParameter("title"));
	board.setContent(multi.getParameter("content"));
	board.setWriter(multi.getParameter("writer"));
	board.setFileName(multi.getFilesystemName("fileName"));
	
	ServiceInterface service = new BoardUpdateService();
	service.service(board);
	response.sendRedirect("view.jsp?no="+board.getNo());
 %>