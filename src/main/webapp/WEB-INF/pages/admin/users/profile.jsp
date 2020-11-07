<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" %>
<%@ page language="java" import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";


 
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="icon" href="src/img/fav.png">
  <!-- style -->
  <link rel="stylesheet" href="<%=basePath %>static/src/plug/bootstrap.css">
  <link rel="stylesheet" href="<%=basePath %>static/node_modules/chartist/dist/chartist.min.css">
  <link rel="stylesheet" href="<%=basePath %>static/src/plug/fullcalendar.min.css">
  <link rel="stylesheet" href="<%=basePath %>static/src/dist/style/app.css">
  
  <link rel="stylesheet" href="<%=basePath %>static/src/dist/style/sass/pages/_00-main.sass">
  <!-- titel -->
   <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/app.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
  <title></title>
  <style>
  
  .form p{color:#333!important;}
  </style>
</head>
<body>

 
              <div class="col-lg-12" style="padding-top:15px;">
                <!-- big box -->
                <div class="big-box">
                  <div class="col-lg-6">
                    
                    <form method="POST"  action="<%=basePath%>users/users/update">
                    <div class="card">
                      <div class="card-head">
                        <div class="left">资料更新</div>
                        <div class="right">
                          <i class="zmdi zmdi-chevron-down"></i>
                          <i class="zmdi zmdi-refresh-sync"></i>
                          <i class="zmdi zmdi-close-circle-o"></i>
                        </div>
                      </div>
                      <div class="card-body">
                        <div class="form">
                          <p>用户名</p>                          
                          <input name="username" class="form-control" readonly value="${user.username }" type="text" placeholder="" >
        <input name="id" type="hidden" value="${user.id }">
                        </div>
                        
                             <div class="form">
                          <p style="width:50px!important;">头像                      
                           <c:if test="${!empty user.thumb}">
		<img class="uploadImg oldImg" style="width:150px;height:150px;display:block;" src="<%=basePath %>${user.thumb}"/>
		<br>
</c:if>
		<br>
		<input type="hidden"   id="thumb" value="${user.thumb}" name="thumb" >
		<a href="javascript:;" style="width:400px;display:block;" class="uploadImg ">点击上传</a></p>    
                        </div>
                        
                        
                        
                           <div class="form">
                          <p>姓名</p>                          
                           <input name="realname" class="form-control" type="text" value="${user.realname }">
                        </div>
                        
                         <div class="form">
                          <p>性别</p>                          
                           <input name="sex" required class="form-control" type="text" value="${user.sex }">
                        </div>
                        
                         <div class="form">
                          <p>年龄</p>                          
                           <input name="age" required class="form-control" type="text" value="${user.age }">
                        </div>
                        
                         <div class="form">
                          <p>身份证</p>                          
                           <input name="ecard" class="form-control" type="text" value="${user.ecard }">
                        </div>
                         <div class="form">
                          <p>地址</p>                          
                           <input name="address" class="form-control" type="text" value="${user.address }">
                        </div>
                        
                        
                        <div class="form">
                          <p>邮箱</p>                          
                            <input name="email" class="form-control" type="text" value="${user.email }">
                        </div>
                        
                        <div class="form">
                          <p>QQ</p>                          
                            	<input name="qq" class="form-control" type="text" value="${user.qq }">
                        </div>
                        
                        <div class="form">
                          <p>电话</p>                          
                          <input name="tel" class="form-control" type="text" value="${user.tel }">
                        </div>
                        
                          <div class="form">
                          <p>签名档</p>                          
                          <input name="position" class="form-control" type="text" value="${user.position }">
                        </div>
                           <div class="form">
                          <p></p>                          
                          <button class="am-btn am-btn-primary" type="submit">提交</button>
                        </div>
                        <div class="form">
                        <h1 style="height:50px;"></h1>
                        </div>
                      </div>
                    </div>
                    
                    </form>
                    
                    
                  </div>
                    
                </div>
              </div>
            </div>
        
  <!-- end Layout -->


  <!-- script -->
  <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
  <script src="<%=basePath %>static/src/plug/tether.js"></script>
  <script src="<%=basePath %>static/src/plug/bootstrap.js"></script>
  <script src="<%=basePath %>static/src/plug/moment.js"></script>
  <script src="<%=basePath %>static/src/plug/jquery.flot.js"></script>
  <script src="<%=basePath %>static/node_modules/CurvedLines/curvedLines.js"></script>
  <script src="<%=basePath %>static/node_modules/peity/jquery.peity.min.js"></script>
  <script src="<%=basePath %>static/node_modules/easy-pie-chart/dist/jquery.easypiechart.min.js"></script>
  <script src="<%=basePath %>static/node_modules/chartist/dist/chartist.min.js"></script>
  <script src="<%=basePath %>static/src/plug/fullcalendar.min.js"></script>
  <script src="<%=basePath %>static/src/dist/js/dashone.js"></script>
  <script src="<%=basePath %>static/src/dist/js/app.js"></script>
  
  <script src="<%=basePath%>source/scripts/window.js"></script>
  <script>
$().ready(function(){
	$(".uploadImg").click(function(){
		openWindow("<%=basePath%>upload.jsp");
	});
	$("#thumb").on("input",function(){
		$(".oldImg").attr("src","<%=basePath%>"+$("#thumb").val());
	});
});
</script>
  
</body>
</html>

