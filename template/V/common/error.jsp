<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/taglibs.jsp"%>
<html>
	<head>
		<title>Error Page</title>
		<script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/jquery.js"></script>
		<script language="javascript">
		function showDetail()
		{
			var elm = document.getElementById('detail_system_error_msg');
			if(elm.style.display == '') {
				elm.style.display = 'none';
			}else {
				elm.style.display = '';
			}
		}
		$(document).ready(function() {
			$.ajax({
		       type: "POST",
		       url: "<@jspEl 'ctx'/>/yzy/logError/saveError",
		       cache: false,
		       data: "exceptionMsg=" + $("#detail_system_error_msg").html()
		    })
		});
	</script>
	</head>

	<body>

		<div id="content">
			<%
				//Exception from JSP didn't log yet ,should log it here.
				String requestUri = (String) request
						.getAttribute("javax.servlet.error.request_uri");
			%>
			<h3>
				对不起,发生系统内部错误,不能处理你的请求
				<br />
			</h3>
			<!-- 
		<b>错误信息:</b> <%=exception.getMessage()%>
		<br>
	 -->

			<button onclick="history.back();">
				返回
			</button>
			<br>

			<p>
				错误信息已经上报系统管理员,我们会尽快解决问题,带来的不便请您谅解
				<!-- 
	 <a href="#" onclick="showDetail();">点击这里查看具体错误消息</a>,报告以下错误消息给系统管理员,可以更加快速的解决问题
	 -->
			</p>

			<div id="detail_system_error_msg" style="display: none">
				<pre>
					<%
						exception.printStackTrace(new java.io.PrintWriter(out));
					%>
				</pre>
			</div>
		</div>
	</body>
</html>