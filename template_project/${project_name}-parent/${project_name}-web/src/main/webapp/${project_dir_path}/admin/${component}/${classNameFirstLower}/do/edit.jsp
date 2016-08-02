<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page import="com.up72.framework.util.*" %>
<%@ page import="${basepackage}.service.I${className}Service" %>
<%@ page import="com.up72.framework.util.holder.ApplicationContextHolder" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="page" />
<jsp:setProperty name="${classNameFirstLower}" property="*" />
<%@include file="/common/function.jsp" %>
<%
	if (ObjectUtils.isNotEmpty(${classNameFirstLower}.getId())) {
		I${className}Service i${className}Service = (I${className}Service) ApplicationContextHolder.getBean("${classNameFirstLower}Service");
		${classNameFirstLower} = i${className}Service.getById(${classNameFirstLower}.getId());
	}
	request.setAttribute("${classNameFirstLower}", ${classNameFirstLower});
	$forward("../pages/edit.jsp", request, response);
%>
