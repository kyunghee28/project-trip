$(function () {
	
	
	//슬라이드 메뉴 스크립트
	$(".closebtn").click(function() {
		$("#mySidepanel").css("width","0");
	});
	$(".openbtn").click(function() {
		$("#mySidepanel").css("width","300px");
	});	
	

	/*로그인 여부 체크*/
	
	var url = window.location.search.substring(1);
	
	if(url.indexOf("m_no=")>=0){
		login_mno = url.split("m_no=")[1];
		if(window.sessionStorage){
			window.sessionStorage.setItem("m_no",login_mno);
		}
	}
	
	if(window.sessionStorage){
		mno = window.sessionStorage.getItem("m_no");
	}
	
	if(mno>0){
		$(".before-login").css("display","none");
		$(".after-login").css("display","block");
	}else{
		$(".before-login").css("display","block");
		$(".after-login").css("display","none");
	}
		
	//로그아웃 
	$("#btn_logout").click(function () {
			
		$(".before-login").css("display","block");
		$(".after-login").css("display","none");
		if(window.sessionStorage){
			
			sessionStorage.removeItem("m_no");
		
		}
		
		var url=window.location.href;
		
		if(url.indexOf("city")>=0){
			location.href="../indexmain.jsp";
		}else if(url.indexOf("country")>=0){
			location.href="../indexmain.jsp";
		}else{
			location.href="indexmain.jsp";
		}
	});
	
	/*로그인 버큰 클릭시 기존 페이지 저장*/
	$("#btn_login").click(function btnLogin() {
		
		var uri = window.location.href;
		
		if(uri.indexOf("city")>=0)
		{
			location.href="../login.do?uri="+uri;
		}else if(uri.indexOf("country")>=0){
			location.href="../login.do?uri="+uri;
		}else{
			location.href="login.do?uri="+uri;
		}
	});
	
	
	//로그인 필요 페이지에서 로그아웃 시 메인으로 이동
	$("#btn_logout_move_main").click(function () {
		if(window.sessionStorage){
			window.sessionStorage.setItem("m_no",0);
			sessionStorage.removeItem("m_no");
			
		}
		$(".before-login").css("display","block");
		$(".after-login").css("display","none");
		
		location.href="indexmain.jsp";
		
	});
	
	//top 버튼
	$(window).scroll(function() {
	
		if($(this).scrollTop() > 270 ){
			$("#top-btn").fadeIn();
		}else {
			$("#top-btn").fadeOut();	
		}
	});
	$("#top-btn").click(function() {
		$("body, html").animate({scrollTop:0},400);
	});
})