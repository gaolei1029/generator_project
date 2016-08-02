<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<#include "/macro.include"/>
<#include "/custom.include"/>
<#assign className = table.className>
<#assign classNameFirstLower = className?uncap_first>
<%@include file="/common/taglibs.jsp" %>
<up72:override name="head">
<title><%=${className}.TABLE_ALIAS%> 修改</title>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/jquery.validate.min.js?v=<@jspEl 'v'/>"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/messages_cn.js?v=<@jspEl 'v'/>"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/jquery.metadata.js?v=<@jspEl 'v'/>"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/jquery/validate/validate.extend.js?v=<@jspEl 'v'/>"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/layer/layer.js?v=<@jspEl 'v'/>"></script>
<script type="text/javascript" src="<@jspEl 'js_ctx'/>/scripts/common.js?v=<@jspEl 'v'/>"></script>

	<script type="text/javascript">
		$(document).ready(function () {
			$("#${component}_${classNameFirstLower}_edit_form").validate({
				errorElement : "label",
				submitHandler:function(form){
					$.getJson($(form).attr("action")+"?method="+$("#method").val(),$("#${component}_${classNameFirstLower}_edit_form").serialize(),function(json){
						if(json.success){
							if(typeof json.data == 'object'){
								$.each(json.data, function(key, value) {
									$("#" + key + "Error").text(value);
								});
							}else{
								layer.msg(json.data, {icon: 1, shade: 0.6},function(){
									window.location.href = "?method=page";
								});
							}
						}else{
							layer.msg(json.message, {icon: 2, shade: 0.6});
						}
					});
					return false;

				},
				errorPlacement: function (error, element) {
					var errorLable = $("#" + element.attr("id") + "Error").attr("id");
					if(errorLable) {
						error.appendTo($("#" + element.attr("id") + "Error"));
					} else {
						error.appendTo(element.parent());
					}
				}
			});
		});
	</script>
</up72:override>
<up72:override name="content">
	<div class="top-title"><h5><%=${className}.TABLE_ALIAS%></h5></div>
	<div class="top-nav-list">
		<ul id="tab" class="clearfix">
			<li class="cur fl tc"><%=${className}.TABLE_ALIAS%></li>
		</ul>
	</div>
	<div class="clear"></div>
	<div class="mt15"></div>
	<div class="alert alert-info2"><em class="cOrange">请完善以下信息。</em></div>
<form  id="${component}_${classNameFirstLower}_edit_form"  name="${component}_${classNameFirstLower}_edit_form" method="POST"  action="<@jspEl 'ctx'/>/${project_dir_path}/admin/${component}/${classNameFirstLower}/do.jsp">
	<input type="hidden" name="method" id="method" value="doEdit"/>
	<ul class="addinput">
		<%@include file="../include/formInclude.jsp" %>
	</ul>
</form>
</up72:override>
<%@include file="../pageBase.jsp" %>