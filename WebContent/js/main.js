$(document).ready(function() {
	$("#logoutBtn").click(function() {
		if(confirm("로그아웃하시겠습니까?"))
			window.location = "./member/logoutProcess.jsp";
	});
});