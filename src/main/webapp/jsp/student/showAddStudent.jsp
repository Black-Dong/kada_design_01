<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>宿舍管理系统——添加学员</title>
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
		//修改宿舍楼时  查询宿舍的信息
		function changeDormitory(dorSelect){
			//当修改宿舍楼时 访问服务器 动态的获得信息
			$.ajax({
				url:"${pageContext.request.contextPath}/student/getAjaxRoomList",//访问路径
				data:'{"dorId":"'+dorSelect.value+'"}' , //请求参数 {"key":"value"}
                dataType : "json", //返回值类型
                type:"post", //请求类型
				success:function(data){
				    var tempStr = "<option value=''>请选择</option>";//设置option信息
				    $(data).each(function(){

				        //开始拼接下拉框 注意 this等效每一个room对象
                        tempStr+="<option value="+this.roomId+">"+this.roomName+"</option>";
					});

				    //重新赋值 下拉框数据
				    $("#roomSelect").html(tempStr);
				},//成功的回调函数
				contentType:"application/json;charset=utf-8"//请求的的数据类型
			});
		}


		function changeRoom(roomSelect){
			//当修改宿舍时 访问服务器 动态的获得信息
            $.ajax({
                url:"${pageContext.request.contextPath}/student/getAjaxBedRoomList",//访问路径
                data:'{"roomId":"'+roomSelect.value+'"}' , //请求参数 {"key":"value"}
                dataType : "json", //返回值类型
                type:"post", //请求类型
                success:function(data){
                    var tempStr = "<option value=''>请选择</option>";//设置option信息
                    $(data).each(function(){

                        //开始拼接下拉框 注意 this等效每一个room对象
                        tempStr+="<option value="+this.bedId+">"+this.roomBedName+"</option>";
                    });

                    //重新赋值 下拉框数据
                    $("#bedRoomSelect").html(tempStr);
                },//成功的回调函数
                contentType:"application/json;charset=utf-8"//请求的的数据类型
            });
		}
	</script>
</head>
	<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td>
				<form action="${pageContext.request.contextPath}/student/addStudent" id="studentForm" method="post">
					<input name="stuId" type="hidden" id="stuId" value="${student.stuId}" size="20" />
					<table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
						<tr><td class="font3 fftd">
							<table>
								<tr>
									<td class="font3 fftd">&nbsp;宿舍楼：

										<select name="dormitory.dorId" onchange="changeDormitory(this)">
											<option value="">请选择</option>
											<c:forEach items="${dormitoryList}" var = "dormitory">
												<option value="${dormitory.dorId}">${dormitory.dorName}</option>
											</c:forEach>
										</select>
									</td>

									<td class="font3 fftd">宿&nbsp;&nbsp;舍：
										<select id="roomSelect" name="room.roomId" onchange="changeRoom(this)">
											<option value="">请选择</option>
										</select>
									</td>
								</tr>

								<tr>
									<td class="font3 fftd">床&nbsp;&nbsp;位：
										<select id="bedRoomSelect" name="bedRoom.bedId" id="bedRoomId">
											<option value="">请选择</option>
										</select>
									</td>


								</tr>

								<tr>
									<td class="font3 fftd">姓&nbsp;&nbsp;名：<input name="student.stuName" id="stuName" value="${student.stuName}" size="20" /></td>
									<td class="font3 fftd">电&nbsp;&nbsp;话：<input name="student.stuPhone" id="stuPhone" value="${student.stuPhone}" size="20" /></td>
								</tr>
								<tr>
									<td class="font3 fftd">家庭电话：<input name="student.stuFamilyPhone" id="stuFamilyPhone" value="${student.stuFamilyPhone}" size="20" /></td>
									<td class="font3 fftd">学员导师：<input name="student.stuTeacherName" id="stuTeacherName" value="${student.stuTeacherName}" size="20" /></td>
								</tr>
								<tr>
									<td class="font3 fftd">导师电话：<input name="student.stuTeacherPhone" id="stuTeacherPhone" value="${student.stuTeacherPhone}" size="20" /></td>
									<td class="font3 fftd">家庭住址：<input name="student.stuAddress" id="stuAddress" size="20" value="${student.stuAddress}" /></td>
								</tr>
								<tr>
									<td class="font3 fftd">性&nbsp;&nbsp;别：
										<select name ="student.stuGender" id="stuGender" >
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

						<tr><td align="left" class="fftd"><input type="submit" value="保存">&nbsp;&nbsp;<input type="reset" value="取消 "></td></tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
	<div style="height:10px;"></div>
	</body>
</html>