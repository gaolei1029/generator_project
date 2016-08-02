<%@page import="${basepackage}.model.*" %>
<%@ include file="/common/taglibs.jsp" %>

<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/uptabs.js"></script>
<%
String id = request.getParameter("id");
%>
<div id="TabDemo_<%= id%>" class="infoContent">
  <!-- tab start -->
  <div class="up72_tabs">
  	<div class="tabs_con">
  	  <span rel="<@jspEl 'ctx'/>/${component}/${classNameFirstLower}/<%=id %>/tabShow"><a href="javascript:;">基本信息</a></span>
      <span rel="<@jspEl 'ctx'/>/${component}/${classNameFirstLower}/<%=id %>/tabEdit"><a href="javascript:;">编辑</a></span>
    </div>
  </div>
  <!-- tab end --> 
</div>
<script type="text/javascript">
	$("#TabDemo_<%= id%>").find(".tabs_con span").up72Tabs(
		"#TabDemo_<%= id%>",
		{
			selCss : "uncur",
			showCss : "tabs"
		}
	);
</script>