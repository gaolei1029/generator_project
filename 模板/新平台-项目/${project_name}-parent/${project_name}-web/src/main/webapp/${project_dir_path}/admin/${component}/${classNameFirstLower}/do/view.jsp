<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/function.jsp"%>
<%@ page import="com.up72.framework.util.*" %>
<%@include file="../../service/${component}Service.jsp"%>
<%@ page import="${basepackage}.model.${className}" %>
<%
    Long id = ParamUtils.getLongParameter(request, "id", 0L);
    if (ObjectUtils.isNotEmpty(id)){
        ${className} ${classNameFirstLower} = ${r"$"}${classNameFirstLower}Service().getById(id);
        request.setAttribute("${classNameFirstLower}", ${classNameFirstLower});
    }
    $forward("../pages/view.jsp", request, response);
%>
