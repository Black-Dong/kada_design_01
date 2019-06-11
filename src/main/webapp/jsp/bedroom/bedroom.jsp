<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>宿舍管理系统——床位管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="${pageContext.request.contextPath}/js/metronic/plugins/bootstrap/css/bootstrap.css" type="text/css" rel="stylesheet" />

	<link href="${pageContext.request.contextPath}/css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="${pageContext.request.contextPath}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />

	<script type="text/javascript" src="${pageContext.request.contextPath }/js/metronic/plugins/bootstrap/js/jquery-3.2.1.min.js"></script>

	<script src="${pageContext.request.contextPath}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
	<script src="${pageContext.request.contextPath}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>

	<link href="${pageContext.request.contextPath}/css/pager.css" type="text/css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/js/metronic/plugins/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function(){
	 	   /** 获取上一次选中的部门数据 */
	 	   var boxs  = $("input[type='checkbox'][id^='box_']");
	 	   
	 	  /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
	    	$("tr[id^='data_']").hover(function(){
	    		$(this).css("backgroundColor","#eeccff");
	    	},function(){
	    		$(this).css("backgroundColor","#ffffff");
	    	})
	    	
	    	
	 	   /** 删除员工绑定点击事件 */
	 	   $("#delete").click(function(){
	 		   /** 获取到用户选中的复选框  */
	 		   var checkedBoxs = boxs.filter(":checked");
	 		   if(checkedBoxs.length < 1){
	 			   $.ligerDialog.error("请选择一个需要删除的用户！");
	 		   }else{
	 			   /** 得到用户选中的所有的需要删除的ids */
	 			   var ids = checkedBoxs.map(function(){
	 				   return this.value;
	 			   })

	 			   $.ligerDialog.confirm("确认要删除吗?","删除用户",function(r){
	 				   if(r){
	 					   window.location = "${pageContext.request.contextPath }/user/deleteById?ids=" + ids.get();
	 				   }
	 			   });
	 		   }
	 	   })
	    })
	</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：床位管理 &gt; 床位查询</td>
		<td width="15" height="32"><img src="${pageContext.request.contextPath}/images/main_locright.gif" width="15" height="32"></td>
	  </tr>
	</table>
	
	<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
				  <form name="bedRoomForm" method="post" id="bedRoomForm" action="${pageContext.request.contextPath}/bedroom/bedRoomList">
					  <table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
								<td class="font3">
								  宿舍楼：
								  <select name ="bedRoom.room.dormitory.dorId" id="">
									  <option value="">请选择</option>

									  <c:forEach items="${dormitoryList}" var="dormitory">
									  	<option value="${dormitory.dorId}" ${pageBeanUI.bedRoom.room.dormitory.dorId==dormitory.dorId ? "selected":""} >${dormitory.dorName}</option>
									  </c:forEach>
								  </select>
									宿舍:<input type="text" name="bedRoom.room.roomName" value="${pageBeanUI.bedRoom.room.roomName}">
								  是否空床：
								  <select name="bedRoom.isFlag">
								  	 <option value="">请选择</option>
										<option value="Y" ${pageBeanUI.bedRoom.isFlag=="Y" ? "selected":""}>是</option>
										<option value="N" ${pageBeanUI.bedRoom.isFlag=="N" ? "selected":""}>否</option>
									  </select>
							  		</select>
								  <input type="hidden" id="pageNumberId" name="pageNumber" value="1"/>
								  <input type="submit" value="搜索"/>

							  </td>
						  </tr>
					  </table>
				  </form>
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  
	  <!-- 数据展示区 -->
	  <tr valign="top">
	    <td height="20">
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tr class="main_trbg_tit" align="center">
			  <td><input type="checkbox" name="checkAll" id="checkAll"></td>
			  <td>宿舍楼</td>
			  <td>宿舍</td>
			  <td>床位编号</td>
			  <td>宿管名称</td>

			  <td>是否空床</td>
			  <td>是否入住</td>
			  <td>性别</td>

			</tr>
			<c:forEach items="${pageBean.data}" var="bedRoom" varStatus="stat">
				<tr id="data_${stat.index}" align="center" class="main_trbg" >
					<td><input type="checkbox" id="box_${stat.index}" value="${user.uid}"></td>
					 <td>${bedRoom.room.dormitory.dorName }</td>
					  <td>${bedRoom.room.roomName}</td>
					  <td>${bedRoom.roomBedName}</td>
					  <td>${bedRoom.room.dormitory.user.name }</td>

					  <td>${bedRoom.isFlag =="N" ? "空床" :bedRoom.student.stuName }</td>
					  <td>
					  		<c:if test="${bedRoom.isFlag =='N'}">
								<a href='${pageContext.request.contextPath}/bedroom/inRoomUI?bedId=${bedRoom.bedId }'>未入住</a>
							</c:if>
						  <c:if test="${bedRoom.isFlag !='N'}">
							  <a href='javascript:void(0)' onclick="outRoom(${bedRoom.bedId })">退住</a>
						  </c:if>
					  </td>
					  <td>${empty bedRoom.student? '' :bedRoom.student.stuGender}</td>

				</tr>
			</c:forEach>
		  </table>
		</td>
	  </tr>

		<script>
			function userPageMethod(pageNumber){
				$("#pageNumberId").val(pageNumber);
				var params = $("#userForm").serialize();
				location.href="${pageContext.request.contextPath}/user/userList?"+params;
			}
			function outRoom(bedId){
                $.ligerDialog.confirm("确认要退住吗?","退住",function(r){
                    if(r){
                        alert(bedId);
                        window.location = "${pageContext.request.contextPath }/bedroom/outRoom?bedId=" + bedId;
                    }
                });
			}
		</script>
	  <!-- 分页标签 -->
	  <tr valign="top"><td align="center" class="font3">
		  <nav aria-label="Page navigation">
			  <ul class="pagination">
				  <li>
					  <a href="javascript:void(0)" onclick="userPageMethod(1)" aria-label="Previous">
						  <span aria-hidden="true">&laquo;</span>
					  </a>
				  </li>
				  <li>
					  <a href="javascript:void(0)" onclick="userPageMethod(${pageBean.pageNumber-1})"  aria-label="Previous">
						  <span aria-hidden="true">上页</span>
					  </a>
				  </li>

				  <c:forEach begin="${pageBean.start}" end="${pageBean.end}" var="num">
				  	<li ${pageBean.pageNumber==num ? 'class="active"' : ""} ><a href="javascript:void(0)" onclick="userPageMethod(${num})">${num}</a></li>
				  </c:forEach>
				  <li>
					  <a href="javascript:void(0)" onclick="userPageMethod(${pageBean.pageNumber+1})" aria-label="Next">
						  <span aria-hidden="true">下页</span>
					  </a>
				  </li>
				  <li>
					  <a href="javascript:void(0)" onclick="userPageMethod(${pageBean.totalPage})" aria-label="Next">
						  <span aria-hidden="true">&raquo;</span>
					  </a>
				  </li>
			  </ul>
		  </nav>
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>