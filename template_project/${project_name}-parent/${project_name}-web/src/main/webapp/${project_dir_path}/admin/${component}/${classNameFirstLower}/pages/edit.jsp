<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@include file="/common/taglibs.jsp" %>
<up72:override name="head">
	<script type="text/javascript" charset="utf-8" src="<@jspEl 'js_ctx'/>/scripts/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="<@jspEl 'js_ctx'/>/scripts/ueditor/ueditor.all.min.js"></script>
	<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	<script type="text/javascript" charset="utf-8" src="<@jspEl 'js_ctx'/>/scripts/ueditor/lang/zh-cn/zh-cn.js"></script>

	<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/jquery.validate.min.js"></script>
	<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/messages_cn.js"></script>
	<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/jquery.metadata.js"></script>
	<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/validate.extend.js"></script>
	<script type='text/javascript' src="<@jspEl 'js_ctx'/>/scripts/jquery/jquery.selectlayer.js"></script>
	<script type='text/javascript' src="<@jspEl 'js_ctx'/>/scripts/jquery/jquery.tag.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$("#${component}_${classNameFirstLower}_edit_form").validate({
				// ajax提交方式
//				 submitHandler:function(form){
//					 $("#sendMsg").val("正在处理...");
//					 $("#sendMsg").attr("disabled", "disabled");
//					 $(form).submit();
//				 },
				errorPlacement: function (error, element) {
					var errorLable = $("#" + element.attr("id") + "Error").attr("id");
					if(isNull(errorLable)) {
						error.appendTo(element.parent());
					} else {
						error.appendTo($("#" + element.attr("id") + "Error"));
					}
				}
			});
		});
	</script>
</up72:override>
<up72:override name="content">
	<%--<%@include file="../include/edit_nav.jsp" %>--%>
	<div class="topNavNull"></div>
	<div style="display:none" id="sel_district"></div>
	<!--sel_district-->
	<form:form id="${component}_${classNameFirstLower}_edit_form"
	           action="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp"
	           modelAttribute="${classNameFirstLower}">
		<input type="hidden" name="method" id="method" value="doEdit"/>
		<%@include file="../include/formInclude.jsp" %>
	</form:form>
</up72:override>
<%@include file="../pageBase.jsp" %>