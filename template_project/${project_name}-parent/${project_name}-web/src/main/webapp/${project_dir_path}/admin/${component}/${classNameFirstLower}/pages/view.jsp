<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page import="${basepackage}.model.${className}" %>
<%@include file="/common/taglibs.jsp" %>
<up72:override name="head">
</up72:override>
<up72:override name="content">
	<%--<%@include file="../include/edit_nav.jsp" %>--%>

<div class="topNavNull"></div>
<div style="display:none" id="sel_district"></div>
<!--sel_district-->
        <div class="addinputInfo mt20">
            <ul>
                <#list table.notPkColumns?chunk(1) as row>
                    <li>
                        <#list row as column>
                            <#if !column.htmlHidden>
                                <p class="fl f15"><strong><%=${className}.ALIAS_${column.constantName}%></strong>:</p>
                                <p>
                                    <#if column.isDateTimeColumn>
                                        <@jspEl classNameFirstLower+"."+column.columnNameLower+"String"/>
                                    <#else>
                                        ${column.columnNameLower}
                                    </#if>
                                    <#if !column.nullable><span class="required">*</span></#if>
                                </p>
                                <div class="clear"></div>
                            </#if>
                        </#list>
                    </li>
                </#list>
            </ul>
        </div>

</up72:override>
<%@include file="../pageBase.jsp" %>