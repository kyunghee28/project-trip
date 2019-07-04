<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>@Trip : Join</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style type="text/css">
    @import url('resources/css/headerFooter.css');
    @import url('resources/css/main.css');
</style>
<style type="text/css">
.check{	color: red;	font-weight:bold;font-size:13px;margin-left: 20px;}
#id_check{display: none;}
#pwd_check{display: none;}
#psd_check{display: none;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="resources/js/headerFooter.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>
<script type="text/javascript">

f_data = "true";
p_data = "true";
p_data2 = "true";

function emaildo(){
	//이메일 중복검사
      var m_email = $("#m_email").val();
       
      if(m_email == null || m_email == ""){
	  	$("#id_check").text("아이디를 입력해주세요");
	  	$("#id_check").css("display","inline");		  	
	  	f_data = "true";
      }
      else{ 	 
		var mailJ = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{2,3}$/i;

		if(mailJ.test($("#m_email").val())){
			$("#id_check").text("");
			$("#id_check").css("display","none");
		
			$.ajax({
				url:"checkMail",data:{m_email:m_email}, type :'post',success:function(data){
					if (data == "true") { // 아이디가 사용중일때 
						
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("display","inline");
						f_data = "true";
							
					}else {
				
						$("#id_check").text("");
						$("#id_check").css("display","none");						
						f_data = "false"; 
					}
				}, error : function() {
					console.log("실패");
				}
			});
			
		}else{
			$("#id_check").text("이메일 형식이 아닙니다");
			$("#id_check").css("display","inline");	
			f_data = "true";
		}
     } 	
};

function pwddo(){
	
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9\d$@$!%*#?&]{6,12}$/;

	// 비밀번호 검사
	
		if(pwJ.test($("#m_pwd").val())){
			$("#pwd_check1").text("");
			$("#pwd_check1").css("display","none");	
			
			p_data = "false";
			
		}else{
			$("#pwd_check1").text("비밀번호를 6자 이상 12자 이하로 입력해주세요.");
			$("#pwd_check1").css("display","inline");
			p_data = "true";		
		}
		
		if($("#m_pwd").val() != $("#psw_repeat").val()){
			$("#psw_check2").text("비밀번호가 일치하지 않습니다.");
			$("#psw_check2").css("display","inline");
			
			p_data2 = "true";
			
		}else{
			$("#psw_check2").text('');
			
			p_data2 = "false"; 
		}		
			
};


function pwdcheckdo(){
	
	if($("#m_pwd").val() != $("#psw_repeat").val()){
		$("#psw_check2").text("비밀번호가 일치하지 않습니다.");
		$("#psw_check2").css("display","inline");
		
		p_data2 = "true";
		
	}else{
		$("#psw_check2").text('');
		
		p_data2 = "false"; 
	}		

};

$(function(){
			
	//체크박스-나라이름
	$.ajax("joincheckBoxCity",{success:function(data){
		Jcity = eval("("+data+")");
		$.each(Jcity, function(i,c) {
			var checkcity = $("<label></label>").addClass("ch_container").append(
				c.city_name_kor,
				$("<input type='checkbox' name='citycheck'></input>").attr("id","citycheck").attr("value",c.city_name_kor),
				$("<span></span>").addClass("checkmark")
			);
			var div = $("<div></div>").addClass("check_box");				
			$(div).append(checkcity);	
			$("#checkBoxAll").append(div);	
			
			
		});
	}});
		
		$("#button_joinus").click(function() {
			 if(f_data=="true"){
				 
	            return false;
		        }
			 if(p_data=="true"){
				
		          return false;
		     }
			 if(p_data2=="true"){
				 
		          return false;
	        }
		 	else{
		 		
		      alert("회원가입을 축하합니다");
		      $("#button_joinus").submit();
	      }
		});
	});	 
	
</script>

</head>
<body style="background: url('resources/img/sunrise.jpg')">
<header>
	<div class="logo-login"><a href="indexmain.jsp"><img src="resources/img/logo_top2.png"></a></div>
	<div style="display: none;" id="msg">${msg}</div>
</header>
<section>
	<div class="join-content" >
		<form action="join.do" method="POST" style="border:1px solid #ccc">
		  <div class="container">
		    <h1>회원가입</h1>
		    <p>서비스 이용을 위한 정보 입력해 주세요 :D</p>
		    <hr>
		    <p class="subTitle">필수</p>
		    <label for="email"><b>Email</b><span class="check" id="id_check"></span></label>
		  		<input type="text" placeholder="아이디로 사용할 이메일 입력" name="m_email" id="m_email" onchange="emaildo()" required>
			<br>	
		    <label for="psw"><b>Password</b><span class="check" id="pwd_check1"></span></label>
		    	<input type="password" placeholder="6자리 이상 12자리 이하 비밀번호 입력" name="m_pwd"  id="m_pwd" maxlength="12" onchange="pwddo()"required>
			<br>	
		    <label for="psw-repeat"><b>Repeat Password</b><span class="check" maxlength="12" id="psw_check2"></span></label>
		    	<input type="password" placeholder="비밀번호 재입력" name="psw_repeat"  id="psw_repeat" onchange="pwdcheckdo()" required>	    
		    <br>
		    <hr class="hrdot">
		    <p class="subTitle">선택</p>
		    <div id="checkBoxAll">
			    <h3>관심 여행지</h3>
			</div>
			  
		    <div id="checkBoxAll">
			    <h3>여행 스타일</h3>
				   <div class="check_box">
					<label class="ch_container">휴양지
					  <input type="checkbox" name="stylecheck" value="휴양지">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">스포츠
					  <input type="checkbox" name="stylecheck" value="스포츠">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">미식여행
					  <input type="checkbox" name="stylecheck"  value="미식여행">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">문화역사
					  <input type="checkbox" name="stylecheck" value="문화역사">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">	
					<label class="ch_container">쇼핑
					  <input type="checkbox" name="stylecheck" value="쇼핑">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">유흥
					  <input type="checkbox" name="stylecheck"value="유흥">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">	
					<label class="ch_container">하이킹
					  <input type="checkbox" name="stylecheck" value="하이킹">
					  <span class="checkmark"></span>
					</label>
				  </div>
				  <div class="check_box">
					<label class="ch_container">액티비티
					  <input type="checkbox" name="stylecheck" value="액티비티">
					  <span class="checkmark"></span>
					</label>
				  </div>
			  </div>	    
		
		    <div class="clearfix">
			
			      <input type="reset" class="cancelbtn" value="취소">
			      <input type="submit" class="signupbtn" id="button_joinus" value="가입">		    	
		    </div>
		  </div>
		</form>
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

