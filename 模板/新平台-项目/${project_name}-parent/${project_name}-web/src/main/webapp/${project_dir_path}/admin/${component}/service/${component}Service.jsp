<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ page import="${basepackage}.service.*" %>
<%@ page import="com.up72.framework.util.holder.ApplicationContextHolder" %>
<%!

   public static  I${className}Service   ${r"$"}${classNameFirstLower}Service(){
   I${className}Service ${classNameFirstLower}Service = (I${className}Service) ApplicationContextHolder.getBean("${classNameFirstLower}Service");
      return ${classNameFirstLower}Service;
   }
%>