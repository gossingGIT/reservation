<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>군산대 축구장 예약 시스템</title>


<style>
#ft {
html,body {height:100%;}
width:100%;
hegiht:118px;
clear:both;
margin-top:30px;
}
#head {
width:100;
z-index:2000;
position:relative;
}
#content {
width:100%;
min-height:100%;}



</style>

<body>
  <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <!-- Custom fonts for this template -->
   <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'> 

  <!-- Custom styles for this template -->
  <link href="/resources/css/clean-blog.min.css" rel="stylesheet">
    
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="/">군산대 축구장 예약 페이지</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
        <li class="nav-item">
            <a class="nav-link" href="/notice/view">공지사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/reservation/view">예약하기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/recruit/view">상대모집</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/talk/view">자유게시판</a>
          </li>
          <li class="nav-item">
          	<c:if test="${empty login}">
            <a class="nav-link" href="/user/login">로그인</a>
            </c:if>
            <c:if test="${not empty login}">
            <a class="nav-link" href="/user/logout">로그아웃</a>
            </c:if>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('/resources/img/home-bg.jpg')">
    <div class="overlay"></div>
    <div class="container" id="head">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
        <div class="site-heading">
            <!-- 
            <h1>Clean Blog</h1>
            <span class="subheading">A Blog Theme by Start Bootstrap</span>
             -->
          </div> 
        </div>
      </div>
    </div>
  </header>