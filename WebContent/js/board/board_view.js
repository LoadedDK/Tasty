$(document).ready(function(){
	$(delete_btn).click(function(){
		var answer = confirm("글을 삭제하시겠습니까?");
		  if(answer){
		    var form = $(this).parents('form');
		    form.submit();
		    alert("삭제되었습니다.");
		  }else{
		   return false;
		  }
		 });
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