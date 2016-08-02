<pg:pager
    items="<@jspEl 'pagination.totalRecord'/>"
    maxPageItems="<@jspEl 'pagination.range'/>"
    maxIndexPages="<@jspEl 'pagination.maxIndexPages'/>"
    isOffset="<%= true %>"
    url="do.jsp"
    export="currentPageNumber=pageNumber"
    scope="request">   
  <pg:param name="range"/>
  <pg:param name="maxIndexPages"/>

