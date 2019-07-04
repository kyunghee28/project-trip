/*로그인 자바스크립트*/

$(function () {
	$(".open-button").click(function() {
		$("#loginForm").css("display","block");
	});
	
	$("#btn_close").click(function () {
		$("#loginForm").css("display","none");
		
	});
	
});