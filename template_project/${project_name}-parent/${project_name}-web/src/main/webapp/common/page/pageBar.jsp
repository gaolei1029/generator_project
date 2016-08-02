<!-- Page Style 1 -->
<%--<%@ page session="false" contentType="text/html;charset=utf-8"%>--%>
<%--<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>--%>
<%--<pg:first>--%>
    <%--<a href="<%=pageUrl%>&pageNumber=<%=pageNumber%>"><nobr>[首页]</nobr></a>--%>
<%--</pg:first>--%>
<%--<pg:prev>--%>
    <%--<a href="<%=pageUrl%>&pageNumber=<%=pageNumber%>"><nobr>[前一页]</nobr></a>--%>
<%--</pg:prev>--%>
<%--<pg:pages>--%>
    <%--<a href="<%=pageUrl%>&pageNumber=<%=pageNumber%>"><%=pageNumber%></a>--%>
<%--</pg:pages>--%>
<%--<pg:next>--%>
    <%--<a href="<%=pageUrl%>&pageNumber=<%=pageNumber%>"><nobr>[下一页 ]</nobr></a>--%>
<%--</pg:next>--%>
<%--<pg:last>--%>
    <%--<a href="<%=pageUrl%>&pageNumber=<%=pageNumber%>"><nobr>[尾页 ]</nobr></a>--%>
<%--</pg:last>--%>

<!-- Page Style 2 -->
<%--<%@ page session="false" contentType="text/html;charset=utf-8"%>--%>
<%--<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>--%>
<%--<table width="100%" cellpadding="2" cellspacing="0" border="0" bgcolor="e3e9f8">--%>
<%--<tr><td><font face="arial" size="2">&nbsp;<b>Matches</b></font>--%>
<%--</td><td align="right" nowrap width="1%"><font face="arial" size="-1">--%>
<%--<pg:index export="total=itemCount">--%>
    <%--<pg:page export="first,last">--%>
        <%--<%= first %> - <%= last %> of <%= total %>--%>
    <%--</pg:page>--%>
    <%--<pg:first export="url,pageNumber" unless="current">--%>
        <%--&nbsp;<b><a href="<%= url %>&pageNumber=<%=pageNumber%>">首页</a></b>&nbsp;|--%>
    <%--</pg:first>--%>
    <%--<pg:prev export="url,pageNumber,first,last">--%>
        <%--<% int prevItems = (last.intValue() - first.intValue()) + 1; %>--%>
        <%--<b><a href="<%= url %>&pageNumber=<%=pageNumber%>">上一页 <%= prevItems %>--%>
        <%--</a></b>--%>
    <%--</pg:prev>--%>
    <%--<pg:next export="url,pageNumber,first,last">--%>
        <%--<% int nextItems = (last.intValue() - first.intValue()) + 1; %>--%>
        <%--|&nbsp;<b><a href="<%= url %>&pageNumber=<%=pageNumber%>">下一页 <%= nextItems %></a></b>--%>
    <%--</pg:next>--%>
    <%--&nbsp;&nbsp;</font></td></tr>--%>
    <%--</table>--%>
<%--</pg:index>--%>

<!-- Page Style 3 -->
<%@ page session="false" contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg"%>
<jsp:useBean id="currentPageNumber" type="java.lang.Integer" scope="request"/>
<div class="listpage2 mt10">
    <span>共<@jspEl 'pagination.totalPages'/>页 - 共<@jspEl 'pagination.totalCount'/>条数据</span>
<pg:prev export="pageUrl, pageNumber" ifnull="<%= true %>">
    <% if (pageUrl != null) { %>
    <a href="<%= pageUrl %>&pageNumber=<%=pageNumber%>">&lt; Prev</a>
    <% } else { %>
    <span class="disabled">&lt; Prev</span>
    <% } %>
</pg:prev>
<pg:pages export="pageUrl, pageNumber">
    <% if (pageNumber == currentPageNumber) {%>
    <span class="current"><%= pageNumber %></span>
    <% } else { %>
    <a href="<%= pageUrl %>&pageNumber=<%=pageNumber%>"><%= pageNumber %></a>
    <% } %>
</pg:pages>
<pg:next export="pageUrl, pageNumber" ifnull="<%= true %>">
    <% if (pageUrl != null) { %>
    <a href="<%= pageUrl %>&pageNumber=<%=pageNumber%>">Next &gt;</a>
    <% } else { %>
    <span class="disabled">Next &gt;</span>
    <% } %>
</pg:next>
</div>