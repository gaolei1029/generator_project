<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp" %>
<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<dl>
	<dt><span class="icoLeft"></span>表单型</dt>
	<dd id="c_1"><a onclick="ClassList('1');" href="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=page" target="main">列表</a></dd>
	<dd id="c_2"><a onclick="ClassList('2');" href="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=add" target="main">添加</a></dd>
</dl>