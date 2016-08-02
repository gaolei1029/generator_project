<%@ page language="java" pageEncoding="UTF-8"%>
<%
/** init方法 **/
String $ctx = request.getContextPath();
String $basePath = null;
if (request.getServerPort() == 80) {
	$basePath = request.getScheme() + "://"
	+ request.getServerName() + $ctx;
} else {
	$basePath = request.getScheme() + "://"
	+ request.getServerName() + ":"
	+ request.getServerPort() + $ctx;
}
pageContext.setAttribute("ctx", $ctx);
pageContext.setAttribute("basePath", $basePath);
%>