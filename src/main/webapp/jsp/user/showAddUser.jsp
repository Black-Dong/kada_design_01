<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>宿舍管理系统——添加用户</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="${pageContext.request.contextPath}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-migrate-1.2.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
	<script src="${pageContext.request.contextPath}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/ligerUI/js/plugins/ligerResizable.jss" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
	

		

	</script>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr><td height="10"></td></tr>
  <tr>
    <td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locleft.gif" width="15" height="32"></td>
	<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：用户管理  &gt; 添加用户</td>
	<td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	 <form action="${pageContext.request.contextPath}/user/addUser" id="userForm" method="post">
    	 	<!-- 隐藏表单，status表示添加标记 默认添加的就是普通管理员 -->
    	 	<input type="hidden" name="status" value="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
		    	<table>
		    		<tr>
						<%--
						 uid INT PRIMARY KEY AUTO_INCREMENT,#主键
						 username VARCHAR(32) , #登陆名称
						 NAME VARCHAR(32) , #真实姓名

						 PASSWORD VARCHAR(32), #密码
						 STATUS VARCHAR(2) , #用户状态
						 create_date VARCHAR(32),#最后修改时间

						 gender VARCHAR(2) ,#性别
						 email VARCHAR(32),#邮箱
						 telephone VARCHAR(32) ,#联系电话
						 CODE VARCHAR(32) #激活码
						--%>
		    			<td class="font3 fftd">姓&nbsp;名：<input type="text" name="name" id="name" size="20"/></td>
		    			<td class="font3 fftd">登录名：<input type="text" name="username" id="username" size="20"/></td>
		    		</tr>
		    			
		    		<tr>
		    			<td class="font3 fftd">密&nbsp;码：<input name="password" id="password" size="20" /></td>
		    			<td class="font3 fftd">性&nbsp;别：<input name="gender" id="gender" size="20" /></td>
		    		</tr>
					<tr>
						<td class="font3 fftd">邮&nbsp;箱：<input name="email" id="email" size="20" /></td>
						<td class="font3 fftd">电&nbsp;话：<input name="telephone" id="telephone" size="20" /></td>
					</tr>

		    		
		    	</table>
		    </td></tr>
			<tr><td class="main_tdbor"></td></tr>
			
			<tr><td align="left" class="fftd"><input type="submit" value="添加">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
		  </table>
		 </form>
	</td>
  </tr>
</table>
<div style="height:10px;"></div>
</body>
</html>