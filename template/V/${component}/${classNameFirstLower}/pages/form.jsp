<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<#include "/macro.include"/> 
<#include "/custom.include"/> 
<%@include file="../../../common/taglibs.jsp"%>
<%@page import="${basepackage}.model.*" %>
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<jsp:useBean id="${classNameFirstLower}" class="${basepackage}.model.${className}" scope="request" />
<script src="<@jspEl 'ctx'/>/scripts/validate/jquery.validate.min.js" type="text/javascript"></script>
<script src="<@jspEl 'ctx'/>/scripts/validate/messages_cn.js" type="text/javascript"></script>
<script src="<@jspEl 'ctx'/>/scripts/validate/jquery.metadata.js" type="text/javascript"></script>
<script src="<@jspEl 'ctx'/>/scripts/validate/validate.extend.js" type="text/javascript"></script>

<div class="up72_edit">
<form id="${component}_${classNameFirstLower}_edit_form" action="<@jspEl 'ctx'/>./edit.jsp" method="post">

<#list table.columns as column>
<#if column.htmlHidden>
	<input type="hidden" id="${column.columnNameLower}" name="${column.columnNameLower}" value="<@jspEl classNameFirstLower+"."+column.columnNameLower/>"/>
</#if>
</#list>

<%//=$select("categoryId",$d.find("select id,name from Category"),String.valueOf(${classNameFirstLower}.getCategoryId()))%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="edit_table">
<#list table.notPkColumns?chunk(1) as row>
	 <tr class="pb_frmtr">
	 <#list row as column>
		<#if !column.htmlHidden>
		<th class="pb_frmth"><label><spring:message code="${className}.ALIAS_${column.constantName}" />:</label></th>	
		 <td class="pb_frmtd">
		<#if column.isDateTimeColumn>
		<input value="<@jspEl classNameFirstLower+"."+column.columnNameLower+"String"/>" onclick="WdatePicker({dateFmt:'<%=${className}.FORMAT_${column.constantName}%>'})" id="${column.columnNameLower}String" name="${column.columnNameLower}String"  maxlength="0" class="${column.validateString} txt_ipt ipt_over" />
		<#else>
		<input value="<@jspEl classNameFirstLower+"."+column.columnNameLower/>" name="${column.columnNameLower}" id="${column.columnNameLower}" class="${column.validateString} txt_ipt ipt_over" maxlength="${column.size}" />
		</#if>
		<#if !column.nullable><span class="required">*</span></#if>
		</td>
	</#if>
	</#list>
	</tr>	
</#list>
</table>
<div class="up72_submit">
	<div class="btn btn_sub" title="<spring:message code='SITE.BUTTON.SUBMIT' />">
		<input id="submitButton" name="submitButton" type="submit" value="<spring:message code='SITE.BUTTON.SUBMIT' />" />
	</div>
	<div class="btn btn_cel" title="<spring:message code='SITE.BUTTON.RESET' />">
		<input type="reset" id="reset_button" value="<spring:message code='SITE.BUTTON.RESET' />" />
	</div>
	<div class="btn btn_cel" title="<spring:message code='SITE.BUTTON.CANCEL' />">
		<input type="button" id="reset_button" value="<spring:message code='SITE.BUTTON.CANCEL' />" onclick="closeBox();" />
	</div>
</div>
</form>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#${component}_${classNameFirstLower}_edit_form").validate({
				errorPlacement: function(error, element) {
					error.appendTo(element.parent());
				}
		});	
	});
</script>