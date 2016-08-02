<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.up72.page.Pagination"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.up72.page.QueryResult"%>
<%@page import="com.up72.common.CommonUtils"%>
<%@include file="../../function.jsp"%>
<%@include file="../doBase.jsp"%>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="page" />
<jsp:setProperty name="${classNameFirstLower}" property="*" />

<%
	//分页
	int range = CommonUtils.paramUtils.getIntParameter(request, "range", 10);//单页数据
	int start = CommonUtils.paramUtils.getIntParameter(request, "pager.offset", 0);//数据开始值
	String searchColumn = CommonUtils.paramUtils.getParameter(request, "searchColumn", "");
	String searchColumnValue = CommonUtils.paramUtils.getParameter(request, "searchColumnValue", "");
	//分页
	//查询
	String hql = "from ${basepackage}.model.${className} where 1 = 1";
	HashMap<String ,Object> params = new HashMap<String, Object>();
	<#list table.columns as column>
    if(CommonUtils.objectUtils.isNotEmpty(${classNameFirstLower}.get${column.columnName}())) {
		params.put(" ${column.columnNameLower}", ${classNameFirstLower}.get${column.columnName}());
    }
	 </#list>
	QueryResult queryResult = $d.findPage(hql,params,new Pagination(start,range)); 
	request.setAttribute("${classNameFirstLower}",${classNameFirstLower});
	request.setAttribute("pagination",queryResult.getPagination());
	request.setAttribute("items",queryResult.getItems());
	request.setAttribute("searchColumn",searchColumn);
	request.setAttribute("searchColumnValue",searchColumnValue);
	$forward("../pages/page.jsp",request,response);
%>