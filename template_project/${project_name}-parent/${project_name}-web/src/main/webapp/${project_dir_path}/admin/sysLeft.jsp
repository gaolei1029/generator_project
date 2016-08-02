<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/common/function.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>左侧导航</title>
	<style type="text/css">
		body{margin:0;padding:0;overflow-x:hidden}
		html,body{height:100%}
		img{border:0}
		*{font-family:'微软雅黑';font-size:12px;color:#404040}
		dl,dt,dd{display:block;margin:0}
		a{text-decoration:none}
		#bg{background-image:url(<@jspEl 'img_ctx'/>/styles/images/content/dotted.png)}
		.container{width:100%;height:100%;margin:auto}
		.leftsidebar_box{width:160px;height:auto !important;overflow:visible !important;position:fixed;height:100% !important;background-color:#404040}
		.line{height:2px;width:100%;background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/line_bg.png);background-repeat:repeat-x}
		.leftsidebar_box dt{padding-left:40px;padding-right:10px;background-repeat:no-repeat;background-position:10px center;color:#f5f5f5;font-size:14px;position:relative;line-height:48px;cursor:pointer;border-bottom-width:1px;border-bottom-style:solid;border-bottom-color:#404040}
		.leftsidebar_box dd{padding-left:0}
		.leftsidebar_box dd a{ padding-left:40px; display:block; height:27px; padding-top:5px; margin-top: 1px; }
		.leftsidebar_box dd a{color:#a0a0a0;line-height:25px}
		.leftsidebar_box dd.selected a{color:#a0a0a0;background-color:#575757}
		.leftsidebar_box dd a:hover{background-color:#575757;color:#a0a0a0}
		.leftsidebar_box dd.selected a:hover{background-color:#575757}
		.leftsidebar_box dt img{position:absolute;right:10px;top:20px}
		.system_log dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/system.png)}
		.custom dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/custom.png)}
		.channel dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/channel.png)}
		.app dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/app.png)}
		.cloud dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/cloud.png)}
		.syetem_management dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/syetem_management.png)}
		.source dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/source.png)}
		.statistics dt{background-image:url(<@jspEl 'img_ctx'/>/styles/images/left/statistics.png)}
		.leftsidebar_box dl dd:last-child{padding-bottom:10px}
	</style>
</head>
<body id="bg">
<%
	String action = $getParam(request, "action", "info");
	request.setAttribute("action", action);
%>
<c:choose>
	<c:when test="<@jspEl "action eq 'info'"/>">
		<%@include file="leftMenu/info.jsp"%>
	</c:when>
</c:choose>

<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/migrate/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript">
	$(".leftsidebar_box dt").css({"background-color":"#505050"});
	$(".leftsidebar_box dt img").attr("src","<@jspEl 'img_ctx'/>/styles/images/left/select_xl01.png");
	$(function(){
		$(".leftsidebar_box dd").hide();
		$(".leftsidebar_box dt").click(function(){
			$(".leftsidebar_box dt").css({"background-color":"#505050"})
			$(this).css({"background-color": "#4A8BC2"});
			$(this).parent().find('dd').removeClass("menu_chioce");
			$(".leftsidebar_box dt img").attr("src","<@jspEl 'img_ctx'/>/styles/images/left/select_xl01.png");
			$(this).parent().find('img').attr("src","<@jspEl 'img_ctx'/>/styles/images/left/select_xl.png");
			$(".menu_chioce").slideUp();
			$(this).parent().find('dd').slideToggle();
			$(this).parent().find('dd').addClass("menu_chioce");
		});
	})
	function ClassList(ClassID){
		if($("#c_"+ClassID).hasClass("selected")){
			//$("#c_"+ClassID).removeClass("");
		}
		else{
			$(".leftsidebar_box dd").removeClass("selected");
			$("#c_"+ClassID).addClass("selected");
			// $('#taglist_li').load('daoheAjax.asp?action=taglist&classID='+ClassID+'');
		}
		//$("#ClassIDlist").html(ClassID);
		//$("#ClassID").val(ClassID);
	}
</script>
</body>
</html>
