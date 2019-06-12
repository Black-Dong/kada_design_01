<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>宿舍管理系统 ——宿舍管理</title>
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
	 			   $.ligerDialog.error("请选择一个需要删除的信息！");
	 		   }else{
	 			   /** 得到用户选中的所有的需要删除的ids */
	 			   var ids = checkedBoxs.map(function(){
	 				   return this.value;
	 			   })
					// alert(ids);
	 			   $.ligerDialog.confirm("确认要删除吗?","删除信息",function(r){
	 				   if(r){
	 				       // alert(ids.get())
	 					   window.location = "${pageContext.request.contextPath }/dormitory/deleteById?ids=" + ids.get();
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
		<td class="main_locbg font2"><img src="${pageContext.request.contextPath}/images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：宿舍楼管理 &gt; 宿舍楼查询</td>
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
				  <form name="userForm" method="post" id="userForm" action="${pageContext.request.contextPath}/user/userList">
					  <table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
							  <td class="font3">
								  <input id="delete" type="button" value="删除"/>
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
			  <td>宿舍楼名称</td>
			  <td>所属宿管名称</td>

			  <td align="center">操作</td>
			</tr>
			<c:forEach items="${dormitoryList}" var="dormitory" varStatus="stat">
				<tr id="data_${stat.index}" align="center" class="main_trbg" >
					<td><input type="checkbox" id="box_${stat.index}" value="${dormitory.dorId}"></td>
					  <td>${dormitory.dorName}</td>
					  <td>${dormitory.user.name }</td>

					 <td align="center" width="40px;"><a href="${pageContext.request.contextPath}/dormitory/updateDormitoryUI?dorId=${dormitory.dorId}">
							<img title="修改" src="${pageContext.request.contextPath}/images/update.gif"/></a>
					  </td>
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