<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/jquery.js"></script>
		<title>Error Page</title>
	</head>

	<body>
		<%
			String path = request.getContextPath();
			if (path.equals("")) {
				path = "/";
			}
		%>
		您没有访问该资源的权限，
		<c:choose>
			<c:when test="<@jspEl 'referer != null'/>">
				<script type="text/javascript">
var timer = 3;
var interval = window.setInterval(function(){
	if(timer <= 1){
		window.clearInterval(interval);
		window.location.href = "<@jspEl 'referer'/>";
	}else{
		timer --;
		$("#timer_span").html(timer);
	}
},1000);
</script>
				<span style="color: #FF0000" id="timer_span">3</span>秒后自动返回到上一页。<br />
如果您的页面没有反映，请点击 <a style="color: #FF0000" href="<@jspEl 'referer'/>">返回上一页</a>
				<a style="color: #FF0000" href="<%=path%>">返回首页</a>
			</c:when>
			<c:otherwise>
				<script type="text/javascript">
var timer = 3;
var interval = window.setInterval(function(){
	if(timer <= 1){
		window.clearInterval(interval);
		window.location.href = "<%=path%>";
	}else{
		timer --;
		$("#timer_span").html(timer);
	}
},1000);
</script>
				<span style="color: #FF0000" id="timer_span">3</span>秒后自动返回到首页。<br />
如果您的页面没有反映，请点击  <a style="color: #FF0000" href="<%=path%>">返回首页</a>
				<a style="color: #FF0000" href="<@jspEl 'ctx'/>/admin/login">登陆</a>
			</c:otherwise>
		</c:choose>


	</body>
</html>