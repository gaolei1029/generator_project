<%@page import="${basepackage}.model.*" %>

<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="up72_show">
  <table cellspacing="0" cellpadding="0" border="0" width="100%" class="show_table">
    <#list table.notPkColumns?chunk(2) as row>
    <tr class="frmtr"> <#list row as column>
      <#if !column.htmlHidden>
      <th class="frmth"><%=${className}.ALIAS_${column.constantName}%>：</th>
      <td class="frmtd"><#rt>
        <#compress>
        <#if column.isDateTimeColumn>
        <c:out value='<@jspEl classNameFirstLower+"."+column.columnNameLower+"String"/>'/>
        <#else>
        <c:out value='<@jspEl classNameFirstLower+"."+column.columnNameLower/>'/>
        </#if>
        </#compress>
        <#lt></td>
      </#if>
      </#list></tr>
    </#list>
  </table>
</div>
