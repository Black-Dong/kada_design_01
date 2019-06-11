<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>宿舍管理系统——床位入住</title>
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
	<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：床位管理  &gt; 床位入住</td>
	<td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locright.gif" width="15" height="32"></td>
  </tr>
</table>
<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
  <tr valign="top">
    <td>
    	 <form action="${pageContext.request.contextPath}/bedroom/inRoom" id="userForm" method="post">
    	 	<!-- 隐藏表单，flag表示添加标记 -->
    	 	<input type="hidden" name="flag" value="2">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr><td class="font3 fftd">
		    	<table>
		    		<tr>
		    			<td class="font3 fftd">&nbsp;宿舍楼：
							<input name="bedId" type="hidden" value="${bedRoom.bedId}" size="20" />
							<input name="room.bedRoom.dormitory.dorId" id="dorId" value="${bedRoom.room.dormitory.dorName}" size="20" />
							<input name="isFlag" type="hidden" id="isFlag" value="Y" size="20" />
						</td>

		    			<td class="font3 fftd">宿&nbsp;&nbsp;舍：<input type="text" name="bedRoom.room.roomName" id="roomName" size="20" value="${bedRoom.room.roomName}"/>
							<input type="hidden"  name="room.roomId" size="20" ${bedRoom.room.roomId}/>
						</td>
		    		</tr>
		    			
		    		<tr>
		    			<td class="font3 fftd">姓&nbsp;&nbsp;名：<input name="student.stuName" id="stuName" size="20" /></td>
		    			<td class="font3 fftd">电&nbsp;&nbsp;话：<input name="student.stuPhone" id="stuPhone" size="20" /></td>
		    		</tr>
					<tr>
						<td class="font3 fftd">家庭电话：<input name="student.stuFamilyPhone" id="stuFamilyPhone" size="20" /></td>
						<td class="font3 fftd">学员导师：<input name="student.stuTeacherName" id="stuTeacherName" size="20" /></td>
					</tr>
					<tr>
						<td class="font3 fftd">导师电话：<input name="student.stuTeacherPhone" id="stuTeacherPhone" size="20" /></td>
						<td class="font3 fftd">家庭住址：<input name="student.stuAddress" id="stuAddress" size="20" /></td>
					</tr>
					<tr>
						<td class="font3 fftd">性&nbsp;&nbsp;别：
							<select name ="student.stuGender" id="stuGender" >
								<option value="">请选择</option>
								<option value="男">男</option>
								<option value="女">女</option>
							</select>

						</td>

						<td class="font3 fftd"><%--房间的名称：<input name="roomName" id="roomName" size="20" />--%></td>
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