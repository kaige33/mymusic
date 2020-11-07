<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=basePath %>static/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath %>static/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/admin.css">
    <link rel="stylesheet" href="<%=basePath %>static/assets/css/app.css">
    <script src="<%=basePath %>static/assets/js/echarts.min.js"></script>
    <style>
    
    .am-form-group{padding:0px;margin:0px;}
    .am-form-group label{width:100px;height:17px;padding:0px;"}
    </style>
</head>

<body data-type="index">


    





       
          
            <div class="row" style="padding-left:30px;padding-right:30px;">
              
<div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-plus"></span> 用户创建
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                              
                                </div>
                        </div>
                    </div>


                </div>
                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form">


                        <div class="am-u-sm-6 am-u-md-6">
                            <form class="am-form" action="<%=basePath %>users/users/save" method="POST">
                            
                           
                                
                                 
                                
                                <div style="clear:both"></div>
                            
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">账号</label>
                                    <div class="">
                                        <input type="text" name="username" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">密码</label>
                                    <div class="">
                                        <input type="password" name="password" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">确认密码</label>
                                    <div class="">
                                        <input type="password" name="password2" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                    <div style="clear:both"></div>
                                
                                
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">头像</label>
                                    <div class="">
                                        <input readonly type="text"   required   id="thumb" value="" name="thumb" >
																<a href="javascript:;" class="uploadImg">点击上传</a>
                                        <small></small>
                                    </div>
                                </div>
                                    <div style="clear:both"></div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">姓名</label>
                                    <div class="">
                                        <input type="text" name="realname" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">性别</label>
                                    <div class="">
                                        <input type="text" name="sex" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                             
                                    <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">年龄</label>
                                    <div class="">
                                        <input type="number" name="age" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
    <div style="clear:both"></div>

 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">身份证</label>
                                    <div class="">
                                        <input type="text" name="ecard" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">联系地址</label>
                                    <div class="">
                                        <input type="text" name="address" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                
                                
                                    <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">邮箱</label>
                                    <div class="">
                                        <input type="text" name="email" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                    <div style="clear:both"></div>
                                
                                   <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">qq</label>
                                    <div class="">
                                        <input type="text" name="qq" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">电话</label>
                                    <div class="">
                                        <input type="text" name="tel" required placeholder="">
                                        <small></small>
                                    </div>
                                </div>
                                
                                
                                 <div class="am-form-group">
                                    <label for="user-name"  class="am-u-sm-2 am-form-label">类型</label>
                                    <div class="am-u-sm-6">
                                         <select name="type" style="height:40px;" class="form-control">
        	 <option value="1">用户</option>
        	<option value="5">管理员</option>
        </select>
                                        <small></small>
                                    </div> <div class="am-u-sm-3"></div>
                                </div>
                               
   <div style="clear:both"></div> <br><br>
                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                        <button type="submit" class="am-btn am-btn-primary">保存数据</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
    </div>    </div>
    


    <script src="<%=basePath %>static/assets/js/jquery.min.js"></script>
    <script src="<%=basePath %>static/assets/js/amazeui.min.js"></script>
    <script src="<%=basePath %>static/assets/js/iscroll.js"></script>
    <script src="<%=basePath %>static/assets/js/app.js"></script>
    <script src="<%=basePath %>static/layer/layer.js"></script>
    <script src="<%=basePath%>source/scripts/window.js"></script>
  <c:if test="${!empty message}">		
			<script>
			 var btn = $("#showMsgBtn", window.parent.document);
		       var msg = $("#msg", window.parent.document);
		       $(msg).val("${message}");
		       $(btn).click();
			//layer.alert("${message}",{icon: 1});
			</script>
		</c:if>
		
		<script>
window.onload = function(){
	$(".uploadImg").click(function(){
		openWindow("<%=basePath%>upload.jsp");
	});
	$("#thumb").on("input",function(){
		$(".oldImg").attr("src","<%=basePath%>"+$("#thumb").val());
	});
};
</script>


<script>
var option = "<option value=''>==请选择==</option>";
		
		$("#collegeId").change(function(){
			$("#majorId").html(option);
			$("#classId").html(option);
			loadMajor($(this).val());		
		});
		
		$("#majorId").change(function(){		
			$("#classId").html(option);
			loadClass($(this).val());		
		});
		
		function loadMajor(id)
		{
			url = "<%=basePath%>class/class/getMajor?id="+id;
		
			
			
			$.ajax({
			    url: url,
			    type: 'GET',
			    dataType: 'text/html',
			    timeout: 5000,
			    async: false,
			    error: function(data){
			    	$("#majorId").html(data.responseText);
			    },
			    success: function(json){
			    // alert("OK");
			    }
			  });
		}
		
		
		function loadClass(id)
		{
			url = "<%=basePath%>class/class/getClass?id="+id;
		
			
			
			$.ajax({
			    url: url,
			    type: 'GET',
			    dataType: 'text/html',
			    timeout: 5000,
			    async: false,
			    error: function(data){
			    	$("#classId").html(data.responseText);
			    },
			    success: function(json){
			    // alert("OK");
			    }
			  });
		}
		</script>
</body>

</html>
