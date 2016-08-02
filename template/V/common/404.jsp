<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>404 ~ Page Not Found</title>
<style type="text/css">
#apDiv1 {
	position:absolute;
	width:257px;
	height:54px;
	z-index:1;
	left: 513px;
	top: 425px;
	font-size: 12px;
}

</style>
<script type="text/javascript" src="<@jspEl 'ctx'/>/scripts/jquery.js"></script>
</head>
<body>
<script type="text/javascript">
var timer = 3;
var interval = window.setInterval(function(){
	if(timer <= 1){
		window.clearInterval(interval);
		window.location.href = "<c:url value="/"/>";
	}else{
		timer --;
		$("#timer_span").html(timer);
	}
},1000);
</script>
<div   ><img src="<c:url value="/"/>images/404.jpg" width="1200" height="621" border="0" usemap="#Map" />
  <map name="Map" id="Map">
    <area shape="rect" coords="326,412,412,442" href="<c:url value="/"/>" />
  </map>

<span  id="apDiv1" style="color: red;"><font  size="5" id="timer_span" color="red">3</font></span>
</div>
</body>
</html>