<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/function.jsp"%>
<%@ page import="java.util.*,com.up72.framework.util.*,com.up72.framework.util.page.*" %>
<%@ page import="${basepackage}.model.${className}" %>
<%@include file="../../service/${component}Service.jsp"%>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="page" />
<%
  // TODO 此处自行编辑获取页面参数
  int limit = ParamUtils.getIntParameter(request, "limit", 20);
  int pageNumber = ParamUtils.getIntParameter(request, "pageNumber", 0);

  Map<String,Object> params = new HashMap<String, Object>();

  // TODO 在此将页面获取的参数放入名称为params的Map中
  PageBounds pageBounds = new PageBounds(pageNumber, limit, true);
//  pageBounds.setOrders(Order.formString("id.asc,userName.desc"));

  Page<${className}> ${classNameFirstLower}s =  ${r"$"}${classNameFirstLower}Service().getPage(params, pageBounds);
  request.setAttribute("${classNameFirstLower}s",${classNameFirstLower}s.getResult());
  request.setAttribute("pagination", ${classNameFirstLower}s.getPagination());
   request.setAttribute("${classNameFirstLower}", ${classNameFirstLower});

  $forward("../pages/page.jsp", request, response);
%>
