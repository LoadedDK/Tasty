$(document).ready(function() {
	$("#updateBtn").click(function() {
		
		if($("#oldPw1").val() != $("#oldPw2").val()) {
			alert("현재 비밀번호가 일치하지 않습니다");
			return false;
		}
		
		if($("#newPw1").val() != "" || $("#newPw2").val() != "") {
			if($("#newPw1").val() != $("#newPw2").val()) {
				alert("새로운 비밀번호가 일치하지 않습니다");
				$("#newPw1").val("");
				$("#newPw2").val("");
				$("#newPw1").focus();
				return false;
			}
		}
		
		if($("#name").val() == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
			return false;
		}
		
		if($("#birth").val() == "") {
			alert("생년월일를 입력해주세요");
			$("#birth").focus();
			return false;
		}
		
		if($("#tel2").val() == "") {
			alert("전화번호를 입력해주세요");
			$("#tel2").focus();
			return false;
		}
		
		if($("#tel3").val() == "") {
			alert("전화번호를 입력해주세요");
			$("#tel3").focus();
			return false;
		}
		
		if($("#email").val() == "") {
			alert("이메일를 입력해주세요");
			$("#email").focus();
			return false;
		}
		
		$("form:first").submit();
	});
	
	$("#deleteBtn").click(function() {
		
		if($("#oldPw1").val() != $("#oldPw2").val()) {
			alert("현재 비밀번호가 일치하지 않습니다");
			return false;
		}
		
		if(confirm("탈퇴하시겠습니까?"))
			$("form:last").submit();
	});
});