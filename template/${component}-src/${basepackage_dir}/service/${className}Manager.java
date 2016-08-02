<#include "/macro.include"/>
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first> 
package ${basepackage}.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static com.up72.common.CommonUtils.*;
import com.up72.framework.beanutils.BeanUtils;

<#include "/java_imports.include">
<@remarks value="业务处理"/>
@Service
@Transactional
public class ${className}Manager extends BaseManager<${className},${table.idColumn.javaType}>{

	private ${className}Dao ${classNameFirstLower}Dao;

	public void set${className}Dao(${className}Dao dao) {
		this.${classNameFirstLower}Dao = dao;
	}
	
	@SuppressWarnings({ "unchecked" })
	public EntityDao getEntityDao() {
		return this.${classNameFirstLower}Dao;
	}
	
	@Transactional(readOnly=true)
	@SuppressWarnings({ "unchecked" })
	public Page findPage(${className}Query query) {
		return ${classNameFirstLower}Dao.findPage(query);
	}
	
<#list table.columns as column>
	<#if column.unique && !column.pk>
	@Transactional(readOnly=true)
	public ${className} getBy${column.columnName}(${column.javaType} v) {
		return ${classNameFirstLower}Dao.getBy${column.columnName}(v);
	}	
	
	</#if>
</#list>
}
