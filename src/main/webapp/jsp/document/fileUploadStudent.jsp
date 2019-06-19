<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>宿舍管理系统——学员头像上传</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="${pageContext.request.contextPath}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${pageContext.request.contextPath }/js/metronic/plugins/bootstrap/js/jquery-3.2.1.min.js"></script>
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
	<tr valign="top">
		<td>
			<form action="${pageContext.request.contextPath}/student/updateStudent" id="studentForm" method="post">
				<input name="stuId" type="hidden" id="stuId" value="${student.stuId}" size="20" />
				<table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
					<tr><td class="font3 fftd">
						<table>




							<tr>
								<td class="font3 fftd">姓&nbsp;&nbsp;名：<input name="stuName" id="stuName" value="${student.stuName}" size="20" /></td>
								<td class="font3 fftd">照片上传：<input name="image" type="file" id="stuPhone"  size="20" /></td>
							</tr>




						</table>
					</td></tr>
					<tr><td class="main_tdbor"></td></tr>

					<tr><td align="left" class="fftd"><input type="submit" value="上传">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
				</table>
			</form>
		</td>
	</tr>
</table>
<div style="height:10px;"></div>
</body>
</html>