<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<@jspEl 'css_ctx'/>/styles/css/style.css" rel="stylesheet" type="text/css">
	<link href="<@jspEl 'css_ctx'/>/styles/css/jq.css" rel="stylesheet" type="text/css">
	<link href="<@jspEl 'css_ctx'/>/styles/css/Ajax.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/migrate/jquery-migrate-1.2.1.js"></script>
	<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery.base.js"></script>
	<up72:block name="head"/>
</head>

<body>
<div class="theme-change">
	<up72:block name="content"/>
</div>
</body>
</html>