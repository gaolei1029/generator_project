<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="<@jspEl 'css_ctx'/>/adminStyles/css/top.css?v=<@jspEl 'v'/>" />
	<link type="text/css" rel="stylesheet" href="<@jspEl 'css_ctx'/>/adminStyles/css/skin_black.css?v=<@jspEl 'v'/>" />
	<script type="text/javascript" src="<@jspEl 'js_ctx' />/scripts/jquery/jquery-1.11.2.min.js?v=<@jspEl 'v'/>"></script>
	<script type="text/javascript" src="<@jspEl 'js_ctx' />/scripts/jquery/migrate/jquery-migrate-1.2.1.js?v=<@jspEl 'v'/>"></script>
	<title>头部</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div class="header">
	<div class="topnav" id="topnav">
		<h1>
			<a class="logo" href="http://www.up72.com" title="开拓明天" >开拓云</a>
		</h1>
		<div class="top-panel">
			<ul class="top-menu">
				<li id="c_1" class=on>
					<a onclick="ClassList('1');" href="sysLeft.jsp" target="leftFrame">测试</a>
				</li>
			</ul>
			<%--<div id="msgInfo" class="user-msg-btn">--%>
				<%--<a href="u.asp?action=msg&id=1" target="main"><em style="visibility: visible;">1</em><span>条信息</span></a>--%>
			<%--</div>--%>
			<!--		在没有消息的情况下
                        <div id="msgInfo" class="user-msg-btn" data-event="msg_link">
                            <em style="visibility: hidden"></em><span>条信息</span>
                        </div>-->
			<ul class="top-menu fr">
				<li><a href="javascript:;">kaituomingtian@up72.com </a></li>
			</ul>
		</div>
	</div>

</div>
<script type="text/javascript">
	function ClassList(ClassID) {
		if($("#c_" + ClassID).hasClass("on")) {
			//$("#c_"+ClassID).removeClass("");
		}
		else {
			$("#nav li").removeClass("on");
			$("#c_" + ClassID).addClass("on");
			// $('#taglist_li').load('daoheAjax.asp?action=taglist&classID='+ClassID+'');
		}
		//$("#ClassIDlist").html(ClassID);
		//$("#ClassID").val(ClassID);
	}
</script>
</body>
</html>
