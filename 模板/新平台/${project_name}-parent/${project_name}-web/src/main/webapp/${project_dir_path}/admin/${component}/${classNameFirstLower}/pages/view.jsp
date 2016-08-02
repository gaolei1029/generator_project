<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page import="${basepackage}.model.${className}" %>
<%@include file="/common/taglibs.jsp" %>
<up72:override name="head">
    <title><%=${className}.TABLE_ALIAS%> 查看</title>
</up72:override>
<up72:override name="content">
        <div class="top-title"><h5><%=${className}.TABLE_ALIAS%></h5></div>
        <div class="top-nav-list">
            <ul id="tab" class="clearfix">
                <li class="cur fl tc"><%=${className}.TABLE_ALIAS%></li>
            </ul>
        </div>
        <div class="clear"></div>

        <div class="mt15"></div>
        <div class="clear"></div>
        <div class="search_t">
            <font class="f15 mb10"><%=${className}.TABLE_ALIAS%></font>
            <ul class="addinput">
                <#list table.notPkColumns?chunk(1) as row>
                    <li>
                        <#list row as column>
                            <#if !column.htmlHidden>
                                 <span><%=${className}.ALIAS_${column.constantName}%>：</span>
                                <p>
                                    <#if column.isDateTimeColumn><@jspEl classNameFirstLower+"."+column.columnNameLower+"String"/>
                                        <#else><@jspEl classNameFirstLower+"."+column.columnNameLower/>
                                    </#if>
                                </p>
                            </#if>
                        </#list>
                    </li>
                </#list>
            </ul>
        </div>
</up72:override>
<%@include file="../pageBase.jsp" %>