<%@page import="${basepackage}.model.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<#include "/macro.include"/> 
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="up72_edit">
  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="edit_table">
    <#list table.columns as column>
    <#if !column.htmlHidden>
    <tr class="frmtr">
      <th class="frmth"><label><%=${className}.ALIAS_${column.constantName}%>：</label></th>
      <td class="frmtd"><#if column.isDateTimeColumn>
        <input onclick="WdatePicker({dateFmt:'<%=${className}.FORMAT_${column.constantName}%>'})" id="${column.columnNameLower}String" name="${column.columnNameLower}String"  maxlength="0" class="${column.validateString} input_txt" />
        <#else>
        <input id="${column.columnNameLower}" class="${column.validateString} input_txt" maxlength="${column.size}" />
        </#if>
        <#if !column.nullable><span class="required">*</span></#if> </td>
    </tr>
    </#if>
    </#list>
  </table>
</div>
