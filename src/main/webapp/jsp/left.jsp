<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="seurity" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>宿舍管理系统 ——后台管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.js"></script>
		<script language="javascript" type="text/javascript"> 
			$(function(){
				/** 给左侧功能菜单绑定点击事件  */
				$("td[id^='navbg']").click(function(){
				   	 /** 获取一级菜单的id */
				   	 var navbgId = this.id;
				   	 /** 获取对应的二级菜单id */
				   	 var submenuId = navbgId.replace('navbg','submenu');
				   	 /** 控制二级菜单显示或隐藏  */
				   	 $("#"+submenuId).toggle();
				   	 /** 控制关闭或者开启的图标*/
				   	 $("#"+navbgId).toggleClass("left_nav_expand");
				   	 
				   	 /** 控制其他的一级菜单的二级菜单隐藏按钮都关闭  */
				   	 $("tr[id^='submenu']").not("#"+submenuId).hide();
				   	 /** 控制其他一级菜单的图片显示关闭  */
				   	 $("td[id^='navbg']").not(this).removeClass().addClass("left_nav_closed");
				})
			})
		</script>
	</head>
<body>
	<div style="margin:10px;background-color:#FFFFFF; text-align:left;">
		<table width="200" height="100%" border="0" cellpadding="0" cellspacing="0" class="left_nav_bg">

	<seurity:authorize access="hasRole('ROLE_1')">
		<tr><td class="left_nav_top"><div class="font1">宿管管理</div></td></tr>
		  <tr valign="top">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/userList" target="main">宿管查询</a></p>
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/jsp/user/showAddUser.jsp" target="main">添加宿管</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  <tr><td id="navbg1" class="left_nav_closed" ><div class="font1">宿舍楼管理</div></td></tr>
		  <tr valign="top" id="submenu1" style="display: none">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/dormitory/dormitoryList" target="main">宿舍楼查询</a></p>
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/dormitory/showAdd" target="main">宿舍楼添加</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
	</seurity:authorize>


		  <tr><td id="navbg2" class="left_nav_closed" ><div class="font1">宿舍管理</div></td></tr>
		  <tr valign="top" id="submenu2" style="display: none">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/room/roomList" target="main">宿舍查询</a></p>
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/room/addRoomUI" target="main">添加宿舍</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>

		  <tr><td id="navbg3" class="left_nav_closed" ><div class="font1">床位管理</div></td></tr>
		  <tr valign="top" id="submenu3" style="display: none">
		    <td class="left_nav_bgshw" height="50">
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/bedroom/bedRoomList" target="main">床位查询</a></p>
			  <%--<p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/employee/addEmployee?flag=1" target="main">添加床位</a></p>--%>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		  
		  <tr><td id="navbg4" class="left_nav_closed" ><div class="font1">学生管理</div></td></tr>
		  <tr valign="top" id="submenu4" style="display: none">
		    <td class="left_nav_bgshw tdbtmline" height="50">
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/student/studentList" target="main">学生查询</a></p>
			  <p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/student/addStudentUI" target="main">添加学生</a></p>
			</td>
		  </tr>
		  <%--<tr><td height="2"></td></tr>

			<tr><td id="navbg5" class="left_nav_closed" ><div class="font1">选课管理</div></td></tr>
			<tr valign="top" id="submenu5" style="display: none">
				<td class="left_nav_bgshw tdbtmline" height="50">
					<p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/notice/selectNotice" target="main">选课查询</a></p>
					<p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/notice/addNotice?flag=1" target="main">学员选课</a></p>
				</td>
			</tr>
			<tr><td height="2"></td></tr>--%>

			<tr><td id="navbg6" class="left_nav_closed" ><div class="font1">公告管理</div></td></tr>
			<tr valign="top" id="submenu6" style="display: none">
				<td class="left_nav_bgshw tdbtmline" height="50">
					<p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/notice/selectNotice" target="main">公告查询</a></p>
					<p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/notice/addNotice?flag=1" target="main">添加公告</a></p>
				</td>
			</tr>
			<tr><td height="2"></td></tr>
		  
		  <tr><td id="navbg7" class="left_nav_closed" onClick="showsubmenu(5)"><div class="font1">下载中心</div></td></tr>
		  <tr valign="top" id="submenu7" style="display: none">
		    <td class="left_nav_bgshw tdbtmline" height="50">
		    	<p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/document/selectDocument" target="main">文档查询</a></p>
			  	<p class="left_nav_link"><img src="${pageContext.request.contextPath}/images/left_nav_arrow.gif">&nbsp;&nbsp;<a href="${pageContext.request.contextPath }/document/addDocument?flag=1" target="main">上传文档</a></p>
			</td>
		  </tr>
		  <tr><td height="2"></td></tr>
		 

		</table>
	</div>
</body>
</html>