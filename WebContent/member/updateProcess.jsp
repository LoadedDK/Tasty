<%@page import="com.tasty.member.service.MemberUpdateService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.tasty.member.model.Member" />
<% request.setCharacterEncoding("utf-8"); %>
<jsp:setProperty name="member" property="*" />

<script type="text/javascript">
	setTimeout("location.href='../index.jsp'",3000);
</script>

<%
	ServiceInterface service = new MemberUpdateService();
	service.service(member);
%>

정보수정에 성공하였습니다.<br>
3초후에 메인 페이지로 이동합니다.
