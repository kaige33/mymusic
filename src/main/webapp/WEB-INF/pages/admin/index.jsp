<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<head>
    <!-- -------------- Meta and Title -------------- -->
    <meta charset="utf-8">
    <title>龙哥音乐会</title>
    <meta name="author" content="ThemeREX">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- -------------- Fonts -------------- -->
 

    <!-- -------------- Icomoon -------------- -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/login/assets/fonts/icomoon/icomoon.css">

    <!-- -------------- FullCalendar -------------- -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/login/assets/js/plugins/fullcalendar/fullcalendar.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/login/assets/js/plugins/magnific/magnific-popup.css">

    <!-- -------------- Plugins -------------- -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/login/assets/js/plugins/c3charts/c3.min.css">

    <!-- -------------- CSS - theme -------------- -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/login/assets/skin/default_skin/css/theme.css">

    <!-- -------------- CSS - allcp forms -------------- -->
    <link rel="stylesheet" type="text/css" href="<%=basePath %>static/login/assets/allcp/forms/css/forms.css">

    <!-- -------------- Favicon -------------- -->
    <link rel="shortcut icon" href="assets/img/favicon.ico">

    <!-- -------------- IE8 HTML5 support  -------------- -->
    <!--[if lt IE 9]>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.2/html5shiv.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="dashboard-page">

<!-- -------------- Customizer -------------- -->

<!-- -------------- /Customizer -------------- -->

<!-- -------------- Body Wrap  -------------- -->
<div id="main">

    <!-- -------------- Header  -------------- -->
    <header class="navbar navbar-fixed-top bg-dark">
        <div class="navbar-logo-wrapper">
            <a class="navbar-logo-text" href="<%=basePath %>/manage/index">
                <b>龙哥音乐会</b>
            </a>
            <span id="sidebar_left_toggle" class="ad ad-lines"></span>
        </div>
        <ul class="nav navbar-nav navbar-left">
            <li class="dropdown dropdown-fuse hidden-xs">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">欢迎您，${user.username }
                    <span class="fa fa-chevron-down"></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                <li><a href="<%=basePath%>home/index">首页</a></li>
                    <li><a target="mainframe" href="<%=basePath%>users/users/profile">资料更新</a></li>
                    <li><a target="mainframe" href="<%=basePath%>users/users/password">密码设置</a></li>                    
                    <li class="divider"></li>
                    <li><a href="<%=basePath%>manage/quit?retUrl=index.html">安全退出</a></li>
                </ul>
            </li>
            <li class="hidden-xs">
                <a class="navbar-fullscreen toggle-active" href="#">
                    <span class="glyphicon glyphicon-fullscreen"></span>
                </a>
            </li>
        </ul>
        
        
    </header>
    <!-- -------------- /Header  -------------- -->

    <!-- -------------- Sidebar  -------------- -->
    <aside id="sidebar_left" class="nano nano-light affix">

        <!-- -------------- Sidebar Left Wrapper  -------------- -->
        <div class="sidebar-left-content nano-content">

            <!-- -------------- Sidebar Header -------------- -->
            <header class="sidebar-header">

              

                <!-- -------------- Sidebar - Author Menu  -------------- -->
                
            </header>
            <!-- -------------- /Sidebar Header -------------- -->

            <!-- -------------- Sidebar Menu  -------------- -->
            <ul class="nav sidebar-menu">
                <li class="sidebar-label pt30">操作菜单</li>
 <c:if test="${user.type eq 5 }">
                <li class="active">
                    <a class="accordion-toggle menu-open" href="#">
                        <span class="fa fa-dashboard"></span>
                        <span class="sidebar-title">用户管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li class="active">
                            <a target="mainframe" href="<%=basePath %>users/users/list">
                                <span class="fa fa-file-text-o"></span> 用户管理 </a>
                        </li>
                        <li>
                            <a target="mainframe" href="<%=basePath %>users/users/add">
                                <span class="fa fa-file-text-o"></span> 创建用户 </a>
                        </li>
                    </ul>
                </li>
                
                
                <li class="">
                    <a class="accordion-toggle menu-open" href="#">
                        <span class="fa fa-list"></span>
                        <span class="sidebar-title">音乐类别管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li class="active">
                            <a target="mainframe" href="<%=basePath %>category/category/list">
                                <span class="fa fa-file-text-o"></span> 类别管理 </a>
                        </li>
                        <li>
                            <a target="mainframe" href="<%=basePath %>category/category/add">
                                <span class="fa fa-file-text-o"></span> 类别创建 </a>
                        </li>
                    </ul>
                </li>
                
                
                 <li class="">
                    <a class="accordion-toggle menu-open" href="#">
                        <span class="fa fa-list"></span>
                        <span class="sidebar-title">歌曲管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li class="active">
                            <a target="mainframe" href="<%=basePath %>article/article/list">
                                <span class="fa fa-file-text-o"></span> 歌曲管理 </a>
                        </li>
                        <li>
                            <a target="mainframe" href="<%=basePath %>article/article/add">
                                <span class="fa fa-file-text-o"></span> 发布歌曲 </a>
                        </li>
                    </ul>
                </li>
                </c:if>
                
                 <c:if test="${user.type eq 1 }">
                 
                 
                 <li class="">
                    <a class="accordion-toggle menu-open" href="#">
                        <span class="fa fa-list"></span>
                        <span class="sidebar-title">歌曲管理</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li class="active">
                            <a target="mainframe" href="<%=basePath %>article/article/mylist">
                                <span class="fa fa-file-text-o"></span> 我的歌曲 </a>
                        </li>
                        <li>
                            <a target="mainframe" href="<%=basePath %>article/article/add">
                                <span class="fa fa-file-text-o"></span> 发布歌曲 </a>
                        </li>
                    </ul>
                </li>
                 
                 </c:if>
                
                
            </ul>
            <!-- -------------- /Sidebar Menu  -------------- -->

            <!-- -------------- Sidebar Hide Button -------------- -->
            <div class="sidebar-toggler">
                <a href="#">
                    <span class="fa fa-arrow-circle-o-left"></span>
                </a>
            </div>
            <!-- -------------- /Sidebar Hide Button -------------- -->

        </div>
        <!-- -------------- /Sidebar Left Wrapper  -------------- -->

    </aside>
    <!-- -------------- /Sidebar -------------- -->

    <!-- -------------- Main Wrapper -------------- -->
    <section id="content_wrapper">

        <!-- -------------- Topbar Menu Wrapper -------------- -->
        
        <!-- -------------- /Topbar Menu Wrapper -------------- -->

        <!-- -------------- Topbar -------------- -->
        <header id="topbar" class="alt">
            <div class="topbar-left">
                <ol class="breadcrumb">
                    <li class="breadcrumb-icon">
                        <a href="<%=basePath%>manage/index">
                            <span class="fa fa-home"></span>
                        </a>
                    </li>
                    <li class="breadcrumb-active">
                        <a href="<%=basePath%>manage/index">欢迎你使用</a>
                    </li>
                  
                </ol>
            </div>
            
        </header>
        <!-- -------------- /Topbar -------------- -->

        <!-- -------------- Content -------------- -->
        <section id="content" class="table-layout animated fadeIn">

            <!-- -------------- Column Center -------------- -->
            <div class="chute chute-center">

               <iframe name="mainframe" src="" id="iframe" style="min-height:1200px;overflow:hidden;" width="100%" height="100%" frameborder="0"></iframe>
                
                 </div> 
                 </section>
 </div>

        </div>
    </aside>
    <!-- -------------- /Sidebar Right -------------- -->

</div>
<!-- -------------- /Body Wrap  -------------- -->

<!-- -------------- Scripts -------------- -->

<!-- -------------- jQuery -------------- -->
<script src="<%=basePath %>static/login/assets/js/jquery/jquery-1.11.3.min.js"></script>
<script src="<%=basePath %>static/login/assets/js/jquery/jquery_ui/jquery-ui.min.js"></script>

<!-- -------------- HighCharts Plugin -------------- -->
<script src="<%=basePath %>static/login/assets/js/plugins/highcharts/highcharts.js"></script>
<script src="<%=basePath %>static/login/assets/js/plugins/c3charts/d3.min.js"></script>
<script src="<%=basePath %>static/login/assets/js/plugins/c3charts/c3.min.js"></script>

<!-- -------------- Simple Circles Plugin -------------- -->
<script src="<%=basePath %>static/login/assets/js/plugins/circles/circles.js"></script>

<!-- -------------- Maps JSs -------------- -->
<script src="<%=basePath %>static/login/assets/js/plugins/jvectormap/jquery.jvectormap.min.js"></script>
<script src="<%=basePath %>static/login/assets/js/plugins/jvectormap/assets/jquery-jvectormap-us-lcc-en.js"></script>

<!-- -------------- FullCalendar Plugin -------------- -->
<script src="<%=basePath %>static/login/assets/js/plugins/fullcalendar/lib/moment.min.js"></script>
<script src="<%=basePath %>static/login/assets/js/plugins/fullcalendar/fullcalendar.min.js"></script>

<!-- -------------- Date/Month - Pickers -------------- -->
<script src="<%=basePath %>static/login/assets/allcp/forms/js/jquery-ui-monthpicker.min.js"></script>
<script src="<%=basePath %>static/login/assets/allcp/forms/js/jquery-ui-datepicker.min.js"></script>

<!-- -------------- Magnific Popup Plugin -------------- -->
<script src="<%=basePath %>static/login/assets/js/plugins/magnific/jquery.magnific-popup.js"></script>

<!-- -------------- Theme Scripts -------------- -->
<script src="<%=basePath %>static/login/assets/js/utility/utility.js"></script>
<script src="<%=basePath %>static/login/assets/js/demo/demo.js"></script>
<script src="<%=basePath %>static/login/assets/js/main.js"></script>

<!-- -------------- Widget JS -------------- -->
<script src="<%=basePath %>static/login/assets/js/demo/widgets.js"></script>
<script src="<%=basePath %>static/login/assets/js/demo/widgets_sidebar.js"></script>
<script src="<%=basePath %>static/login/assets/js/pages/dashboard1.js"></script>
<!-- -------------- /Scripts -------------- -->

</body>

</html>
