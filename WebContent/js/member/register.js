$(document).ready(function() {
	$("#registerBtn").click(function() {
		
		for(var i=0; i<id.length; i++) {
			if($("#id").val() == id[i]) {
				alert("중복된 아이디입니다.");
				return false;
			}
		}
		
		$("form").submit();
	});
});