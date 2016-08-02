<%@ page import="javax.validation.ConstraintViolation" %>
<%@ page import="com.up72.framework.util.holder.BeanValidatorHolder" %>
<%@ page import="java.io.IOException" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="com.fasterxml.jackson.core.JsonGenerator" %>
<%@ page import="com.fasterxml.jackson.core.JsonFactory" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page import="java.lang.reflect.Method" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.up72.framework.util.page.PageBounds" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%!
    /********************function.jsp 公用方法************************/
    private static final void $forward(String url, HttpServletRequest request,
                                       HttpServletResponse response) throws Exception {
        request.getRequestDispatcher(url).forward(request, response);
    }

    private static final void $redirect(String url, HttpServletResponse response)
            throws Exception {
        response.sendRedirect(url);
    }

    private static boolean $validate(Object obj, HttpServletRequest request){
        Set<ConstraintViolation<Object>> set = BeanValidatorHolder.validate(obj);
        if(!set.isEmpty()){
            Map<String,String> errorMap = new HashMap<String, String>();
            Iterator<ConstraintViolation<Object>> it = set.iterator();
            while (it.hasNext()){
                ConstraintViolation<Object> error = it.next();
                errorMap.put(error.getPropertyPath().toString(),error.getMessage());
            }
            request.setAttribute("errors",errorMap);
            return false;
        }
        return true;
    }

    private static  Map<String,String> $validateErrors(Object obj, HttpServletRequest request){
        Set<ConstraintViolation<Object>> set = BeanValidatorHolder.validate(obj);
        Map<String,String> errorMap = null;
        if(!set.isEmpty()){
            errorMap  = new HashMap<String, String>();
            Iterator<ConstraintViolation<Object>> it = set.iterator();
            while (it.hasNext()){
                ConstraintViolation<Object> error = it.next();
                errorMap.put(error.getPropertyPath().toString(),error.getMessage());
            }
        }
        return errorMap;
    }

    private static final void $setAttribute(String key, Object value, HttpServletRequest request)
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
    }

    /**
     * object对象转换为 json格式字符串
     *
     * @param object
     * @return
     * @throws IOException
     */
    @SuppressWarnings({"unchecked"})
    public String $json(Object object) throws IOException {
        if (object == null) {
            return "";
        }
        ObjectMapper mapper = new ObjectMapper();
        StringWriter sw = new StringWriter();
        JsonGenerator gen = new JsonFactory().createJsonGenerator(sw);
        mapper.writeValue(gen, object);
        gen.close();
        return sw.toString();
    }

    /**
     * 获取参数Map
     * @param req 请求
     * @param fields 字段数组
     * @return
     */
    public Map $getParamMap(HttpServletRequest req,String[] fields){
        Map params = new HashMap();
        for (String field : fields) {
            if (StringUtils.isBlank(field)) continue;
            String value = req.getParameter(field);
            if(value == null) continue;
            value = value.replaceAll("'","");
            if(StringUtils.isBlank(value)) continue;
            params.put(field, value);
        }
        return params;
    }

    /** 获取分页信息 */
    public PageBounds getBounds(HttpServletRequest req) {
        return new PageBounds($getParam(req,"pageNumber",1), 15);
    }

%>