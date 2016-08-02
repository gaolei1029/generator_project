<%@ page contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

<%@ taglib uri="http://www.up72.com" prefix="up72" %>

<c:set var="ctx" value="<@jspEl 'pageContext.request.contextPath'/>"/>
<c:set var="css_ctx" value="<@jspEl 'pageContext.request.contextPath'/>"/>
<c:set var="js_ctx" value="<@jspEl 'pageContext.request.contextPath'/>"/>
<c:set var="img_ctx" value="<@jspEl 'pageContext.request.contextPath'/>"/>
<c:set var="v" value="2015-09-21" />
