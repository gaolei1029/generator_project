<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!/********************function.jsp 公用方法************************/
	private static final void $forward(String url, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.getRequestDispatcher(url).forward(request, response);
	}

	private static final void $redirect(String url, HttpServletResponse response)
			throws Exception {
		response.sendRedirect(url);
	}

	private static final void $setAttribute(String key, Object value,HttpServletRequest request)
	throws Exception {
		request.setAttribute(key, value);
	}
	private static final void $referer(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String referer = request.getHeader("Referer");
		response.sendRedirect(referer);
	}

	private static final void $jsMessage(JspWriter out, String message,
			String Url) throws Exception {
		out.println("<script>alert('" + message + "')</script>");
		out.println("<script>location.href='" + Url + "';</script>");
	}%>