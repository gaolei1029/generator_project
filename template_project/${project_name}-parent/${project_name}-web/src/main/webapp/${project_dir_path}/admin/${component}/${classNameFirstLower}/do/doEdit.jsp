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
		boolean isAllowEdit = $validate(${classNameFirstLower}, request);
		if(!isAllowEdit){
			request.setAttribute("${classNameFirstLower}", ${classNameFirstLower});
			$forward("../pages/edit.jsp", request, response);
			return;
		}
		I${className}Service i${className}Service = (I${className}Service) ApplicationContextHolder.getBean("${classNameFirstLower}Service");
		if(ObjectUtils.isNotEmpty(${classNameFirstLower}.getId())){
			i${className}Service.update(${classNameFirstLower});
		}else{
			i${className}Service.save(${classNameFirstLower});
		}
		$redirect(request.getContextPath() + "/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=page",response);
	}catch (Exception e){
		System.out.println(e.getMessage());
	}
%>