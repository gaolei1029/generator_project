<#include "/macro.include"/>
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameFirstLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<div class="up72_edit">
  <form:form id="admin_${component}_${classNameFirstLower}_edit_form" method="put" action="<@jspEl 'ctx'/>/admin/${component}/${classNameFirstLower}/<@jspEl classNameFirstLower+'.'+table.idColumn.columnNameFirstLower/>" modelAttribute="${classNameFirstLower}">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="edit_table">
      <%@ include file="form_include.jsp" %>
    </table>
    <div class="up72_submit">
      <div class="btn btn_sub" title="完成"><input type="submit" id="submitButton" name="submitButton" value="完成" /></div>
      <div class="btn btn_cel" title="取消"><input type="button" id="close_button" value="取消" onclick="closeBox();" /></div>
    </div>
  </form:form>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#admin_${component}_${classNameFirstLower}_edit_form").validate({
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
</script>