<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<up72:override name="head">
<title><%=${className}.TABLE_ALIAS%> 维护</title>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/layer/layer.js?v=<@jspEl 'v'/>"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/common.js?v=<@jspEl 'v'/>"></script>
<script>
	function ${classNameFirstLower}_del(){
		var items = $("input[name=items]:checked");
		if(items.length == 0){
			layer.tips('请勾选记录', '#del_button', {
				tips: [1, '#78BA32']
			});
			return;
		}
		layer.confirm('确认删除此数据？', {
			btn: ['确认','取消']
		}, function(){
			$.getJson("?method=doDelete",$("#${component}_${classNameFirstLower}_page_form").serialize(),function(json){
				layer.msg(json.data, {icon: 1, shade: 0.6},function(){window.location.reload(true);});
			});
		});
	}
</script>
</up72:override>
<up72:override name="content">
	<div class="top-title"><h5><%=${className}.TABLE_ALIAS%></h5></div>
	<div class="top-nav-list">
		<ul class="clearfix" id="tab">
			<li class="cur fl tc"><%=${className}.TABLE_ALIAS%></li>
		</ul>
	</div>
	<div class="clear"></div>
	<div class="search-t">
		<form name="${component}_${classNameFirstLower}_search_form" id="${component}_${classNameFirstLower}_search_form" method="get">
			<#list table.columns as column>
				<#if !column.htmlHidden>
					<%=${className}.ALIAS_${column.constantName}%>：
					<input type="text" id="${column.columnNameLower}" name="${column.columnNameLower}" class="s1 gray" value="<@jspEl 'pageParams[\'${column.columnNameLower}\']'/>"><#if ((column_index+1) != (table.columns)?size)>　</#if>
				</#if>
			</#list>
			　<input type="submit"  class="button_search" name="Submit" value="搜索">　
			<input type="button" onClick="window.location='?method=add'" value="添加" name="Submit" class="button_add">
		</form>
	</div>
	<form name="${component}_${classNameFirstLower}_page_form" id="${component}_${classNameFirstLower}_page_form" method="post">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="stripe Tabmember">
		<tr>
			<th width="50" height="38"><input type="checkbox"   onclick="selectOrClearAll(this)" class="ng-valid ng-dirty"></th>
			<#list table.columns as column>
				<#if !column.htmlHidden>
					<th><%=${className}.ALIAS_${column.constantName}%></th>
				</#if>
			</#list>
			<th>操作</th>
		</tr>

		<c:forEach items="<@jspEl '${classNameFirstLower}s'/>" var="item" varStatus="status">
		<tr>
			<td height="38"><input type="checkbox"  value="<@jspEl 'item.id'/>" data-ng-model="item.selected" name="items" id="items" class="ng-pristine ng-valid"></td>
			<#list table.columns as column>
				<#if !column.htmlHidden>
					<td><#rt>
						<#compress>
							<#if column.isDateTimeColumn>
								<fmt:formatDate value="<@jspEl "item."+column.columnNameLower+"Date"/>" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;
								<#else>
									<#if ((column_index) == 1)>
										<a href="?method=view&id=<@jspEl 'item.id'/>"><c:out value='<@jspEl "item."+column.columnNameLower/>'/>&nbsp;</a>
										<#else>
										<c:out value='<@jspEl "item."+column.columnNameLower/>'/>&nbsp;
									</#if>
							</#if>
						</#compress><#lt>
					</td>
				</#if>
			</#list>
			<td><a href="?method=view&id=<@jspEl 'item.id'/>">查看</a>&nbsp;|&nbsp;<a href="?method=edit&id=<@jspEl 'item.id'/>">修改</a>&nbsp;</td>
		</tr>
		</c:forEach>
		<tr>
		</tr>
	</table>
	<!---------------------列表结束----------------------------->
	<div class="ml15 fl mt20">
		<input type="checkbox"   onclick="selectOrClearAll(this)"  name="checkbox_items">
		<input type="button"  value="删除" onclick="${classNameFirstLower}_del();" name="del_button" id="del_button" class="button_del">　
	</div>
	<pg:pager
			items="<@jspEl 'pagination.totalCount'/>"
			maxPageItems="<@jspEl 'pagination.limit'/>"
			maxIndexPages="10"
			isOffset="<%= true %>"
			url="./do.jsp"
			export="currentPageNumber=pageNumber"
			scope="request">
		<!-- TODO 此处加分页所需参数 -->
		<jsp:include page="/common/page/pageBar.jsp" flush="true" />
	</pg:pager>
</form>
</up72:override>
<%@include file="../pageBase.jsp" %>
