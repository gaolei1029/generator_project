<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<#include "/macro.include"/> <#include "/custom.include"/>
<%@include file="../../../common/taglibs.jsp"%>
<%@page import="${basepackage}.model.*" %>
<#assign className = table.className> <#assign classNameFirstLower =
className?uncap_first>
<up72:override name="head">
	<script type="text/javascript"
		src="<c:url value="/scripts/extend.div.1.0.js"/>"></script>
	<script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/rest.js"></script>
	<link href="<@jspEl 'ctx'/>/scripts/grid/css/flexigrid.css"
		type="text/css" rel="stylesheet">
	<script type="text/javascript"
		src="<@jspEl 'ctx'/>/scripts/grid/flexigrid-source.js"></script>
</up72:override>
<up72:override name="content">
	<!--搜索-->
	<div class="up72_search">
		<form id="admin_${component}_${classNameFirstLower}_search_form"
			name="admin_${component}_${classNameFirstLower}_search_form"
			method="post" action="<@jspEl 'CTX'/>./page.jsp">
			<input id="method" name="method" type="hidden" value="page" />
			<div class="search_con">
				<#list table.columns as column> <#if !column.htmlHidden>
				<div class="search_txt"><spring:message code="${className}.ALIAS_${column.constantName}" />：
					<input type="text" id="${column.columnNameLower}"
						name="${column.columnNameLower}" class="input_text"
						value="<@jspEl '${classNameFirstLower}.${column.columnNameLower}'/>">
				</div>
				</#if> </#list>
				<div class="search_btn">
					<div class="input_button">
						<button name="btnU" type="submit"
							onclick="document.admin_${component}_${classNameFirstLower}_search_form.submit();" class="button"
							value="<spring:message code='SITE.OP.SEARCH' />">
							<span><spring:message code='SITE.OP.SEARCH' /></span>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--end搜索-->

	<form id="admin_${component}_${classNameFirstLower}_page_form"
		name="admin_${component}_${classNameFirstLower}_page_form"
		action="<@jspEl 'CTX'/>./page.jsp" method="post">

		<table id="${component}_${classNameFirstLower}_table">
			<thead>
				<tr>
					<th showColumn="checkbox" width="25">
						<input type="checkbox" id="checkall"
							onclick="setAllCheckboxState('items',this.checked);" />
					</th>
					<th showColumn="index" width="20">
						<spring:message code="${className}.ALIAS_TABLE" />
					</th>
					<th showColumn="option" width="30">
						<label>
							<spring:message code="SITE.OP" />
						</label>
					</th>
					<#list table.columns as column> <#if !column.htmlHidden>
					<th sortColumn="${column.sqlName}"
						showColumn="${column.columnNameLower}" width="50"><spring:message code="${className}.ALIAS_${column.constantName}" /></th>
					</#if> </#list>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="<@jspEl 'items'/>" var="item" varStatus="status">
					<tr>
						<td showColumn="checkbox">
							<input type="checkbox" id="items" name="items"
								value="<@jspEl 'item.' + table.pkColumn.columnNameLower/>"
								class="sel" tags="null">
						</td>
						<td showColumn="index">
							<@jspEl 'page.thisPageFirstElementNumber + status.index' />
						</td>
						<td showColumn="option">
							<a href="javascript:;"
								onclick="show('<@jspEl 'ctx' />./do.jsp?method=form&id=<@jspEl 'item.id' />','<spring:message code="${className}.ALIAS_TABLE" />',600)"
								class="sysiconBtnNoIcon"><spring:message code='SITE.OP.EDIT' /></a>&nbsp;
						</td>
						<#list table.columns as column> <#if !column.htmlHidden>
						<td showColumn="${column.columnNameLower}">
							<#rt> <#compress> <#if column.isDateTimeColumn>
							<fmt:formatDate value="<@jspEl " item."+column.columnNameLower+"Date"/>
							" pattern="yyyy-MM-dd"/>&nbsp; <#else>
							<c:out value='<@jspEl "item."+column.columnNameLower/>' />
							&nbsp; </#if> </#compress> <#lt>
						</td>
						</#if> </#list>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<pg:pager items="<@jspEl 'pagination.totalRecord'/>"
			maxPageItems="<@jspEl 'pagination.range'/>"
			maxIndexPages="<@jspEl 'pagination.maxIndexPages'/>" isOffset="true"
			url="<@jspEl 'ctx'/>./do.jsp" export="currentPageNumber=pageNumber"
			scope="request">
			<pg:param name="range" />
			<pg:param name="maxIndexPages" />
			<pg:param name="method" />

			<pg:param name="searchColumn" />
			<pg:param name="searchColumnValue" />
		  
		   <#list table.columns as column>
			<#if !column.htmlHidden>
		   <pg:param name="${column.columnNameLower}" />
			</#if>
		   </#list>
		   
			<jsp:include page="../../../common/page/bar.jsp" flush="true" /><spring:message
				code="SITE.PAGE.STYLE1" arguments="<@jspEl 'pagination.totalRecord'/>" />
		</pg:pager>
	</form>

	<script type="text/javascript">
	// 表格列表处理
	$('#${component}_${classNameFirstLower}_table').flexigrid({
		height: 300,
		striped : true,
		buttons : [
			{name: "添加", bclass: "addorder", onpress : function(){show("<@jspEl 'ctx'/>./do.jsp?method=form","<spring:message code="${className}.ALIAS_TABLE" />添加",600)}},
			{name: '删除', bclass: 'delete', onpress : function(){doRestEdit({confirmMsg:'确认删除选中的记录吗？',url:'<@jspEl 'ctx'/>./do.jsp?method=del',batchBox:'items',boxCon:'#admin_${component}_${classNameFirstLower}_page_form',form:'#admin_${component}_${classNameFirstLower}_page_form',method:'delete'})}}
		]
	});
</script>
</up72:override>
<%@include file="../pageBase.jsp"%>