<%--
  Created by IntelliJ IDEA.
  User: hzb
  Date: 2018/11/22
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <style>
        tr {
            line-height: 50px;
        }
    </style>
    <title>登陆页面</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
    <link href="${pageContext.request.contextPath}/js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/metronic/plugins/bootstrap/js/jquery-3.2.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script>
        function loginout(){
            $.ligerDialog.confirm("确认要删除吗?","删除用户",function(r){
                if(r){
                    window.location = "${pageContext.request.contextPath }/user/deleteById?ids=" + ids.get();
                }
            });
        }

    </script>
</head>
<body style="background-color: #F6F6F6;">
<div class="topDiv">
    <span>不一样的城市，一样的传智播客</span>
</div>
<div class="contentDiv">
    <div class="leftDiv">
        <img src="${pageContext.request.contextPath}/images/address.png" width="100%">
    </div>
    <div class="rightDiv">
        <div class="bannerDiv">
            <span>宿舍管理系统</span>
        </div>
        <div class="formDiv">
            <%--登陆表单--%>
            <form action="${pageContext.request.contextPath}/user/loginUser" method="post">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tr>
                        <td colspan="2">
                            <span class="msgSpan" id="errorMsg">${errorMsg}</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="leftTd">用户名:</td>
                        <td class="rightTd"><input class="inputTxt" type="text" name="username"></td>
                    </tr>
                    <tr>
                        <td class="leftTd">密码:</td>
                        <td class="rightTd"><input class="inputTxt" type="password" name="password"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <button type="submit">登录</button>
                        </td>
                    </tr>
                </table>
            </form>
            <div class="copyTxt">
                <span>地址:北京市顺义区京顺路99号黑马程序员</span>
            </div>
            <div class="copyTxt">
                <span> 电话:400-618-4000</span>
            </div>
        </div>
    </div>
</div>
</body>
</html>
