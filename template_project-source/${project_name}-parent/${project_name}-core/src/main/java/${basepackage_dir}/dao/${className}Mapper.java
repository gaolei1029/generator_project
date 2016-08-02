<#include "/java_copyright.include">
<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   

<#macro mapperEl value>${value}</#macro>
package ${basepackage}.dao;


import ${basepackage}.model.${className};

import com.up72.framework.util.page.PageBounds;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import com.up72.framework.util.page.PageList;

<@remarks value="DAO"/>
@Repository
public interface ${className}Mapper {
	
	void insert(${className} entity);

    void update(${className} entity);
	
	void delete(${table.idColumn.javaType} id);
	
    ${className} findById(${table.idColumn.javaType} id);

    PageList<${className}> findPage(Map params, PageBounds rowBounds);
	
	<#list table.columns as column>
    <#if column.unique && !column.pk>
	${className} findBy${column.columnName}(${column.javaType} <@mapperEl column.columnNameLower/>);
    </#if>
	</#list>

}
