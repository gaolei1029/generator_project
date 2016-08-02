<#include "/macro.include"/>
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first> 
package ${basepackage}.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

<#include "/java_imports_v.include">
<@remarks value=""/>
@Entity
@Table(name = "${table.sqlName}")
public class ${className} implements java.io.Serializable{
	private static final long serialVersionUID = 5454155825314635342L;
	
	//date formats
	<#list table.columns as column>
	<#if column.isDateTimeColumn>
	public static final String FORMAT_${column.constantName} = "yyyy-MM-dd";
	</#if>
	</#list>
	
	<@generateFields/>
	<@generateCompositeIdConstructorIfis/>
	<@generatePkProperties/>
	<@generateNotPkProperties/>
	<@generateJavaOneToMany/>
	<@generateJavaManyToOne/>
	<@generateJavaDAO/>

	public String toString() {
		return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
		<#list table.columns as column>
			<#if !table.compositeId>
			.append("${column.columnName}",get${column.columnName}())
			</#if>
		</#list>
			.toString();
	}
	
	public int hashCode() {
		return new HashCodeBuilder()
		<#list table.pkColumns as column>
			<#if !table.compositeId>
			.append(get${column.columnName}())
			</#if>
		</#list>
			.toHashCode();
	}
	
	public boolean equals(Object obj) {
		if(obj instanceof ${className} == false) return false;
		if(this == obj) return true;
		${className} other = (${className})obj;
		return new EqualsBuilder()
			<#list table.pkColumns as column>
				<#if !table.compositeId>
			.append(get${column.columnName}(),other.get${column.columnName}())
				</#if>
			</#list>
			.isEquals();
	}
}

<#macro generateFields>

<#if table.compositeId>
	private ${className}Id id;
	<#list table.columns as column>
		<#if !column.pk>
	private ${column.javaType} ${column.columnNameLower};
		</#if>
	</#list>
<#else>
	
	//columns START
	<#list table.columns as column>
	/** ${column.remarks}*/
	private ${column.javaType} ${column.columnNameLower};
	
	</#list>
	//columns END
</#if>

</#macro>

<#macro generateCompositeIdConstructorIfis>

	<#if table.compositeId>
	public ${className}(){
	}
	public ${className}(${className}Id id) {
		this.id = id;
	}
	<#else>
	<@generateConstructor className/>
	</#if>
	
</#macro>

<#macro generatePkProperties>
	<#if table.compositeId>
	@EmbeddedId
	public ${className}Id getId() {
		return this.id;
	}
	
	public void setId(${className}Id id) {
		this.id = id;
	}
	<#else>
		<#list table.columns as column>
			<#if column.pk>

	public void set${column.columnName}(${column.javaType} value) {
		this.${column.columnNameLower} = value;
	}
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name = "${column.sqlName}", unique = ${column.unique?string}, nullable = ${column.nullable?string}, insertable = true, updatable = true, length = ${column.size})
	public ${column.javaType} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
			</#if>
		</#list>
	</#if>
	
</#macro>

<#macro generateNotPkProperties>
	<#list table.columns as column>
		<#if !column.pk>
			<#if column.isDateTimeColumn>
	@Transient
	public String get${column.columnName}String() {
		if(null!=get${column.columnName}Date()){
			return DateConvertUtils.format(get${column.columnName}Date(), FORMAT_${column.constantName});
		}
		return null;
	}
	public void set${column.columnName}String(String value) {
		set${column.columnName}(DateConvertUtils.parse(value, FORMAT_${column.constantName}).getTime());
	}
	
			</#if>
			<#if (((column.columnNameLower)?index_of("Time")) > 0)>
	@Transient
	public Date get${column.columnName}Date() {
		if(null!=this.${column.columnNameLower}){
			return new Date(this.${column.columnNameLower});
		}
		return null;
	}
			</#if>
	@Column(name = "${column.sqlName}", unique = ${column.unique?string}, nullable = ${column.nullable?string}, insertable = true, updatable = true, length = ${column.size})
	public ${column.javaType} get${column.columnName}() {
		return this.${column.columnNameLower};
	}
	
	public void set${column.columnName}(${column.javaType} value) {
		this.${column.columnNameLower} = value;
	}
	
		</#if>
	</#list>
</#macro>

<#macro generateJavaOneToMany>
	<#list table.exportedKeys.associatedTables?values as foreignKey>
	<#assign fkSqlTable = foreignKey.sqlTable>
	<#assign fkTable    = fkSqlTable.className>
	<#assign fkPojoClass = fkSqlTable.className>
	<#assign fkPojoClassVar = fkPojoClass?uncap_first>
	
	private Set ${fkPojoClassVar}s = new HashSet(0);
	public void set${fkPojoClass}s(Set<${fkPojoClass}> ${fkPojoClassVar}){
		this.${fkPojoClassVar}s = ${fkPojoClassVar};
	}
	
	@OneToMany(cascade = { CascadeType.MERGE }, fetch = FetchType.LAZY, mappedBy = "${classNameFirstLower}")
	public Set<${fkPojoClass}> get${fkPojoClass}s() {
		return ${fkPojoClassVar}s;
	}
	</#list>
</#macro>

<#macro generateJavaManyToOne>
	<#list table.importedKeys.associatedTables?values as foreignKey>
	<#assign fkSqlTable = foreignKey.sqlTable>
	<#assign fkTable    = fkSqlTable.className>
	<#assign fkPojoClass = fkSqlTable.className>
	<#assign fkPojoClassVar = fkPojoClass?uncap_first>
	
	private ${fkPojoClass} ${fkPojoClassVar};
	
	public void set${fkPojoClass}(${fkPojoClass} ${fkPojoClassVar}){
		this.${fkPojoClassVar} = ${fkPojoClassVar};
	}
	
	@ManyToOne(cascade = {}, fetch = FetchType.LAZY)
	<#list foreignKey.parentColumns?values as fkColumn>
	@JoinColumn(name = "${fkColumn}",nullable = false, insertable = false, updatable = false)
    </#list>
	public ${fkPojoClass} get${fkPojoClass}() {
		return ${fkPojoClassVar};
	}
	</#list>
</#macro>

<#macro generateJavaDAO>

/** 充血实现begin */
/*
	@Transient
	public ${className} get${className}() {
		CommonDAOHibernate d=(CommonDAOHibernate)ApplicationContextHolder.getBean("commonDAOHibernate");
		${className} result = null;
		if(this.id != null){
			result = (${className})d.get(${className}.class, this.id);
		}
		return result;
	}

	public QueryResult findPage(Pagination pagination, Map orders) {
//		BaseBeanFactory.getBean("commonDAOHibernate");
		CommonDAOHibernate d=(CommonDAOHibernate)ApplicationContextHolder.getBean("commonDAOHibernate");
		HashMap<String ,Object> params = new HashMap<String, Object>();
		String hql = "from ${className} where 1 = 1";
		
		<#list table.columns as column>
	    if(ObjectUtils.isNotEmpty(this.get${column.columnName}())) {
			params.put(" ${column.columnNameLower}", this.get${column.columnName}());
	    }
	    </#list>
		
		QueryResult result = d.findPage(hql,params,pagination,orders);
		return result;
	}

	public List findList(Integer dataNum, Map orders) {
		CommonDAOHibernate d=(CommonDAOHibernate)ApplicationContextHolder.getBean("commonDAOHibernate");
		HashMap<String ,Object> params = new HashMap<String, Object>();
		String hql = "from ${className} where 1 = 1";
		<#list table.columns as column>
	    if(ObjectUtils.isNotEmpty(this.get${column.columnName}())) {
			params.put(" ${column.columnNameLower}", this.get${column.columnName}());
	    }
	    </#list>
		List result = d.findList(hql,params,dataNum);
		return result;
	}
	*/
/** 充血实现begin */	
</#macro>


