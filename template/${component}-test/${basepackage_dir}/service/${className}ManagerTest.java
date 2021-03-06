<#include "/macro.include"/>
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first> 
package ${basepackage}.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.junit.Test;

import com.up72.common.test.BaseManagerTestCase;

import com.up72.framework.test.context.TestMethodContext;
import static junit.framework.Assert.*;

<#include "/java_imports.include">
<@remarks value="业务处理测试"/>
public class ${className}ManagerTest extends BaseManagerTestCase{

	private ${className}Manager manager;
	
	@Autowired
	public void set${className}Manager(${className}Manager manager) {
		this.manager = manager;
	}

    @Override
    protected String[] getDbUnitDataFiles() {
        //通过 TestMethodContext.getMethodName() 可以得到当前正在运行的测试方法名称
        return new String[]{"classpath:testdata/common.xml","classpath:testdata/${className}.xml",
                            "classpath:testdata/${className}_"+TestMethodContext.getMethodName()+".xml"};
    }

	//最佳实践:测试方法要有可读性,如可以使用: test_find_page_with_error_parameter()
	//数据库单元测试前会开始事务，结束时会回滚事务，所以测试方法可以不用关心测试数据的删除
	@Test
	public void crud() {

		${className} obj = new${className}();
		manager.save(obj);
		manager.getEntityDao().flush();
		
		manager.update(obj);
		manager.getEntityDao().flush();
		
	<#if table.compositeId>
		assertNotNull(manager.getById(obj.getId()));
		
		manager.removeById(obj.getId());
		manager.getEntityDao().flush();
	<#else>
		assertNotNull(obj.get${table.idColumn.columnName}());
		
		manager.removeById(obj.get${table.idColumn.columnName}());
		manager.getEntityDao().flush();
	</#if>
	
	}
	
	public static ${className} new${className}() {
		${className} obj = new ${className}();
		
		<#list table.columns as column>
	  		<#if column.isNotIdOrVersionField>
	  			<#if column.isDateTimeColumn>
	  	obj.set${column.columnName}(new ${column.javaType}(System.currentTimeMillis()));
	  			<#else>
	  	obj.set${column.columnName}(new ${column.javaType}("1"));
	  			</#if>
			</#if>
		</#list>
		return obj;
	}
}
