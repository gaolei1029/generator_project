<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
	<ul class="addinput">
	<input type="hidden" name="id" id="id" value="<@jspEl 'classNameFirstLower.' + table.pkColumn.columnNameLower/>"/>
	<#list table.notPkColumns?chunk(1) as row>
		<li>
			<#list row as column>
				<#if !column.htmlHidden>
					<p class="fl f15"><strong><%=${className}.ALIAS_${column.constantName}%></strong>:</p>
					<p>
						<#if column.isDateTimeColumn>
							<input value="<@jspEl classNameFirstLower+"."+column.columnNameLower+"String"/>" onclick="WdatePicker({dateFmt:'<%=${className}.FORMAT_${column.constantName}%>'})" id="${column.columnNameLower}String" name="${column.columnNameLower}String"  maxlength="0" class="${column.validateString} txt_ipt ipt_over" />
						<#else>
							<form:input path="${column.columnNameLower}" id="${column.columnNameLower}" class="${column.validateString} input_txt" maxlength="${column.size}" size="${column.size}" placeholder="" />
						</#if>
						<#if !column.nullable><span class="required">*</span></#if>
						<font color='red'>
							<form:errors path="${column.columnNameLower}"/>
						</font>
						<span><label id="${column.columnNameLower}Error"><@jspEl "errors['${column.columnNameLower}']"/></label></span>
					</p>
					<div class="clear"></div>
				</#if>
			</#list>
		</li>
	</#list>
		<li style="padding-left: 56px;">
			<input type="submit" value=" 提交数据 " name="submitButton" class="in">
		</li>
	</ul>