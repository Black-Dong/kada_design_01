<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>宿舍管理系统——修改学员</title>
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
		function changeRoom(roomSelect) {
            var roomId=  roomSelect.value;
            $.ajax({
				url:'${pageContext.request.contextPath}/student/changeRoom',
                data:'{"roomId":"'+roomId+'"}',
				type:'post',
				dataType:'json',
				success:function(data){
				    var tempStr = "";
				    $(data).each(function(){
				        tempStr+="<option value='"+this.bedId+"'>"+this.roomBedName+"</option>";
					});
				    alert(tempStr);
					$("#bedRoomId").html(tempStr);
				},
				contentType:'application/json;charset=UTF-8'
			})
        }

		

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
								<td class="font3 fftd">&nbsp;宿舍楼：
									<select>
										<option value="${student.bedRoom.room.dormitory.dorId}">${student.bedRoom.room.dormitory.dorName}</option>
									</select>
								</td>

								<td class="font3 fftd">宿&nbsp;&nbsp;舍：
									<select id="roomSelect" name="bedRoom.room.roomId" onchange="changeRoom(this)">
										<c:forEach items="${roomList}" var="room">
											<option ${student.bedRoom.room.roomId ==room.roomId ?"selected" : ""} value="${room.roomId}">${room.roomName}</option>
										</c:forEach>
									</select>
								</td>
							</tr>

							<tr>
								<td class="font3 fftd">床&nbsp;&nbsp;位：
									<select name="bedRoom.bedId" id="bedRoomId">
										<option selected value="${student.bedRoom.bedId}">${student.bedRoom.roomBedName}</option>
										<c:forEach items="${bedRoomList}" var="bedRoom">
											<option value="${bedRoom.bedId}">${bedRoom.roomBedName}</option>
										</c:forEach>

									</select>
								</td>


							</tr>

							<tr>
								<td class="font3 fftd">姓&nbsp;&nbsp;名：<input name="stuName" id="stuName" value="${student.stuName}" size="20" /></td>
								<td class="font3 fftd">电&nbsp;&nbsp;话：<input name="stuPhone" id="stuPhone" value="${student.stuPhone}" size="20" /></td>
							</tr>
							<tr>
								<td class="font3 fftd">家庭电话：<input name="stuFamilyPhone" id="stuFamilyPhone" value="${student.stuFamilyPhone}" size="20" /></td>
								<td class="font3 fftd">学员导师：<input name="stuTeacherName" id="stuTeacherName" value="${student.stuTeacherName}" size="20" /></td>
							</tr>
							<tr>
								<td class="font3 fftd">导师电话：<input name="stuTeacherPhone" id="stuTeacherPhone" value="${student.stuTeacherPhone}" size="20" /></td>
								<td class="font3 fftd">家庭住址：<input name="stuAddress" id="stuAddress" size="20" value="${student.stuAddress}" /></td>
							</tr>
							<tr>
								<td class="font3 fftd">性&nbsp;&nbsp;别：
									<select name ="stuGender" id="stuGender" >
										<option value="">请选择</option>
										<option ${student.stuGender=="男" ? "selected" : ""} value="男">男</option>
										<option  ${student.stuGender=="女" ? "selected" : ""} value="女">女</option>
									</select>

								</td>

								<td class="font3 fftd"><%--房间的名称：<input name="roomName" id="roomName" size="20" />--%></td>
							</tr>


						</table>
					</td></tr>
					<tr><td class="main_tdbor"></td></tr>

					<tr><td align="left" class="fftd"><input type="submit" value="修改">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
				</table>
			</form>
		</td>
	</tr>
</table>
<div style="height:10px;"></div>
</body>
</html>