/**
 * 필수 입력란이 비어있을 때 취소 처리
 */
$(document).ready(function(){
	$($(".writeForm")).submit(function(){
		if($("#title").val()==""){
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return false;
		}
		if($("#content").val()==""){
			alert("내용을 입력해주세요.");
			$("#content").focus();
			return false;
		}
		if($("#writer").val()==""){
			alert("작성자를 입력해주세요.");
			$("#writer").focus();
			return false;
		}
	});
});