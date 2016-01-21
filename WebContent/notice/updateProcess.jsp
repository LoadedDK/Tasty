<%@page import="com.tasty.notice.model.Notice"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.tasty.notice.service.NoticeUpdateService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8");%>
    
<%
	String uploadPath=request.getServletContext().getRealPath("upload");
	int size=100*1024*1024;
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
	
	Notice notice = new Notice();
	int no = Integer.parseInt(multi.getParameter("no"));
	notice.setNo(no);
	notice.setTitle(multi.getParameter("title"));
	notice.setContent(multi.getParameter("content"));
	notice.setStartDate(multi.getParameter("startDate"));
	notice.setEndDate(multi.getParameter("endDate"));
	
	if(multi.getFilesystemName("fileName") == null || multi.getParameter("orgFileName") == multi.getFilesystemName("fileName"))
		notice.setFileName(multi.getParameter("orgFileName"));
	else
		notice.setFileName(multi.getFilesystemName("fileName"));
	
	
	ServiceInterface service = new NoticeUpdateService();
    service.service(notice);
    response.sendRedirect("view.jsp?no="+notice.getNo()+"&page=" + multi.getParameter("page"));
%>
