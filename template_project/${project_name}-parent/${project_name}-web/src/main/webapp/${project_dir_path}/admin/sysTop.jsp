<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<@jspEl 'css_ctx' />/styles/css/style.css" rel="stylesheet" type="text/css">
	<link href="<@jspEl 'css_ctx' />/styles/css/top.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<@jspEl 'js_ctx' />/scripts/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<@jspEl 'js_ctx' />/scripts/jquery/migrate/jquery-migrate-1.2.1.js"></script>
	<title>头部</title>
</head>
<body>
<div class="herder">
	<h1>开拓明天</h1>
	<div id="nav">
		<ul>
			<li id="c_0">
				<a onclick="ClassList('0');" href="javascript:;" target="main">首页</a>
			</li>
			<li id="c_6">
				<a onclick="ClassList('6');" href="javascript:;" target="leftFrame">系统配置</a>
			</li>
			<li id="c_1" class=on>
				<a onclick="ClassList('1');" href="Sys_left.jsp" target="leftFrame">导流系统</a>
			</li>
			<li id="c_2">
				<a onclick="ClassList('2');" href="javascript:;" target="leftFrame">赢客邦</a>
			</li>
			<li id="c_3">
				<a onclick="ClassList('3');" href="javascript:;" target="leftFrame">赢客微</a>
			</li>
			<li id="c_4">
				<a onclick="ClassList('4');" href="javascript:;" target="leftFrame">赢客商</a>
			</li>
			<li id="c_5">
				<a onclick="ClassList('5');" href="javascript:;" target="leftFrame">总经理养成系统</a>
			</li>
		</ul>
	</div>
	<div class="u_name">
		<a href="javascript:;" target="_parent">刘义</a> |
		<a href="http://gd.21gwy.com" target="main">财务系统</a> |
		<a href="http://oa.21gwy.com" target="_blank">办公系统</a> |
		<a href="http://login.21gwy.com/?action=out" target="_parent">全部退出</a>
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
