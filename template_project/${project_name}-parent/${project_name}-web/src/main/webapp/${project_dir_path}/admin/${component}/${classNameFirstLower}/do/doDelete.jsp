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
	try {
		Long id = ParamUtils.getLongParameter(request, "id", 0L);
		if (ObjectUtils.isNotEmpty(id)) {
			I${className}Service i${className}Service = (I${className}Service)ApplicationContextHolder.getBean("${classNameFirstLower}Service");
			i${className}Service.delete(id);
		}
		$redirect(request.getContextPath() + "/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=page", response);
	} catch (Exception e) {
		System.out.println(e.getMessage());
	}
%>