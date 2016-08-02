<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.up72.common.CommonUtils"%>
<%@include file="../../function.jsp"%>
<%@include file="../doBase.jsp"%>
<%@ page trimDirectiveWhitespaces="true" %>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="page" />
<jsp:setProperty name="${classNameFirstLower}" property="*" />

<%
	if(CommonUtils.objectUtils.isNotEmpty(${classNameFirstLower}.getId())){
		request.setAttribute("${classNameFirstLower}",$d.get(${basepackage}.model.${className}.class,${classNameFirstLower}.getId()));
	}
	$forward("../pages/view.jsp",request,response);
%>