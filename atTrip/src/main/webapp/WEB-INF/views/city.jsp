<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도시</title>
<style type="text/css">
    @import url('../resources/css/headerFooter.css');
    @import url('../resources/css/main.css');
</style>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../resources/js/headerFooter.js"></script>
<script type="text/javascript" src="../resources/js/main.js"></script>
<script type="text/javascript">
$(function() {
	var city_no = ${city.city_no};
	var pointviewList;
	
	
	if(window.sessionStorage){
		mno = window.sessionStorage.getItem("m_no");
	}
	
	
	//회원 좋아요 리스트 담는 변수
	var likeArr;
	//로그인 상태인 경우 해당 회원의 좋아요 리스트 가져오기
	if(mno>0)
	{
		$.ajax({
			url:"../likeNumberListMember.do",
			data:{m_no:mno},
			success:function(data){
				likeArr = eval("("+data+")");
			}			
		});
	}
	
	//관광지 리스트 
	$.ajax({
			url:"../pointviewList.do",
			data:{no:city_no},
			success:function(data){
				
				pointviewList= eval("("+data+")");
				
				if(pointviewList==0)
				{
					$("#pvlist_info").css("display","block");
					var i = $("<i></i>").addClass("fas fa-exclamation-triangle").css({"font-size":"40px","color":"gray"});
					var con =  $("<p></p>").html("아직 미 오픈한 도시입니다.").css({"color":"gray"});
					
					$("#pvlist_info").append(i,con);
				}else{
					$("#pvlist_info").css("display","none");
					
					var i =0;
					var pvViewCnt = 30;
					var endi = i+pvViewCnt;
					
					//처음 관광지 리스트 보이기
					for(i ; i<endi ; i++)
					{
						var pv_figure = $("<div></div>").addClass("card-figure").append(
								$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<img>").attr("src","../resources/image/"+pointviewList[i].pointview_image1)),
								$("<div class='card-content'></div>").append(
										$("<i></i>").addClass("far fa-heart").addClass("pvY"+pointviewList[i].pointview_no).addClass("heart_btn_list").attr("idx",i),
										$("<i></i>").addClass("fas fa-heart").addClass("pvN"+pointviewList[i].pointview_no).addClass("heart_btn_fill_list").css("display","none").attr("idx",i),
										$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<div></div>").addClass("viewname").html(pointviewList[i].pointview_name_kor)),
										$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<div></div>").addClass("text").html(pointviewList[i].pointview_topinfo)),
										$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<div></div>").addClass("hashtag").html(pointviewList[i].pointview_hashtag))
									)
								);
						
						$(".card-column").append(pv_figure);
						
						if(mno>0){
							$.each(likeArr, function(i,pvn) {
								var heartBtn = ".pvY"+pvn;
								var heartBtnFill = ".pvN"+pvn;
								
								if($(heartBtn)!=null){
									$(heartBtn).css("display","none");
						            $(heartBtnFill).css("display","inline-block");
								}
							});
						}
					}
					
					//무한스크롤 적용
					$(window).scroll(function() {
						var scrollHeight = $(window).scrollTop() + $(window).height();
						var documentHeight = $(document).height();
						
						
						if( scrollHeight+100 >= documentHeight )
						{
							if(endi >= pointviewList.length){
								endi = pointviewList.length;
							}else {
								endi = i+pvViewCnt;
							}
							
							for(i ; i<endi ; i++)
							{
								var pv_figure = $("<div></div>").addClass("card-figure").append(
										$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<img>").attr("src","../resources/image/"+pointviewList[i].pointview_image1)),
										$("<div class='card-content'></div>").append(
												$("<i></i>").addClass("far fa-heart").addClass("pvY"+pointviewList[i].pointview_no).addClass("heart_btn_list").attr("idx",i),
												$("<i></i>").addClass("fas fa-heart").addClass("pvN"+pointviewList[i].pointview_no).addClass("heart_btn_fill_list").css("display","none").attr("idx",i),
												$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<div></div>").addClass("viewname").html(pointviewList[i].pointview_name_kor)),
												$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<div></div>").addClass("text").html(pointviewList[i].pointview_topinfo)),
												$("<a></a>").attr("href","../pointview?no="+pointviewList[i].pointview_no).html($("<div></div>").addClass("hashtag").html(pointviewList[i].pointview_hashtag))
											)
										);
								
								$(".card-column").append(pv_figure);
								
								if(mno>0){
									$.each(likeArr, function(i,pvn) {
										var heartBtn = ".pvY"+pvn;
										var heartBtnFill = ".pvN"+pvn;
										
										if($(heartBtn)!=null){
											$(heartBtn).css("display","none");
								            $(heartBtnFill).css("display","inline-block");
										}
									});
								}
							}
						}
					});
				}
				
				
				
		}});
	
	
	//관광지 리스트 좋아요 버튼 기능 
	if(mno>0)
	{
		$(document).on("click",".heart_btn_list",function(){ 
			
			var idx = $(this).attr("idx");
			
			var pvno = pointviewList[idx].pointview_no;
			var name = pointviewList[idx].pointview_name_kor;
			var topinfo = pointviewList[idx].pointview_topinfo;
			var hashtag = pointviewList[idx].pointview_hashtag;
			var addr = pointviewList[idx].pointview_addr;
			var img = pointviewList[idx].pointview_image1;
			var eng = pointviewList[idx].pointview_name_eng;
			var map_x = pointviewList[idx].pointview_location_X;
			var map_y = pointviewList[idx].pointview_location_Y;
			
			

			
			$.ajax({
				url:"../likeBtnInsert.do",
				type:"POST",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				data:{ m_no:mno,pointview_no:pvno , pointview_name:name , pointview_topinfo:topinfo , pointview_hashtag:hashtag , pointview_addr:addr , pointview_image1:img , pointview_name_eng:eng, city_no:city_no, pointview_location_X:map_x, pointview_location_Y:map_y },
				success:function(data){
					if(data>0)
					{
						/*좋아요 리스트 팝업(좋아요 성공)*/
						$("#like_success").css("display","inline");
						$("#like_cancel").css("display","nono");
						$("#like_popup").removeClass("cancel");
						$("#like_popup").addClass("show");
						setTimeout(function(){
							$("#like_popup").removeClass("show");
							$("#like_success").css("display","none");
						},1000);
						
						
						$(".pvY"+pvno).css("display","none");
						$(".pvN"+pvno).css("display","inline-block");
					}
				}
			});
			
			
		});
		
		$(document).on("click",".heart_btn_fill_list",function() {
			var idx = $(this).attr("idx");
			var pvno = pointviewList[idx].pointview_no;
			
			
			
			$.ajax({
				url:"../likeBtnDelete.do",
				type:"POST",
				data:{m_no:mno,pointview_no:pvno},
				success:function(data){
					if(data>0)
					{
						/*좋아요 리스트 팝업(좋아요 취소)*/
						$("#like_success").css("display","none");
						$("#like_cancel").css("display","inline");
						$("#like_popup").addClass("show").addClass("cancel");
						setTimeout(function(){
							$("#like_popup").removeClass("show");
							$("#like_cancel").css("display","none");
						},1000);
						
						$(".pvY"+pvno).css("display","inline-block");
						$(".pvN"+pvno).css("display","none");
					}
				}
			});
		});	
	}else {
		$(document).on("click",".heart_btn_list",function(){
			alert("로그인 후 사용 가능 한 기능입니다.");
		});
	}
		


	//지도와 날씨 탭 
	$("#defaultOpen").css({backgroundColor:"black",border:"5px solid black",color:"#00b6da"}); // 지도 
	$("#Map").css("display","block");
	
	
	$(".tablink").click(function() {
		
		var i, tabcontent, tablinks;
		tabcontent = $(".tabcontent").css("display","none");
		
		tablinks = $(".tablink").css({backgroundColor:"",border:"1px solid white",color:"black"});
	    
		var tabName = $(this).html();

	    $("#"+tabName).fadeIn(0);
	    $(this).css({backgroundColor:"black",border:"5px solid black",color:"#00b6da"});
	});
	
	var cityEng = $("#cityEng").html(); 
	var weatherURL = "http://api.openweathermap.org/data/2.5/weather?q="+cityEng+"&units=metric&appid=8c9f3ca746ff1b87bdf60f97381bf51e"; //날씨
	
	$.ajax({
		url:weatherURL,
		dataType: "json",
		type: "GET",
        async: "false",
        success: function(w){

        	var img = $("<div></div>").addClass("weather_img").append( $("<img>").attr("src","../resources/img/weather/"+w.weather[0].icon+".png") ,
        			$("<p></p>").html(w.weather[0].description)		
        		);
        	var info =$("<div></div>").addClass("weather_info").append(
        			$("<p></p>").attr("id","wName").html(w.sys.country+" / "+w.name),
        			$("<div></div>").attr("id","currTemp").append( $("<span></span>").html(w.main.temp),"℃"),
        			$("<p></p>").attr("id","maxminTemp").html("최저 "+w.main.temp_min+"℃ / 최고 "+w.main.temp_max+"℃")
        		);
        	
        	$("#Weather").append(img,info);
        	
		}
	});
	
	//검색 결과 디스플레이 설정
	$("#autocomplete").click(function(){
		$(".nav_search_re").fadeIn(300);
	});
	$(document).click(function(e){ 
 		if(e.target.className =="nav_search_re" || e.target.className =="search_input"|| e.target.className =="search_info"|| e.target.className =="search_list"|| e.target.className =="s_span"){return false} //내가 클릭한 요소(target)를 기준으로 상위요소에 .share-pop이 없으면 (갯수가 0이라면)
 		$(".nav_search_re").stop().fadeOut(300);
 		$("#autocomplete").val("");
 		$(".search_list").html("");
 	});

	//검색 기능 ajax 자동완성
	$("#autocomplete").on("keyup",function(){
		var key = $(this).val();
		if(key!="")
		{
			$(".search_list").html("");
			$(".search_info").css("display","none");
			
			var arr_len=0;
			
			//나라 검색 결과
			$.ajax({
				url:"../searchCountry",
				data:{"keyword":key},
				success:function(data){
					var search_arr = eval("("+data+")");
					arr_len += search_arr.length;
					
					$.each(search_arr,function(i,s){
						var a_item = $("<a class='s_a'></a>").attr("href","../country/"+s.country_name_eng+"?no="+s.country_no).html(s.country_name_kor+'('+s.country_name_eng+')&nbsp;&nbsp;<div class="s_text">나라</div>');
						var p_item = $("<p class='search_item'></p>").html(a_item);
						$(".search_list").append(p_item);
					});
				}
			});
			
			//도시 검색 결과
			$.ajax({
				url:"../searchCity",
				data:{"keyword":key},
				success:function(data){
					var search_arr = eval("("+data+")");
					arr_len=arr_len+search_arr.length;
					
					$.each(search_arr,function(i,s){
						var a_item = $("<a class='s_a'></a>").attr("href","../city/"+s.city_name_eng+"?no="+s.city_no).html(s.city_name_kor+'('+s.city_name_eng+')&nbsp;&nbsp;<div class="s_text">도시</div>');
						var p_item = $("<p class='search_item'></p>").html(a_item);
						$(".search_list").append(p_item);
					});
				}
			});
			
			//관광지 검색 결과
			$.ajax({
				url:"../searchPV",
				data:{"keyword":key},
				success:function(data){
					var search_arr = eval("("+data+")");
					arr_len=arr_len+search_arr.length;
					
					$.each(search_arr,function(i,s){
						var a_item = $("<a class='s_a'></a>").attr("href","../pointview?no="+s.pointview_no).html(s.pointview_name_kor+'&nbsp;&nbsp;<div class="s_text">관광지</div>');
						var p_item = $("<p class='search_item'></p>").html(a_item);
						$(".search_list").append(p_item);
					});
					
					//검색 값 없는 경우 보이는 문구 : 검색 결과가 없습니다.
					if (arr_len==0){
						$(".search_info_not").css("display","block");
					}else{
						$(".search_info_not").css("display","none"); }
				}
			});
			
			
		}else{
			$(".search_list").html("");
			$(".search_info_not").css("display","none");
			$(".search_info").css("display","block");
		}
		
	});
});

//구글맵 스크립트
var map;
var x = ${city.city_location_X};
var y = ${city.city_location_Y};
var myLatLng = {lat: x, lng:y };
function initMap() {
  map = new google.maps.Map(document.getElementById('Map'), {
	  center: myLatLng,
    zoom: 8
  });
}
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=api키 자리입니다" async defer></script>
</head>	

<body>
<header>
	<a href="#"><button id="top-btn" title="Go to top">Top</button></a>
		<div class="topnav">
	  <div class="logo-top"><a href="../indexmain.jsp"><img src="../resources/img/logo_top2.png"></a></div>
	  <div class="logo-topM"><a href="../indexmain.jsp"><img src="../resources/img/logo_top_m.png"></a></div>

	  <input class="search_input" type="text" name="search" placeholder="Search.." id="autocomplete">
	  <button class="search-bnt" ><img id="search-img" src="../resources/img/search_icon (3).png" ></button>
	  
	  <div class="topnav-right">
		 <i class="fas fa-bars openbtn" id="menu_icon"></i>
	  </div>
	</div>
	
	<div class="nav_search_re">
		<p class="search_info_not"><i class="far fa-frown" style="font-size: 50px; color:gray;"></i><br><br>검색 결과가 없습니다.</p>
    	<p class="search_info"><i class="fas fa-search" style="font-size: 60px; color:#00b6da;"></i><br><br>흥미로운 여행지를 검색하세요 :D</p>
    	<div class="search_list"></div>
	</div>
	
	<div id="mySidepanel" class="sidepanel">
	  <a href="javascript:void(0)" class="closebtn">×</a>
	  <a class="s-a" href="../indexmain.jsp#recommend-sec">추천 여행지</a>
	  <a class="s-a" href="../plan.do">여행 일정 계획</a>
	  <a class="s-a" href="../listBoard.do">동행게시판</a>
	  <br>
	  	<div class="before-login">
		  <a><input type="button" class="sidepanel-bnt" id="btn_login" value="로그인"></a>
		  <a href="../join.do"><input type="button" class="sidepanel-bnt" value="회원가입"></a>
	  	</div>
	  	<div class="after-login">
	  		<hr id="login-hr">
	  		<a class="s-a" href="../mypage.jsp">마이페이지</a>
	  		<a class="s-a" href="../mypage.jsp#myL">좋아요 목록</a>
		    <a><input type="button" class="sidepanel-bnt logout" id="btn_logout" value="로그아웃"></a>
	  	</div>
	  <br>
	</div>
	
</header>


<section>
	<div class="city-top-sect">
		<h1>${ city.city_name_kor }(<span id="cityEng">${ city.city_name_eng }</span>)</h1>
		<img alt="" src="../resources/image/${ city.city_image2}"> 
		<div class="city-top-content">
			<div class="box">
				<div id="title">여행최적기</div>
				<div id="text">${ city.city_gooddate}</div>
			</div>
			<div class="box">
				<div id="title">비자</div>
				<div id="text">${ city.city_visa}</div>
			</div>
			<div class="box">
				<div id="title">전압</div>
				<div id="text">${ city.city_volt}</div>
			</div>
			<div class="box">
				<div id="title">비행시간</div>
				<div id="text">${ city.city_flytime}</div>
			</div>
		</div>
	</div>
	<div style="height: 310px; text-align: center; vertical-align: middle; padding-top:100px;" >
		<img style="width: 200px;" src="../resources/img/city_info_ai.PNG">
	</div>
	<div class="city_info">
		<div class="city_text_img">
			${ city.city_name_kor }
			<p>${city.city_info }</p>
		</div>
		
		
		<div class="img_sect1" >
			<img class="img2-1" src="../resources/image/${city.city_image4}">
		</div>
		<div class="img_sect2" >
			<img class="img2-2" src="../resources/image/${city.city_image3}">
		</div>
		<div class="img_sect3" style="background-color: gray">
			<img class="img3" src="../resources/image/${city.city_image1}">
		</div>
	</div>

	
	<div class="center">
		<div class="tab-info">
			<button class="tablink" id="defaultOpen">Map</button>
			<button class="tablink" >Weather</button>
			<div class="tablink-blank"></div>
	
			<div id="Map" class="tabcontent"></div>
	
			<div id="Weather" class="tabcontent"></div>
		</div>
		<h2 style="clear:both; margin-top: 70px; ">관광지</h2> 
		<div id="pvlist_info" class="no_list_info"></div>
		<div class="card-list">
			<div class="card-column" ></div>
		</div>
	</div>
	
	<!-- 좋아요 레이어 팝업 -->
	<div id="like_popup">
		<i class="fas fa-heart" id="like_icon">
			<div id="like_text">좋아요 <span id="like_success">성공!</span><span id="like_cancel">취소</span></div>
			<!--<div id="like_info">마이페이지 > 좋아요 확인</div> -->
		</i>
	</div>
</section>


<footer>
	<div class="footer-center">
		<div class="menu-footer">
			<div class="list-footer">
				<ul>
					<li>탐색</li>
					<li><a href="../indexmain.jsp#recommend-sec">추천 여행지</a></li>
					<li><a href="../indexmain.jsp#trip_recom">여행지 순위</a></li>
					<li><a href="javascript:void(0)">About @Trip </a></li>
				</ul>
			</div>
			<div class="list-footer">
				<ul>
					<li>계획</li>
					<li><a href="../plan.do">여행 동선 계획</a></li>
					<li><a href="../listBoard.do">동행 찾기</a></li>
				</ul>
			</div>
		</div>
		<img class="logo-footer" src="../resources/img/logo.png">
		<p>Copyright ⓒ 2019 @trip</p>
		<p>KKH ㅣ KDH ㅣ LPS ㅣ JYM</p>
	</div>
</footer>

</body>
</html>