<%@page import="${basepackage}.model.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="up72_show">
  <table cellspacing="0" cellpadding="0" border="0" width="100%" class="show_table">
    <#list table.notPkColumns?chunk(1) as row>
    <tr class="frmtr"> <#list row as column>
      <#if !column.htmlHidden>
      <th class="frmth"><%=${className}.ALIAS_${column.constantName}%>：</th>
      <td class="frmtd"><#rt>
        <#compress>
        <#if (((column.columnNameLower)?index_of("Time")) > 0)>
        <fmt:formatDate value="<@jspEl classNameFirstLower+"."+column.columnNameLower+"Date"/>"/>
        <#elseif column.isDateTimeColumn>
        <fmt:formatDate value="<@jspEl classNameFirstLower+"."+column.columnNameLower/>"/>
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
