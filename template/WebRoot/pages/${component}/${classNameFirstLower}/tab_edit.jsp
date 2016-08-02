<%@page import="${basepackage}.model.*" %>

<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="up72_edit">
  <form:form id="${component}_${classNameFirstLower}_tab_edit_form" method="put" action="<@jspEl 'ctx'/>/${component}/${classNameFirstLower}/<@jspEl classNameFirstLower+'.'+table.idColumn.columnNameFirstLower/>" modelAttribute="${classNameFirstLower}">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="edit_table">
      <%@ include file="form_include.jsp" %>
    </table>
    <div class="edit_submit">
      <div class="btn btn_sub" title="完成"><input type="submit" id="submitButton" name="submitButton" value="完成" /></div>
      <div class="btn btn_cel" title="取消"><input type="button" id="close_button" value="取消" onclick="closeBox();" /></div>
    </div>
  </form:form>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#${component}_${classNameFirstLower}_tab_edit_form").validate({
				/*  
				// ajax提交方式
				submitHandler:function(form){   
					form.submit();
				},
				*/
				errorPlacement: function(error, element) {
					error.appendTo(element.parent());
				}
		});	
	});	
	});
</script> 
