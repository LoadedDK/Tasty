$(document).ready(function() {
	$("#loginBtn").click(function() {
		$("form").submit();
	});
	
	$("#findBtn").click(function() {
		window.location = "./find.jsp";
	});
	
	$("#registerBtn").click(function() {
		window.location = "./register.jsp";
	});
});