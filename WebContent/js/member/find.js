$(document).ready(function() {
	$("#findIdBtn").click(function() {
		$("form:first").submit();
	});
	
	$("#findPwBtn").click(function() {
		$("form:last").submit();
	});
	
	$("#loginBtn").click(function() {
		window.location = "./login.jsp";
	});
	
	$("#findBtn").click(function() {
		window.location = "./find.jsp";
	});
});