<#include "/macro.include"/>
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>   
package ${basepackage}.dao;

<#include "/java_imports.include">

import static com.up72.framework.util.ObjectUtils.*;
import org.springframework.stereotype.Repository;

<@remarks value="Hibernate数据处理"/>
@Repository
public class ${className}Dao extends BaseHibernateDao<${className},${table.idColumn.javaType}>{

	@SuppressWarnings({ "unchecked" })
	public Class getEntityClass() {
		return ${className}.class;
	}
	
	@SuppressWarnings({ "unchecked" })
	public Page findPage(${className}Query query) {
        StringBuilder sql = new StringBuilder("select t from ${className} t where 1=1 ");
        <#list table.columns as column>
        <#if column.isDateTimeColumn>
        if(isNotEmpty(query.get${column.columnName}Begin())) {
            sql.append(" and  t.${column.columnNameLower} >= :${column.columnNameLower}Begin ");
        }
        if(isNotEmpty(query.get${column.columnName}End())) {
            sql.append(" and  t.${column.columnNameLower} <= :${column.columnNameLower}End ");
        }
        <#else>
        if(isNotEmpty(query.get${column.columnName}())) {
            sql.append(" and  t.${column.columnNameLower} = :${column.columnNameLower} ");
        }
        </#if>
        </#list>
        if(isNotEmpty(query.getSortColumns())) {
            sql.append(" /~ order by [sortColumns] ~/ ");
        }	
        
		return pageQuery(sql.toString(),query);
	}
	
	<#list table.columns as column>
	<#if column.unique && !column.pk>
	public ${className} getBy${column.columnName}(${column.javaType} v) {
		return (${className}) findByProperty("${column.columnNameLower}",v);
	}	
	</#if>
	</#list>

}
