<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@include file="includes/header.jsp"%>
  <!-- Main Content -->
  <div class="container" id="content">
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

