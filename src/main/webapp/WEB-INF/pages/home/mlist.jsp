<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="header.jsp"></jsp:include>
 <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="main-grids">
				<div class="top-grids">
					<div class="recommended-info">
						<h3>音乐中心</h3>
					</div>
					
					
					<div class="clearfix"> </div>
				</div>
				
				<div class="recommended">
					<div class="recommended-grids">
					 <c:forEach items="${requestScope.list }" var="u">
						<div class="col-md-3 resent-grid recommended-grid">
							<div class="resent-grid-img recommended-grid-img">
								<a href="<%=basePath %>home/play?id=${u.id}"><img style="width:305px;height:225px;" src="<%=basePath %>${u.thumb }" alt="" /></a>
								<div class="time small-time">
									<p>${u.created }</p>
								</div>
								<div class="clck small-clck">
									<span class="glyphicon glyphicon-time" aria-hidden="true"></span>
								</div>
							</div>
							<div class="resent-grid-info recommended-grid-info video-info-grid">
								<h5><a href="<%=basePath %>home/play?id=${u.id}" class="title">${u.title }</a></h5>
								
							</div>
						</div>
						
						</c:forEach>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			
			<jsp:include page="footer.jsp"></jsp:include>
