<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.up72.common.CommonUtils"%>
<%@include file="../../function.jsp"%>
<%@include file="../doBase.jsp"%>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="page" />
<jsp:setProperty name="${classNameFirstLower}" property="*" />

<%
	long [] ids = CommonUtils.paramUtils.getLongParameters(request,"items",0);
	if(CommonUtils.objectUtils.isNotEmpty(ids)){
		for(int i=0;i<ids.length;i++){
			$d.delete(${basepackage}.model.${className}.class, ids[i]);
		}
	}
	$redirect("./page.jsp",response);
%>