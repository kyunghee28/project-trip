<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>@Trip : Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
    @import url('resources/css/headerFooter.css');
    @import url('resources/css/main.css');
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/headerFooter.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript">
	$(function(){			
		var mno = ${m_no}
		if(mno < 0){
			alert("로그인이 실패하였습니다. 다시 로그인 해주세요.");
		}
	});	
</script>
</head>
<body style="background: url('resources/img/main_maldive.jpg')">
<header>
	<div class="logo-login"><a href="indexmain.jsp"><img src="resources/img/logo_top2.png"></a></div>
</header>
<section>
	<div class="loginPage">
	
		<div id="con">
			<h2>로그인 페이지</h2>
		</div>
		
		<button class="open-button">Login</button>
		
		<div class="form-popup" id="loginForm" style="display: block;">
		  <form action="login.do" class="form-container" method="post">
		
		    <h1>Login</h1>
		
		    <label for="email"><b>Email</b></label>
		    <input type="text" placeholder="Enter Email" name="m_email" id="email" required>
		
		    <label for="psw"><b>Password</b></label>
		    <input type="password" placeholder="Enter Password" name="m_pwd" id="psw" required>
			
			<button type="button" class="btn cancel" id="btn_close">Close</button>
		    <button type="submit" class="btn" id="btn_login" >Login</button>
		    <input type="hidden" id="uri" name="uri" value="${uri}"> 
		  
		  </form>
		</div>
	</div>
</section>
<footer>
	<div class="footer-center">
		<div class="menu-footer">
			<div class="list-footer">
				<ul>
					<li>탐색</li>
					<li><a href="indexmain.jsp#recommend-sec">추천 여행지</a></li>
					<li><a href="indexmain.jsp#trip_recom">여행지 순위</a></li>
					<li><a href="#">About @Trip </a></li>
				</ul>
			</div>
			<div class="list-footer">
				<ul>
					<li>계획</li>
					<li><a href="#">여행 동선 계획</a></li>
					<li><a href="#">동행 찾기</a></li>
				</ul>
			</div>
		</div>
		<img class="logo-footer" src="resources/img/logo.png">
		<p>Copyright ⓒ 2019 @trip</p>
		<p>KKH ㅣ KDH ㅣ LPS ㅣ JYM</p>
	</div>
</footer>
</body>
</html>