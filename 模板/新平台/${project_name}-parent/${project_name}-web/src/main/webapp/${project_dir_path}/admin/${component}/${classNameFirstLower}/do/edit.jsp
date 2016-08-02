<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/function.jsp"%>
<%@ page import="com.up72.framework.util.*" %>
<%@include file="../../service/${component}Service.jsp"%>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="page" />
<jsp:setProperty name="${classNameFirstLower}" property="*" />
<%
	if (ObjectUtils.isNotEmpty(${classNameFirstLower}.getId())) {
		${classNameFirstLower} = ${r"$"}${classNameFirstLower}Service().getById(${classNameFirstLower}.getId());
	}
	request.setAttribute("${classNameFirstLower}", ${classNameFirstLower});
	$forward("../pages/edit.jsp", request, response);
%>
