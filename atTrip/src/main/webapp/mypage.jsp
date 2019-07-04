<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>@Trip : My Page</title>
<style type="text/css">
    @import url('resources/css/headerFooter.css');
    @import url('resources/css/main.css');
    @import url('resources/css/board.css');
.plango{
   border:solid #585858 2px;  border-radius:5px; width:250px; padding: 5px 10px; text-align: center; margin: auto; margin-top:40px;
}
.plango a{
    text-decoration: none; color:#585858; font-weight: bold;
}

.tb_top{	background-color: #F2F2F2;	text-align: center;	font-weight: bold;	font-size:18px;text-align:center;}
table td {  padding: 8px;  text-align: left;  border-bottom: 1px solid #ddd;text-align:center;}

</style>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/headerFooter.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript">
	$(function(){
		if(window.sessionStorage){
			mno = window.sessionStorage.getItem("m_no");
		}		
		$.ajax({
			url:"myPlanlist.do",
			data : {m_no:mno},
			success:function(data){
				var arr =  eval("("+data+")");				
				if(arr.length == 0){
					
					$("#plan_info").css("display","block");
					var i = $("<i></i>").addClass("fas fa-exclamation-triangle").css({"font-size":"40px","color":"gray"});
					var con =  $("<p></p>").html("아직 만든 여행일정이 없습니다.").css({"color":"gray"});
					var move = $("<div class='plango'></div>").html( $("<a></a>").html("<i class='far fa-calendar-alt'> 여행 일정 생성으로 이동</i>").attr("href","makeplan.do"));
					
					$("#plan_info").append(i,con,move);
				}else {
				
					$("#plan_info").css("display","none");
					$.each(arr,function(i,p){	
						var a = $("<a></a>").attr("href","planline.do?plan_no="+p.plan_no);
						
						// 계획만들 때 지정한 날짜 얻어 옴.
						var date1 = new Date(p.plan_startday);
					    var startday = date1.toDateString();
						var date2 = new Date(p.plan_endday);
					    var endday = date2.toDateString();
					    
						var div1 = $("<div></div>").addClass("city");
						var img = $("<img></img>").attr({src:"resources/image/"+p.plan_image});
						var div2 = $("<div></div>").addClass("plan-info");
						var span1 = $("<span></span>").attr("id","plan-title").html(p.plan_name);		
						$(div2).append(span1,"여행일정 : "+startday+" ~"+endday+"<br>","여행장소 : "+p.city_name);
						$(div1).append(img,div2);
						$(a).append(div1);
						$("#myPlist").append(a);
					});		
				}		
			}	
		});
		
		$.ajax({
			url:"likeListMember.do",
			data:{m_no:mno},
			success:function(data){
				
				
				likeArr = eval("("+data+")");
				
				if(likeArr.length == 0){
					
					$("#like_info").css("display","block");
					
					var i = $("<i></i>").addClass("fas fa-exclamation-triangle").css({"font-size":"40px","color":"gray"});
					var con =  $("<p></p>").html("아직 좋아요한 관광지가 없습니다.").css({"color":"gray","font-size":"16px"});
					
					$("#like_info").append(i,con);
				}
				else{
					$("#like_info").css("display","none");
					
					$.each(likeArr, function(i, pv) {
						var pv_figure = $("<div></div>").addClass("card-figure").append(
								$("<a></a>").attr("href","pointview?no="+pv.pointview_no).html($("<img>").attr("src","resources/image/"+pv.pointview_image1)),
								$("<div class='card-content'></div>").append(
										$("<i></i>").addClass("fas fa-heart").addClass("pvN"+pv.pointview_no).addClass("heart_btn_fill_list"),
										$("<a></a>").attr("href","pointview?no="+pv.pointview_no).html($("<div></div>").addClass("viewname").html(pv.pointview_name)),
										$("<a></a>").attr("href","pointview?no="+pv.pointview_no).html($("<div></div>").addClass("text").html(pv.pointview_topinfo)),
										$("<a></a>").attr("href","pointview?no="+pv.pointview_no).html($("<div></div>").addClass("hashtag").html(pv.pointview_hashtag))
									)
								);
						$(".card-list").append(pv_figure);
					})
				}
			}			
		});
		
		
		$.ajax({
			url:"myBoardlist.do",
			data : {m_no:mno},
			success:function(data){
				var arr =  eval("("+data+")");
				
				if(arr.length == 0){
					$("#board_info").css("display","block");
					$(".board-table").css("display","none");
					var i = $("<i></i>").addClass("fas fa-exclamation-triangle").css({"font-size":"40px","color":"gray"});
					var con =  $("<p></p>").html("아직 동행게시판에 쓴 글이 없습니다.").css({"color":"gray"});
					
					$("#board_info").append(i,con);
				}else {
					
					$("#board_info").css("display","none");
					$(".board-table").css("display","block");
					
					$.each(arr,function(i,m){
						var tr = $("<tr></tr>");
						
						// 날짜 변환
						var date1 = new Date(m.b_startday);
					    var startday = date1.toDateString();
						var date2 = new Date(m.b_endday);
					    var endday = date2.toDateString();
					    
						$(tr).append($("<td></td>").html(m.b_no));
						$(tr).append($("<td></td>").html(m.b_region));
						$(tr).append($("<td></td>").html(startday+" ~ "+endday));	
						$(tr).append($("<td></td>").html("<a href='detailBoard.do?b_no="+m.b_no+"'>"+m.b_title+"</a>"));			
						$(tr).append($("<td></td>").html(m.m_name));
						$(tr).append($("<td></td>").html(m.b_hit));
						$("#tb").append(tr);
					});
				}
		}});

	});

</script>
</head>	
<body>
<header>
	<a href="#"><button id="top-btn" title="Go to top">Top</button></a>
		<div class="topnav">
	  <div class="logo-top"><a href="indexmain.jsp"><img src="resources/img/logo_top2.png"></a></div>
	  <div class="logo-topM"><a href="indexmain.jsp"><img src="resources/img/logo_top_m.png"></a></div>

	   <form>
	  		<input class="search_input" type="text" name="search" placeholder="Search..">
	  		<button type="submit" class="search-bnt" ><img id="search-img" src="resources/img/search_icon (3).png" ></button>
		</form>
	  <div class="topnav-right">
		 <i class="fas fa-bars openbtn" id="menu_icon"></i>
	  </div>
	</div>
	
	<div id="mySidepanel" class="sidepanel">
	  <a href="javascript:void(0)" class="closebtn">×</a>
	  	  <a class="s-a" href="indexmain.jsp#recommend-sec">추천 여행지</a>
	  <a class="s-a" href="plan.do">여행 일정 계획</a>
	  <a class="s-a" href="listBoard.do">동행게시판</a>
	  <br>
	  	<div class="before-login">
		   <a><input type="button" class="sidepanel-bnt" id="btn_login" value="로그인"></a>
		  <a href="join.do"><input type="button" class="sidepanel-bnt" value="회원가입"></a>
	  	</div>
	  	<div class="after-login">
	  		<hr id="login-hr">
	  		<a class="s-a" href="mypage.jsp">마이페이지</a>
	  		<a class="s-a" href="mypage.jsp#myL">좋아요 목록</a>
	  		<a><input type="button" class="sidepanel-bnt logout" id="btn_logout_move_main" value="로그아웃"></a>
	  	</div>
	  <br>
	</div>
</header>

<section>
	<div class="top-img-sect" style="margin-bottom:0px;">
		<img alt="" src="resources/img/beach.jpg"> 
		<div class="img_content">
			<h1 class="myh1">마이페이지</h1>
			<p class="myp">즐거운 여행을 확인할 수 있습니다 :D</p>
			<div class="my-btn">
				<button type="button" onclick="location.href='#myP'">여행일정</button>
				<button type="button" onclick="location.href='#myL'">좋아요 목록</button>
				<button type="button" onclick="location.href='#myBlist'">내가 쓴글 </button>
			</div>
		</div>			
	</div>
	
	<div class="center">
		<div class="recommend-sec" id="myP" style="padding-top: 70px">
			<h2 class="country-cityname">여행일정</h2>
			<div id="plan_info" class="no_list_info"></div>
			<div class="recommend-wrapper-two" id="myPlist">	
			</div>
		</div>		
	</div>
	
	
<div class="center"  style="padding-top: 70px;" id="myL">
		
	<h2>좋아요 목록</h2>
	<div id="like_info" class="no_list_info"></div>
	<div class="card-list" id="MyList"></div>
	
	<div  style="padding-top: 70px; width: 100%;" id="myBlist">
			<h2>내가 쓴 글</h2>
			<div id="board_info" class="no_list_info"></div>
			<table class="board-table">
				<tr class="table_top">
				<td class="table_no">번호</td>			
				<td>여행기간</td>
				<td>지역</td>
				<td>제목</td>
				<td class="table_name">작성자</td>
				<td class="table_hit">조회수</td>
				</tr>
				<tbody id="tb"></tbody>
			</table>
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
					<li><a href="javascript:void(0)">About @Trip </a></li>
				</ul>
			</div>
			<div class="list-footer">
				<ul>
					<li>계획</li>
					<li><a href="plan.do">여행 동선 계획</a></li>
					<li><a href="listBoard.do">동행 찾기</a></li>
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