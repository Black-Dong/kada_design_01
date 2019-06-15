<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>宿舍管理系统 ——后台登录</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
<!-- 导入jquery插件 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/fkjava_timer.js"></script>
<script type="text/javascript">
    /** 文档加载完成后立即执行的方法 */
    // var weeks = new Array();
	
    $(function(){
    	$("#nowTime").runTimer();
    	
    	$("#exit").click(function(){
    		/** parent从主界面进行退出,避免局部刷新*/
    		//parent.location = "${pageContext.request.contextPath}/logout.action";
			if( window.confirm("是否要退出?") ){
			    //location.href=""; 自己页面跳转
                parent.location = "${pageContext.request.contextPath}/user/loginout";
			}
    	});

	})
	
    
    
</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="320" height="80" class="topbg"><img src="${pageContext.request.contextPath}/images/logo3.png" width="320" height="80"></td>
	<td class="topbg">
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
	    <tr>
		  <td height="50" class="toplink" align="right"><img src="${pageContext.request.contextPath}/images/top_home.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/jsp/right.jsp" target="main">网站首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/images/top_exit.gif">&nbsp;&nbsp;<a href="javascript:void(0);" id="exit" onclick="">注销退出</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
		  <td height="30" class="topnavbg">
		    <table width="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
			    <td width="60"><img src="${pageContext.request.contextPath}/images/StatBarL.gif" width="60" height="30"></td>
				  <td class="topnavlh" align="left"><img src="${pageContext.request.contextPath}/images/StatBar_admin.gif">&nbsp;&nbsp;当前用户：【<security:authentication property="principal.username"></security:authentication>】</td>
				<td class="topnavlh" align="right"><img src="${pageContext.request.contextPath}/images/StatBar_time.gif">&nbsp;&nbsp;<span id="nowTime"></span>
				
  			 </td>
                <td width="3%"></td>
			  </tr>
			</table>
		  </td>
		</tr>
	  </table>
	</td>
  </tr>
</table>
</body>
</html>