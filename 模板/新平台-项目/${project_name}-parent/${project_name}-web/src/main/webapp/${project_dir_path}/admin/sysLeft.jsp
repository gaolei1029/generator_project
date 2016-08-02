<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp" %>
<%@include file="/common/function.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<link type="text/css" rel="stylesheet" href="<@jspEl 'css_ctx'/>/adminStyles/css/left.css?v=<@jspEl 'v'/>" />
	<link type="text/css" rel="stylesheet" href="<@jspEl 'css_ctx'/>/adminStyles/css/skin_black.css?v=<@jspEl 'v'/>" />
	<title>左侧导航</title>
</head>
<body>
<div class="container">
	<div class="leftsidebar_box">
<%
	String action = $getParam(request, "action", "info");
	request.setAttribute("action", action);
%>
<c:choose>
	<c:when test="<@jspEl "action eq 'info'"/>">
		<%@include file="leftMenu/info.jsp"%>
	</c:when>
</c:choose>
	</div>
</div>

<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/jquery-1.11.2.min.js"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/migrate/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript">
	$(".leftsidebar_box dt").addClass("leftParent");
	$(".leftsidebar_box dt img").attr("src","<@jspEl 'img_ctx'/>/adminStyles/images/left/select_xl01.png");
	$(function(){
		$(".leftsidebar_box dd").hide();
		$(".leftsidebar_box dt").click(function(){
			$(".leftsidebar_box dt").addClass("leftParent");
			$(this).addClass("leftParentClick");
			$(this).parent().find('dd').removeClass("menu_chioce");
			$(".leftsidebar_box dt img").attr("src","<@jspEl 'img_ctx'/>/adminStyles/images/left/select_xl01.png");
			$(this).parent().find('img').attr("src","<@jspEl 'img_ctx'/>/adminStyles/images/left/select_xl.png");
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
