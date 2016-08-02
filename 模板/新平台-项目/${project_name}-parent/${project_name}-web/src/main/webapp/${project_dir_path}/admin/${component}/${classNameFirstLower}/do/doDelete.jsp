<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp"%>
<%@include file="/common/function.jsp"%>
<%@ page import="com.up72.framework.util.*,com.up72.framework.dto.Result" %>
<%@include file="../../service/${component}Service.jsp"%>

<%
	final long [] ids = ParamUtils.getLongParameters(request, "items", 0);
	Result result  = Result.build(new Result.Command<String>(){
		@Override
		public String execute() {
			if (ObjectUtils.isNotEmpty(ids)) {
				for(int i=0;i<ids.length;i++){
					${r"$"}${classNameFirstLower}Service().delete(ids[i]);
				}
			}
			return $MSG_DEL_SUCCESS;
		}
	});
	out.print($json(result));
	out.flush();
%>