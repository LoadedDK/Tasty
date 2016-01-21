<%@page import="com.tasty.member.service.MemberWriteService"%>
<%@page import="com.tasty.controller.ServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.tasty.member.model.Member" />
<% request.setCharacterEncoding("utf-8"); %>
<jsp:setProperty name="member" property="*" />

<script type="text/javascript">
	setTimeout("location.href='../index.jsp'",3000);
</script>
<%
	ServiceInterface service = new MemberWriteService();
	service.service(member);
%>

회원가입에 성공하였습니다.<br>
3초후에 메인 페이지로 이동합니다.
