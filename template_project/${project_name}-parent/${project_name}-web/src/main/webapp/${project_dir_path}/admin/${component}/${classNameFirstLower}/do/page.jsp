<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page import="com.up72.framework.util.*" %>
<%@ page import="${basepackage}.service.I${className}Service" %>
<%@ page import="com.up72.framework.util.holder.ApplicationContextHolder" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.up72.framework.util.page.PageList" %>
<%@ page import="com.up72.framework.util.page.Page" %>
<%@ page import="${basepackage}.model.${className}" %>
<%@ page import="com.up72.framework.util.page.PageBounds" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/function.jsp" %>
<%
  // TODO 此处自行编辑获取页面参数


  int limit = ParamUtils.getIntParameter(request, "limit", 2);
  int pageNumber = ParamUtils.getIntParameter(request, "pageNumber", 0);

  I${className}Service i${className}Service = (I${className}Service) ApplicationContextHolder.getBean("${classNameFirstLower}Service");

  Map<String,Object> params = new HashMap<String, Object>();

  // TODO 在此将页面获取的参数放入名称为params的Map中


  Page<${className}> ${classNameFirstLower}s =  i${className}Service.getPage(params, new PageBounds(pageNumber, limit, true));
  request.setAttribute("${classNameFirstLower}s",${classNameFirstLower}s.getResult());
  request.setAttribute("pagination", ${classNameFirstLower}s.getPagination());

  $forward("../pages/page.jsp", request, response);
%>
