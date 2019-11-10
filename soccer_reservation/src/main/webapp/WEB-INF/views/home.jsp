<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="includes/header.jsp"%>
<style type="text/css">
/*.jumbotron {
	background-image: url('/resources/img/jumbo_bg.jpg');
	background-size: cover;
	text-shadow: black 0.3em 0.3em 0.3em;
	color: white;
}*/
</style>
  <!-- Main Content -->
  <div class="container" id="content">
    
     <div class="jumbotron">
  <h1 class="display-4">환영합니다!</h1>
  <p class="lead">군산대학교 축구장, 풋살장을 예약하시려면 군산대 웹메일을 보유 하셔야 합니다. 회원 가입 후 예약 시작 시간을 확인하신 후 예약을 진행해 주세요.</p>
  <hr class="my-4">
  <p>아직 회원가입이 되있지 않으신가요? 지금 바로 회원가입 후 서비스를 이용해주세요.</p>
  <a class="btn btn-primary btn-lg" href="/user/register" role="button">회원가입</a>
</div>
    <div class="row">
   <!--    <div class="col-lg-8 col-md-10 mx-auto">-->
        
        <hr>
   <!--    <div class="row"> -->
		
			
			
			<div class="col-md-4">
				<div class="card" >
					<h5 class="card-header">공지사항</h5>
					<div class="card-body" id="notice">
						
					</div>
				</div>
			</div>
			
			<div class="col-md-4">
				<div class="card" >
					<h5 class="card-header">상대모집</h5>
					<div class="card-body" id="recruit">
						
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<h5 class="card-header">자유게시판</h5>
					<div class="card-body" id="talk">
						
					</div>
				</div>
			</div>
			
		<!-- </div> -->
     <!-- </div>-->
    </div>
   
    
  </div>


<script>
var str1="";
var str2="";
var str3="";
$.getJSON("/recent/all/notice",function(data){
	
	$(data).each(function(){
		str1 +="<a href='/notice/read?bno="+this.bno+"'>"+"● "+this.title+"</a><br>";
	});
	
	$("#notice").html(str1);
});




</script>

<script>
$.getJSON("/recent/all/recruit",function(data){
	
	$(data).each(function(){
		str2 +="<a href='/recruit/read?bno="+this.bno+"'>"+"● "+this.title+"</a><br>";
	});
	
	$("#recruit").html(str2);
});

</script>
 
<script>
$.getJSON("/recent/all/talk",function(data){
	
	$(data).each(function(){
		str3 +="<a href='/talk/read?bno="+this.bno+"'>"+"● "+this.title+"</a><br>";
	});
	
	$("#talk").html(str3);
});
</script>  
<%@include file="includes/footer.jsp"%>

