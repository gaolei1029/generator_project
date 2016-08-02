<%@ page language="java"  pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://jsptags.com/tags/navigation/pager" prefix="pg" %>
<jsp:useBean id="currentPageNumber" type="java.lang.Integer" scope="request"/>
<pg:index export="total=itemCount">
	<div class="image_wall_more clr pt30" style="display: none;">
	  <div class="pagination pd_tb">
	  	<pg:prev export="prevPageUrl=pageUrl" ifnull="<%= true %>">
	  		<% if (prevPageUrl != null) { %>
			    <a href="<%= prevPageUrl %>">&lt;</a>
				<pg:first export="firstPageUrl=pageUrl" unless="current">
					<a href="<%= firstPageUrl %>">首页</a>
				</pg:first>
			  <% } %>
		</pg:prev>
		<pg:pages>
			<% if (pageNumber == currentPageNumber) { %>
		    <a href="<%= pageUrl %>" class="c"><%= pageNumber %></a> 
		    <%}else{ %>
		    <a href="<%= pageUrl %>"><%= pageNumber %></a> 
		    <%} %>
		</pg:pages>
		<pg:next export="prevPageUrl=pageUrl" ifnull="<%= true %>">
		  <% if (prevPageUrl != null) { %>
			<pg:last>
		  		<a href="<%= pageUrl %>">尾页 &gt;</a>
			</pg:last>
		    <a href="<%= prevPageUrl %>">下一页&gt;</a>
		  <% } %>
		</pg:next>
		<span class="page_num">
			<span>到第</span><input id="all" type="text" value=""><span>页</span> <a href="javascript:;" >确定</a>
		</span>
	  </div>
	</div>
</pg:index>