<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
	<ul class="addinput">
	<input type="hidden" name="id" id="id" value="<@jspEl classNameFirstLower+"."+table.pkColumn.columnNameLower/>" />
	<#list table.notPkColumns?chunk(1) as row>
			<li>
				<#list row as column>
					<#if !column.htmlHidden>
						<span><#if !column.nullable><i class="cRed">*</i></#if><%=${className}.ALIAS_${column.constantName}%>：</span>
							<#if column.isDateTimeColumn>
								<input type="text" value="<@jspEl classNameFirstLower+"."+column.columnNameLower+"String"/>" onclick="WdatePicker({dateFmt:'<%=${className}.FORMAT_${column.constantName}%>'})" id="${column.columnNameLower}String" name="${column.columnNameLower}String"   maxlength="${column.size}" class="s1 ${column.validateString}" />
								<#else>
									<input type="text"  value="<@jspEl classNameFirstLower+"."+column.columnNameLower/>"  name="${column.columnNameLower}" id="${column.columnNameLower}" class="s1 ${column.validateString}" maxlength="${column.size}" size="${column.size}" placeholder="<%=${className}.ALIAS_${column.constantName}%>" />
							</#if>
							<p class="cGray" id="${column.columnNameLower}Error"></p>
					</#if>
				</#list>
			</li>
	</#list>
		<li class="fl lin wb90"><input type="submit" value="保存" name="B1" class="button_post"></li>
	</ul>