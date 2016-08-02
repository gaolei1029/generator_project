<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<up72:override name="head">
</up72:override>
<up72:override name="content">
	<%--<%@include file="../include/nav.jsp" %>--%>
<div class="topNav">
	<form name="${component}_${classNameFirstLower}_search_form"
	      id="${component}_${classNameFirstLower}_search_form" method="post" action="">
		<#list table.columns as column>
			<#if !column.htmlHidden>
				<%=${className}.ALIAS_${column.constantName}%>：
				<input type="text" id="${column.columnNameLower}" name="${column.columnNameLower}"
				       class="input_text" value="<@jspEl 'query.${column.columnNameLower}'/>">
			</#if>
		</#list>
		<input type="submit" name="querySubmitButton" value=" 搜索 ">
		<a href="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=edit">添加</a>
	</form>
</div>

<form name="check" id="" method="post">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="stripe Tabmember">
		<tr>
			<th width="50" height="38">选择</th>
			<#list table.columns as column>
			<#if !column.htmlHidden>
			<th><%=${className}.ALIAS_${column.constantName}%></th>
			</#if>
			</#list>
			<th class="thNoRight">操作</th>
		</tr>
		<c:forEach items="<@jspEl '${classNameFirstLower}s'/>" var="item" varStatus="status">
		<tr>
			<td height="38">
				<input name="ids" type="checkbox" value="<@jspEl 'item.' + table.pkColumn.columnNameLower/>" id="choose<@jspEl 'item.' + table.pkColumn.columnNameLower/>"/>
			</td>
			<#list table.columns as column>
			<#if !column.htmlHidden>
			<td><#rt>
				<#compress>
				<#if column.isDateTimeColumn>
				<fmt:formatDate value="<@jspEl "item."+column.columnNameLower+"Date"/>" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;
				<#else>
				<c:out value='<@jspEl "item."+column.columnNameLower/>'/>&nbsp;
				</#if>
				</#compress><#lt>
			</td>
			</#if>
			</#list>
			<td>
				<a href="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=edit&id=<@jspEl 'item.' + table.pkColumn.columnNameLower/>">修改</a> |
				<a href="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=view&id=<@jspEl 'item.' + table.pkColumn.columnNameLower/>">查看</a> |
				<a onclick="{if(confirm('确定将本条数据恢复吗?')){return true;}return false;};" href="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp?method=doDelete&id=<@jspEl 'item.' + table.pkColumn.columnNameLower/>">删除</a>
			</td>
		</tr>
		<%--<tr id="s_<@jspEl 'status.index+1'/>" style="display: none;">--%>
			<%--<td colspan="11" class="left">--%>
				<%--<div id="TestInfo_<@jspEl 'status.index+1'/>"></div>--%>
			<%--</td>--%>
		<%--</tr>--%>
		</c:forEach>
		<tr>
			<td height="30" colspan="11" class="left ml10">
				<input type="button" value="全选" onclick="selectAll(document.check)" class="in"/> &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="反选" onclick="selectOther(document.check)" class="in"/> &nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
	</table>
</form>
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
