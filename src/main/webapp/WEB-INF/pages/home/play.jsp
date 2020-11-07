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
						<h3>${art.title }</h3>
					</div>
    <div class="recommended-info box">
						 <c:if test="${user.username!=null}">   
						 <c:if test="${check!=null }">
						 <a class="favBtn" href="<%=basePath%>home/cancelFav?id=${check.id}">取消收藏</a>
						 </c:if>
						  <c:if test="${check==null }">
						 <a class="favBtn" href="<%=basePath%>home/addFav?id=${art.id}">收藏</a>
						 </c:if>
						 </c:if>
					<div>
					<p>
					${art.bodytext }
					</p>
					</div></div>
					
    <div id="skPlayer"></div>
 
    <br /><br /><br />
       <div class="row" id="cmtWP" style="padding-left:10px;">
        <h2>评论列表</h2>
        <br /><br />

       
 <c:forEach items="${requestScope.list2 }" var="u" varStatus="st">
        
        <article class="clearfix widget-answers__item" id="a-1020000004183223">
      

        <div class="post-offset" style="margin-left:0px;">

              <div class="row answer__info--row">
                <div class="post-opt col-md-8 col-sm-8 col-xs-10" style="border-bottom:1px dotted #f1f1f1;">
                    <ul class="list-inline mb0"><li class="pr15">
                        <a href="JavaScript:;"> <a class="answer__info--author-name" title="" href="JavaScript:;">
                        ${u.u.username }
                        </a><span class="answer__info--author-rank"></span> ${u.created }</a>

                                                </li></ul>                </div>

                
            </div>
            <div class="answer fmt" data-id="1020000004183223" style="padding:15px 0;border-bottom:0px solid #ddd;">
                                    <p>${u.content }</p>
                            </div>

            
                        
          


          


        </div>
            </article>

</c:forEach>
             


        <hr />
  <c:if test="${user.username!=null}">   
        <form action="<%=basePath%>home/addpost" method="post">
        <h2>发表评论</h2> <br />

        <textarea id="getmycode" class="getCodePane" required name="content" rows="5" wrap="off" style="width:100%;" >
            </textarea>
        <input type="hidden" name="id" value="${art.id }">
        <button type="submit" id="answerIt" data-id="1010000004182721" class="btn btn-lg btn-primary ml20">提交评论
                        </button>
       </form>
</c:if>

       
        </div> 
     </div>
           
     
     
         </div>
         <!--end left -->
        
         <div class="clear"></div>
         
    </div>
    
         <script src="<%=basePath %>static/skplayer/dist/skPlayer.min.js"></script>
    <script>
    var player = new skPlayer({
       
       //可选项配置同上
       music: {
       //必需项,音乐配置
           type: 'file',
           //必需项,自配置文件方式指定填'file'
           source: [
           //必需项,音乐文件数组
               {
                   name: '${art.title}',
                   //必需项,歌名
                   author: '${art.description}',
                   //必需项,歌手
                   src: '<%=basePath%>${art.filepath}',
                   //必需项,音乐文件
                   cover: '<%=basePath%>${art.thumb}'
                   //必需项,封面图片
               },
           ]
       }
   });
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