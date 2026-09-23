<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/11
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="js/jquery.validate.js"></script>
<style>
    .opt-container
    {
        width:100%;
        height:80%;
        display: flex;
        justify-content: flex-start;
        align-items: start;
    }
    .xgmm-container
    {
        width:60%;
        height:400px;
        display: flex;
        justify-content: flex-start;
        align-items: start;
    }
    .xgmm-form {
        width: 100%;
    }
</style>
</head>
<body style="padding:20px">
<h1 style="color: #009688;text-align: center" >修改密码</h1>
<hr>
<div class="opt-container">
    <div class="xgmm-container">
        <form class="layui-form xgmm-form" action="xgmm.do" id="xgmmf">
            <div class="layui-form-item">
                <label class="layui-form-label">旧密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password_old" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password_new" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">确认密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password_conf" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button type="submit" id="xgmm" class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
