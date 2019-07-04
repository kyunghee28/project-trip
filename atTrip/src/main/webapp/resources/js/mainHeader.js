$(function () {

		var stickyTop = $("#navbar").offset().top;
		
		var navbarSticky = function () {
			
			 var scrollTop = $(window).scrollTop();
			
			if( scrollTop >= stickyTop){
				$("#navbar").addClass("sticky");
			}else {
				$("#navbar").removeClass("sticky");
			}
		};
	
	$(window).scroll(function() {
		navbarSticky();
	});
	
	
	$(".closebtn").click(function() {
		$("#mySidepanel").css("width","0");
	});
	$(".openbtn").click(function() {
		$("#mySidepanel").css("width","300px");
	});	
});