<#include "/java_copyright.include">
<#include "/macro.include"/>
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>   

<#macro mapperEl value>${value}</#macro>
package ${basepackage}.service.impl;

<#include "/java_imports.include">

import com.up72.framework.util.page.PageBounds;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ${basepackage}.service.I${className}Service;

import com.up72.framework.util.page.PageList;
import com.up72.framework.util.page.Page;

<@remarks value="DAO实现"/>
@Service
@Transactional
public class ${className}ServiceImpl implements  I${className}Service{
	
	@Autowired
	private ${className}Mapper ${classNameLower}Mapper;
	
	public void save(${className} ${classNameLower}){
		${classNameLower}Mapper.insert(${classNameLower});
	}

    public void update(${className} ${classNameLower}){
		${classNameLower}Mapper.update(${classNameLower});
	}
	
    public void delete(${table.idColumn.javaType} id){
		${classNameLower}Mapper.delete(id);
	}
    
    @Transactional(readOnly=true)
    public ${className} getById(${table.idColumn.javaType} id){
		return ${classNameLower}Mapper.findById(id);
	}

    @Transactional(readOnly=true)
    public Page<${className}> getPage(Map params, PageBounds rowBounds){
        PageList list = ${classNameLower}Mapper.findPage(params, rowBounds);
        return new Page<${className}>(list,list.getPagination());
	}
	
	<#list table.columns as column>
    <#if column.unique && !column.pk>
    @Transactional(readOnly=true)
    public ${className} getBy${column.columnName}(${column.javaType} <@mapperEl column.columnNameLower/>){
		return ${classNameLower}Mapper.findBy${column.columnName}(<@mapperEl column.columnNameLower/>);
	}
    </#if>
	</#list>

}
