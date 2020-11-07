<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  import="com.app.utils.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
.albox{overflow:hidden;}
.albox:hover{border:0px solid #c00;background:#fff;cursor:pointer;}
.albox img{ transition: all 0.6s;  }
.albox img:hover{ transform: scale(1.4);  }
</style>
<style>
            .ml20, .ml-20 {
    margin-left: 0px !important;
    margin-top:10px;
}

.btn {
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: 0 1px 1px rgba(0,0,0,0.05);
}

.btn-lg, .btn-group-lg>.btn {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.33;
    border-radius: 6px;
}

.btn-primary {
    color: #fff;
    background-color: #009a61;
    border-color: #008151;
}

.btn {
    display: inline-block;
    margin-bottom: 0;
    font-weight: normal;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    white-space: nowrap;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42858;
    border-radius: 4px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

.widget-answers__item {
    margin-bottom: 10px;
    padding-bottom: 0px;
    border-bottom: 1px solid #ddd;
}

.widget-answers__item .post-offset {
    -moz-transition: all 1s ease;
    -o-transition: all 1s ease;
    -webkit-transition: all 1s ease;
    transition: all 1s ease;
}

.post-offset {
    margin-left: 65px;
}

.widget-answers__item .post-offset .answer.fmt {
    margin-bottom: 15px;
}
.widget-answers__item .answer__info--author {
    padding-left: 0;
    line-height: 32px;
}
.fmt {
    line-height: 1.6;
    word-wrap: break-word;
}



.left img{max-width:100%;}
        </style>
<style>
#skPlayer .skPlayer-play-btn{left:50%!important;}
.favBtn { width:250px;   outline: none; text-align:center;
    font-style: normal;
    padding: 8px 20px;
    background: #21DEEF;
    font-size: 14px;
    color: #fff;
    display: block;
    border: none;
    border-radius: 3px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    -o-border-radius: 3px;
    -ms-border-radius: 3px;
    transition: .5s all;
    -webkit-transition: .5s all;
    -moz-transition: .5s all;
    -o-transition: .5s all;
    -ms-transition: .5s all;}

</style>
<jsp:include page="header.jsp"></jsp:include>
    <!--content start-->
 <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="top-grids">
					<div class="recommended-info">
						<h3>在线点播</h3>
					</div>
    <div class="recommended-info box">
						
					</div>
    <div id="skPlayer"></div>
 
    <br /><br /><br />
      
           
     
     
         </div>
         <!--end left -->
        
         <div class="clear"></div>
         
    </div>
    
         <script src="<%=basePath %>static/skplayer/dist/skPlayer.min.js"></script>
    <script>
    var uds =[2127074784,2131342529,2075642590,480143181,2118036706,2128755383,2129467457,2129466456,2128571926,2127472941];
    var player = new skPlayer({
        autoplay: true,
        //可选项,自动播放,默认为false,true/false
        listshow: true,
        //可选项,列表显示,默认为true,true/false
        mode: 'listloop',
        //可选项,循环模式,默认为'listloop'
        //'listloop',列表循环
        //'singleloop',单曲循环
        music: {
        //必需项,音乐配置
            type: 'cloud',
            //必需项,网易云方式指定填'cloud'
            source: uds[rnd(0,uds.length)]
            //必需项,网易云音乐歌单id
            //登录网易云网页版,在网页地址中拿到
            // ... playlist?id=317921676
        }
    });
    
    function rnd(n, m){
        var random = Math.floor(Math.random()*(m-n+1)+n);
        return random;
    }
    
    </script><script src="<%=basePath %>static/kindeditor-4.1.10/kindeditor-min.js"></script>
				<script>
					KindEditor.ready(function (K) {
						editor = K.create('textarea[name="content"]', {
							uploadJson: '<%=basePath %>static/kindeditor-4.1.10/php/upload_json.php',
							fileManagerJson: '<%=basePath %>static/kindeditor-4.1.10/php/file_manager_json.php',
							allowFileManager: true,
							items : ['source',
								'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
								'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
								'insertunorderedlist', '|', 'emoticons', 'image', 'link','fullscreen'],
							afterBlur: function () {
								this.sync();
							}
						});
					});


				</script>
    </div></div></div></div></div>
    <!--content end-->
   <jsp:include page="footer.jsp"></jsp:include>