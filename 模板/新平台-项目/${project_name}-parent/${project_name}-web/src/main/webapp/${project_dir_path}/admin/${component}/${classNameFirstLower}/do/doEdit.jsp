<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/function.jsp"%>
<%@ page import="com.up72.framework.util.*,${basepackage}.model.*,com.up72.framework.dto.Result" %>
<%@include file="../../service/${component}Service.jsp"%>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="page" />
<jsp:setProperty name="${classNameFirstLower}" property="*" />
<%
//	boolean isAllowEdit = $validate(${classNameFirstLower}, request);
//	if(!isAllowEdit){
//		request.setAttribute("${classNameFirstLower}", ${classNameFirstLower});
//		$forward("../pages/edit.jsp", request, response);
//		return;
//	}

	final ${className} ${classNameFirstLower?substring(0,1)} = ${classNameFirstLower};
	Result result  = Result.build(new Result.Command<Object>(){
		@Override
		public Object execute() {
			Map map = $validateErrors(${classNameFirstLower?substring(0,1)}, request);
			if(ObjectUtils.isEmpty(map)){
				${r"$"}${classNameFirstLower}Service().update(${classNameFirstLower?substring(0,1)});
				return $MSG_EDIT_SUCCESS;
			}else{
				return map;
			}
		}
	});
	out.print($json(result));
	out.flush();
%>