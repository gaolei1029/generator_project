<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../function.jsp"%>
<%
	$forward("./do/" + $getMD(request) + ".jsp",request,response);
%>