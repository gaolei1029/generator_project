<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglibs.jsp" %>
<div class="leftsidebar_box">
	<div class="line"></div>
	<dl class="system_log">
		<dt>采集资源库<img src="<@jspEl 'img_ctx'/>/styles/images/left/select_xl01.png"></dt>
		<dd id="c_1" class="first_dd"><a onclick="ClassList('1');" href="<@jspEl 'ctx'/>/jsp/info/crawler/do.jsp?method=page" target="main">采集资源</a></dd>
		<dd id="c_2"><a onclick="ClassList('2');" href="<@jspEl 'ctx'/>/jsp/info/crawler/do.jsp?method=recycle" target="main">采集回收站</a></dd>
		<dd id="c_3"><a onclick="ClassList('3');" href="<@jspEl 'ctx'/>/jsp/info/crawler/do.jsp?method=goConfig" target="main">采集库设置</a></dd>
		<dd id="c_4"><a onclick="ClassList('4');" href="<@jspEl 'ctx'/>/jsp/info/crawler/do.jsp?method=statistics" target="main">采集库统计</a></dd>
	</dl>
	<dl class="custom">
		<dt>信息资源库<img src="<@jspEl 'img_ctx'/>/styles/images/left/select_xl01.png"></dt>
		<dd id="c_11" class="first_dd"><a onclick="ClassList('11');" href="<@jspEl 'ctx'/>/jsp/info/information/do.jsp?method=page" target="main">信息库列表</a></dd>
		<dd id="c_12"><a onclick="ClassList('12');" href="<@jspEl 'ctx'/>/jsp/info/information/do.jsp?method=distribute" target="main">分发内容</a></dd>
		<dd id="c_13"><a onclick="ClassList('13');" href="<@jspEl 'ctx'/>/jsp/info/information/do.jsp?method=statistics" target="main">编辑统计分析</a></dd>
		<dd id="c_14"><a onclick="ClassList('14');" href="<@jspEl 'ctx'/>/jsp/info/information/do.jsp?method=recycle" target="main">总回收站</a></dd>
		<dd id="c_15"><a onclick="ClassList('15');" href="<@jspEl 'ctx'/>/jsp/info/information/do.jsp?method=superNode" target="main">智能发布记录</a></dd>
		<dd id="c_16"><a onclick="ClassList('16');" href="<@jspEl 'ctx'/>/jsp/info/information/do.jsp?method=site_class" target="main">站点栏目</a></dd>
	</dl>
	<dl class="cloud">
		<dt>编审操作<img src="<@jspEl 'img_ctx'/>/styles/images/left/select_xl01.png"></dt>
		<dd id="c_31" class="first_dd"><a onclick="ClassList('31');" href="<@jspEl 'ctx'/>/jsp/info/editorOpera/infoResource/do.jsp?method=page&operateStatus=1" target="main">待处理数据</a></dd>
		<dd id="c_32"><a onclick="ClassList('32');" href="<@jspEl 'ctx'/>/jsp/info/editorOpera/infoResource/do.jsp?method=page&operateStatus=4" target="main">驳回数据</a></dd>
		<dd id="c_33"><a onclick="ClassList('33');" href="<@jspEl 'ctx'/>/jsp/info/editorOpera/infoResource/do.jsp?method=page&operateStatus=2" target="main">已处理数据</a></dd>
		<dd id="c_34"><a onclick="ClassList('34');" href="<@jspEl 'ctx'/>/jsp/info/editorOpera/infoResource/do.jsp?method=statistics" target="main">我的统计分析</a></dd>
		<dd id="c_35"><a onclick="ClassList('35');" href="<@jspEl 'ctx'/>/jsp/info/editorOpera/infoResource/do.jsp?method=site_statistics" target="main">站点数据分析</a></dd>
		<dd id="c_36"><a onclick="ClassList('36');" href="<@jspEl 'ctx'/>/jsp/info/editorOpera/infoResource/do.jsp?method=page&operateStatus=5" target="main">废弃数据</a></dd>
	</dl>
	<dl class="syetem_management">
		<dt>智能发布<img src="<@jspEl 'img_ctx'/>/styles/images/left/select_xl01.png"></dt>
		<dd id="c_51" class="first_dd"><a onclick="ClassList('51');" href="<@jspEl 'ctx'/>/jsp/info/superIssue/do.jsp?method=analysis" target="main">发布分析</a></dd>
		<dd id="c_52"><a onclick="ClassList('52');" href="<@jspEl 'ctx'/>/jsp/info/superIssue/do.jsp?method=issue" target="main">立即发布</a></dd>
		<dd id="c_53"><a onclick="ClassList('53');" href="<@jspEl 'ctx'/>/jsp/info/superIssue/do.jsp?method=issue&quartz=1" target="main">定时发布</a></dd>
	</dl>
	<dl class="channel">
		<dt>参数管理<img src="<@jspEl 'img_ctx'/>/styles/images/left/select_xl01.png"></dt>
		<dd id="c_61" class="first_dd"><a onclick="ClassList('61');" href="<@jspEl 'ctx'/>/jsp/info/parameter/do.jsp?method=synonym" target="main">同义词库</a></dd>
		<dd id="c_62"><a onclick="ClassList('62');" href="<@jspEl 'ctx'/>/jsp/info/parameter/do.jsp?method=tag_list" target="main">标签词库</a></dd>
		<dd id="c_63"><a onclick="ClassList('63');" href="<@jspEl 'ctx'/>/jsp/info/parameter/do.jsp?method=classification" target="main">行业分类</a></dd>
		<dd id="c_64"><a onclick="ClassList('64');" href="<@jspEl 'ctx'/>/jsp/info/parameter/do.jsp?method=material_pic" target="main">素材图库</a></dd>
		<dd id="c_65"><a onclick="ClassList('65');" href="<@jspEl 'ctx'/>/jsp/info/parameter/do.jsp?method=sensitive" target="main">敏感词库</a></dd>
		<dd id="c_66"><a onclick="ClassList('66');" href="<@jspEl 'ctx'/>/jsp/info/parameter/do.jsp?method=my_source" target="main">我的来源库</a></dd>
		<dd id="c_67"><a onclick="ClassList('67');" href="<@jspEl 'ctx'/>/jsp/info/parameter/do.jsp?method=my_author" target="main">我的作者库</a></dd>
	</dl>
</div>