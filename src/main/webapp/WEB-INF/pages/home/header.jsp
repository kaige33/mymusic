<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>龙哥音乐会</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap -->
<link href="<%=basePath %>static/home/css/bootstrap.min.css" rel='stylesheet' type='text/css' media="all" />
<!-- //bootstrap -->
<link href="<%=basePath %>static/home/css/dashboard.css" rel="stylesheet">
<!-- Custom Theme files -->
<link href="<%=basePath %>static/home/css/style.css" rel='stylesheet' type='text/css' media="all" />
<script src="<%=basePath %>static/home/js/jquery-1.11.1.min.js"></script>
<!--start-smoth-scrolling-->
<!-- fonts -->

<!-- //fonts -->
</head>
  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=basePath %>home/index"><h1><img src="<%=basePath %>static/home/images/logo.png" alt="" /></h1></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
			<div class="top-search">
				
			</div>
			<div class="header-top-right">
				<div class="file">
					<a href="<%=basePath %>manage/index">我要上传歌曲</a>
				</div>	
				
				 <c:if test="${user.username!=null}">     
				 <div class="signin">
					<a href="<%=basePath %>manage/index" class="play-icon ">欢迎您，${user.username }</a>
			</div>
					 <div class="signin">
					<a href="<%=basePath%>manage/quit?retUrl=index.html" class="play-icon ">注销账号</a>
			</div>
				 </c:if>
				
				<c:if test="${user.username==null}">    
				<div class="signin">
					<a href="<%=basePath %>manage/login" class="play-icon ">我要登录</a>
					<!-- pop-up-box -->
									<script type="text/javascript" src="<%=basePath %>static/home/js/modernizr.custom.min.js"></script>    
									<link href="<%=basePath %>static/home/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
									<script src="<%=basePath %>static/home/js/jquery.magnific-popup.js" type="text/javascript"></script>
									<!--//pop-up-box -->
									
									
									
									<script>
											$(document).ready(function() {
											$('.popup-with-zoom-anim').magnificPopup({
												type: 'inline',
												fixedContentPos: false,
												fixedBgPos: true,
												overflowY: 'auto',
												closeBtnInside: true,
												preloader: false,
												midClick: true,
												removalDelay: 300,
												mainClass: 'my-mfp-zoom-in'
											});
																											
											});
									</script>	
				</div>
				<div class="signin">
					<a href="#small-dialog" class="play-icon popup-with-zoom-anim">注册账号</a>
					
					<div id="small-dialog" class="mfp-hide">
						<h3>创建平台账号</h3>
						<div class="social-sits">
						
							<div class="button-bottom">
								<p>已有账号? <a href="<%=basePath %>manage/login" class="play-icon">点击登录</a></p>
							</div>
						</div>
						<div class="signup">
							<form action="<%=basePath %>manage/doreg" method="POST">
								<input type="text" name="username" class="email" placeholder="账号" required="required" />
								<input type="password" name="password" placeholder="密码" required="required" />
								<input type="password" name="password2" placeholder="确认密码" required="required" />
								
								<input type="submit"  value="提交注册信息"/>
							</form>
							
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				
				</c:if>
				<div class="clearfix"> </div>
			</div>
        </div>
		<div class="clearfix"> </div>
      </div>
    </nav>
	
        <div class="col-sm-3 col-md-2 sidebar">
			<div class="top-navigation">
				<div class="t-menu">MENU</div>
				<div class="t-img">
					<img src="<%=basePath %>static/home/images/lines.png" alt="" />
				</div>
				<div class="clearfix"> </div>
			</div>
				<div class="drop-navigation drop-navigation">
				  <ul class="nav nav-sidebar">
				  <li><a href="<%=basePath %>home/index" class="home-icon"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				  <li><a href="<%=basePath %>home/foryou" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-blackboard" aria-hidden="true"></span> 歌单推荐</a></li>
				  <li><a href="<%=basePath %>home/join" class="user-icon"><span class="glyphicon glyphicon-home glyphicon-hourglass" aria-hidden="true"></span> 在线点播</a></li>
				     <c:forEach items="${requestScope.clist }" var="u">
					<li class="active"><a href="<%=basePath %>home/mlist/?type=${u.id}" class="song-icon">
					<span class="glyphicon glyphicon-music" aria-hidden="true">
					</span>${u.title }</a></li>
					</c:forEach>
				  </ul>
				  <!-- script-for-menu -->
						<script>
							$( ".top-navigation" ).click(function() {
							$( ".drop-navigation" ).slideToggle( 300, function() {
							// Animation complete.
							});
							});
						</script>
					<div class="side-bottom">
						<div class="side-bottom-icons">
							
						</div>
						<div class="copyright">
							<p>Copyright &copy; 2018.   All rights reserved.</p>
						</div>
					</div>
				</div>
        </div>
    