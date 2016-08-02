<#include "/java_copyright.include">
<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   

<#macro mapperEl value>${value}</#macro>
package ${basepackage}.service;

import ${basepackage}.model.${className};

import com.up72.framework.util.page.PageBounds;
import java.util.List;
import java.util.Map;

import com.up72.framework.util.page.Page;


<@remarks value="接口"/>
public interface I${className}Service {
	
	void save(${className} ${classNameLower});

    void update(${className} ${classNameLower});
	
	void delete(${table.idColumn.javaType} id);
	
    ${className} getById(${table.idColumn.javaType} id);

    Page<${className}> getPage(Map params, PageBounds rowBounds);
	
	<#list table.columns as column>
    <#if column.unique && !column.pk>
	${className} getBy${column.columnName}(${column.javaType} <@mapperEl column.columnNameLower/>);
    </#if>
	</#list>

}
