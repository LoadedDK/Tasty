$(document).ready(function(){
	$(delete_btn).click(function(){
		var answer = confirm("진정 삭제하시겠습니까?");
		  if(answer){
		    var form = $(this).parents('form');
		    form.submit();
		    alert("삭제되었습니다.");
		  }else{
		   return false;
		  }
		 });
});