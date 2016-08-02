<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.up72.dao.hibernate.CommonDAOHibernate"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.up72.dao.jdbc.CommonDAOJdbc"%>
<%
	/********************function.jsp 公用方法************************/
ServletContext context = getServletContext();
WebApplicationContext applicationContext = WebApplicationContextUtils
		.getWebApplicationContext(context);
CommonDAOHibernate $d = (CommonDAOHibernate) applicationContext
		.getBean("commonDAOHibernate");
CommonDAOJdbc $$d = (CommonDAOJdbc) applicationContext
		.getBean("commonDAOJdbc");

HashMap<String,Object> paramsMap = new HashMap<String,Object>();//参数map，使用完毕后需清除
Map<String,String> orderMap = new HashMap<String,String>();//排序map，使用完毕后需清除
%>
