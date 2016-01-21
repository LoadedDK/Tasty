$(document).ready(function(){
	$("#title").focus(function(){
		$("#title").toggleClass("bg")
	}).blur(function(){
		$("#title").toggleClass("bg")
	});
	
	$("#content").focus(function(){
		$("#content").toggleClass("bg")
	}).blur(function(){
		$("#content").toggleClass("bg")
	});
	
	$("#writer").focus(function(){
		$("#writer").toggleClass("bg")
	}).blur(function(){
		$("#writer").toggleClass("bg")
	});
});