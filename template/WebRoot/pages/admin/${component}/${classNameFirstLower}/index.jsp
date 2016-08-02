<%@page import="${basepackage}.model.*" %>

<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<up72:override name="head">
  <title><%=${className}.TABLE_ALIAS%> 维护</title>
  <script src="<@jspEl 'ctx'/>/scripts/rest.js" ></script>
  <link href="<@jspEl 'ctx'/>/scripts/simpletable/simpletable.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/simpletable/simpletable.js"></script> 
  <script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/columnshow.js"></script>
  <link href="<@jspEl 'ctx'/>/scripts/grid/css/flexigrid.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/grid/flexigrid-source.js"></script> 
  <script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('admin_${component}_${classNameFirstLower}_search_form',<@jspEl 'page.thisPageNumber'/>,<@jspEl 'page.pageSize'/>,'<@jspEl 'pageRequest.sortColumns'/>');
		});
	</script> 
  <script type="text/javascript" src="<c:url value="/scripts/extend.div.1.0.js"/>"></script> 
</up72:override>
<up72:override name="content"> 
  <!--当前位置-->
  <div class="head_content">
    <div class="navBar"> » <a class="" href="<@jspEl 'ctx'/>/admin/${component}/${classNameFirstLower}/"><%=${className}.TABLE_ALIAS%>管理</a> </div>
  </div>
  <!--end当前位置--> 
  <!--搜索-->
  <div class="up72_search">
    <form id="admin_${component}_${classNameFirstLower}_search_form" name="admin_${component}_${classNameFirstLower}_search_form" method="get">
      <div class="search_con"> <#list table.columns as column>
        <#if !column.htmlHidden>
        <div class="search_txt"><%=${className}.ALIAS_${column.constantName}%>：
          <input type="text" id="${column.columnNameLower}" name="${column.columnNameLower}" class="input_text" value="<@jspEl 'query.${column.columnNameLower}'/>">
        </div>
        </#if>
        </#list>
        <div class="search_btn">
          <div class="input_button">
            <button name="btnU" type="submit" onclick="$(this).parents('form').submit();" class="button" value="查询"><span>查询</span></button>
          </div>
        </div>
      </div>
    </form>
  </div>
  <!--end搜索-->
  
  <form id="admin_${component}_${classNameFirstLower}_page_form" name="admin_${component}_${classNameFirstLower}_page_form" method="get">
    <table id="admin_${component}_${classNameFirstLower}_table">
      <thead>
        <tr>
          <th showColumn="checkbox" width="25"><input type="checkbox" id="checkall" onclick="setAllCheckboxState('items',this.checked);" /></th>
          <th showColumn="index" width="20">序号</th>
          <th showColumn="option" width="30"><label>操作</label></th>
          <#list table.columns as column>
          <#if !column.htmlHidden>
          <th sortColumn="${column.sqlName}" showColumn="${column.columnNameLower}" width="50"><%=${className}.ALIAS_${column.constantName}%></th>
          </#if>
          </#list> </tr>
      </thead>
      <tbody>
        <c:forEach items="<@jspEl 'page.result'/>" var="item" varStatus="status">
          <tr rel="<@jspEl 'ctx'/>/pages/admin/${component}/${classNameFirstLower}/tab.jsp?id=<@jspEl 'item.' + table.pkColumn.columnNameLower/>">
            <td showColumn="checkbox"><input type="checkbox" id="items" name="items" value="<@jspEl 'item.' + table.pkColumn.columnNameLower/>" class="sel" tags="null"></td>
            <td showColumn="index"><@jspEl 'page.thisPageFirstElementNumber + status.index' /></td>
            <td showColumn="option"><a href="javascript:;"  onclick="show('<@jspEl 'ctx' />/admin/${component}/${classNameFirstLower}/<@jspEl 'item.' + table.pkColumn.columnNameLower/>/edit','<%=${className}.TABLE_ALIAS%>',600)" class="sysiconBtnNoIcon">编辑</a>&nbsp;</td>
            <#list table.columns as column>
            <#if !column.htmlHidden>
            <td showColumn="${column.columnNameLower}"><#rt><#compress>
              <#if (((column.columnNameLower)?index_of("Time")) > 0)>
              <fmt:formatDate value="<@jspEl "item."+column.columnNameLower+"Date"/>" pattern="yyyy-MM-dd HH:mm"/>
              &nbsp;
              <#elseif column.isDateTimeColumn>
              <fmt:formatDate value="<@jspEl "item."+column.columnNameLower/>" pattern="yyyy-MM-dd HH:mm"/>
              &nbsp;
              <#else>
              <c:out value='<@jspEl "item."+column.columnNameLower/>'/>
              &nbsp;
              </#if></#compress><#lt> </td>
            </#if>
            </#list> </tr>
        </c:forEach>
      </tbody>
    </table>
    <simpletable:pageToolbar page="<@jspEl 'page'/>"></simpletable:pageToolbar>
  </form>
  <script type="text/javascript">
	// 列选择显示处理
	$.showcolumn(<@jspEl 'showColumn' />);
	// 排序处理
	$.sortcolumn({
		form : "#admin_${component}_${classNameFirstLower}_search_form",
		data : "pageNumber=<@jspEl 'page.thisPageNumber' />&pageSize=<@jspEl 'page.pageSize' />",
		columns : $("#admin_${component}_${classNameFirstLower}_table th[sortColumn]"),
		sortColumns : "<@jspEl 'pageRequest.sortColumns' />"
	});
	
	$("#admin_${component}_${classNameFirstLower}_table").rowAction({	
		"url" : "<@jspEl 'ctx' />/pages/admin/${component}/${classNameFirstLower}/tab.jsp",
		"except" : ["checkbox","index","option"],
		"pop" : true,
		"poptitle" : "<%=${className}.TABLE_ALIAS%>标签",
		"popw" : 600
	});
	// 表格列表处理
	$('#admin_${component}_${classNameFirstLower}_table').flexigrid({
		height: 'auto',
		striped : true,
		buttons : [
			{name: "添加", bclass: "addorder", onpress : function(){show("<@jspEl 'ctx'/>/admin/${component}/${classNameFirstLower}/new","<%=${className}.TABLE_ALIAS%>添加",600)}},
			{name: '删除', bclass: 'delete', onpress : function(){doRestEdit({confirmMsg:'确认删除选中的记录吗？',url:'<@jspEl 'ctx'/>/admin/${component}/${classNameFirstLower}/',batchBox:'items',boxCon:'#admin_${component}_${classNameFirstLower}_page_form',form:'#admin_${component}_${classNameFirstLower}_page_form',method:'delete'})}}
		]
	});
</script> 
</up72:override>
<%@ include file="base.jsp" %>
