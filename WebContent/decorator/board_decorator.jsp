<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/board_decorator.css">
<title>[오늘의 맛집] <decorator:title /></title>
</head>
<body>
<div id="All">
	<header>
		header
	</header>
	<nav>
		nav
	</nav>
	<article>
		<section>
			<decorator:body />
		</section>
	</article>
	<footer>
		footer
	</footer>
</div>
</body>
</html>