<%@page import="${basepackage}.model.*" %>

<#include "/macro.include"/> 
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<#list table.columns as column>
<#if column.htmlHidden>
<input type="hidden" id="${column.columnNameLower}" name="${column.columnNameLower}" value="<@jspEl classNameFirstLower+"."+column.columnNameLower/>"/>
</#if>
</#list>

<#list table.notPkColumns?chunk(1) as row>
<tr class="frmtr"> <#list row as column>
  <#if !column.htmlHidden>
  <th class="frmth"><label><%=${className}.ALIAS_${column.constantName}%>:</label></th>
  <td class="frmtd"><#if column.isDateTimeColumn>
    <input value="<@jspEl classNameFirstLower+"."+column.columnNameLower+"String"/>" onclick="WdatePicker({dateFmt:'<%=${className}.FORMAT_${column.constantName}%>'})" id="${column.columnNameLower}String" name="${column.columnNameLower}String"  maxlength="0" class="${column.validateString} txt_ipt ipt_over" />
    <#else>
    <form:input path="${column.columnNameLower}" id="${column.columnNameLower}" class="${column.validateString} input_txt" maxlength="${column.size}" />
    </#if>
    <#if !column.nullable><span class="required">*</span></#if><font color='red'>
    <form:errors path="${column.columnNameLower}"/>
    </font></td>
  </#if>
  </#list></tr>
</#list> 