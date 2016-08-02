<#include "/macro.include"/>
<#include "/java_copyright.include">
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
package ${basepackage}.dto.resp;

import ${basepackage}.model.${className};


<@remarks value="输出"/>
public class ${className}Resp  extends  ${className}{
	
}