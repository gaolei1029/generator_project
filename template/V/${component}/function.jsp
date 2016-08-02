<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page
	import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="com.up72.dao.hibernate.CommonDAOHibernate"%>
<%@page import="com.up72.common.CommonUtils"%>
<%@page import="com.up72.dao.jdbc.CommonDAOJdbc"%>
<%!/********************commumUtil.jsp 公用方法************************/
	private static final void $forward(String url, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.getRequestDispatcher(url).forward(request, response);
	}

	private static final void $redirect(String url, HttpServletResponse response)
			throws Exception {
		response.sendRedirect(url);
	}

	private static final void $setAttribute(String key, Object value,
			HttpServletRequest request) throws Exception {
		request.setAttribute(key, value);
	}

	private static final void $referer(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}

	private static final String $getMD(HttpServletRequest request) {
		String method = CommonUtils.paramUtils.getParameter(request, "method",
				"index");
		return method;
	}

	private static final void $jsMessage(JspWriter out, String message,
			String Url) throws Exception {
		out.println("<script>alert('" + message + "')</script>");
		out.println("<script>location.href='" + Url + "';</script>");
	}%>

<%
	/********************databaseUtil.jsp 公用方法************************/
	ServletContext context = getServletContext();
	WebApplicationContext applicationContext = WebApplicationContextUtils
			.getWebApplicationContext(context);
	CommonDAOHibernate $d = (CommonDAOHibernate) applicationContext
			.getBean("commonDAOHibernate");
	CommonDAOJdbc $$d = (CommonDAOJdbc) applicationContext
			.getBean("commonDAOJdbc");
%>