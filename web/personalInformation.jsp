<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/10
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css/layui/css/layui.css">
    <%--引入css文件--%>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/jquery.validate.js"></script>

    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body style="height: 700px" >
<h1 style="color: #009688;text-align: center" >个人信息</h1>
<hr>
<div style="border: #1E9E97 1px solid;margin-left: 180px ;margin-right:180px; ">
    <form class="layui-form layui-form-pane" action="" style="padding:5px 0px">
        <div style="padding:0px 0px ; height: 36px;background-color: #1E9E97;color: #111111;text-align: left ;line-height:31px">个人基本信息</div>
        <table border="0px" align="center" style="width: 100%;padding: 10px">
            <tbody >
            <tr >
                <td align="right" style="width: 90px">工号：</td>
                <td align="lelf">
                    <label style="width: 90px">1000000001</label>
                </td>
                <td align="right" style="width: 90px">用户名：</td>
                <td align="lelf">
                    <label style="width: 90px">水木年华</label>
                </td>
                <td align="right" style="width: 90px">姓名：</td>
                <td align="lelf">
                    <label style="width: 90px">莫辛华</label>
                </td>
                <td rowspan="11" align="left">
                    <input type="hidden"  value="1">
                    <div class="person_image">
                        <img alt="person_image" style="width: 120px;height: 140px;margin-top: 5px" src="imgs/user6.jpg" border="0">
                    </div>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">用户密码：</td>
                <td align="lelf">
                    <label style="width: 90px">100001</label>
                </td>
                <td align="right" style="width: 90px">工作单位：</td>
                <td align="lelf">
                    <label style="width: 90px">前端设计</label>
                </td>
                <td align="right" style="width: 90px">工作职位：</td>
                <td align="lelf">
                    <label style="width: 90px">普通员工</label>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">入职日期：</td>
                <td align="lelf">
                    <label style="width: 90px">2020.10.11</label>
                </td>
                <td align="right" style="width: 90px">联系电话：</td>
                <td align="lelf">
                    <label style="width: 90px">18024252192</label>
                </td>
                <td align="right" style="width: 90px">工作邮箱：</td>
                <td align="lelf">
                    <label style="width: 90px">2889457635@qq.com</label>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 90px">性别：</td>
                <td align="lelf">
                    <label style="width: 90px">女</label>
                </td>
                <td align="right" style="width: 90px">备注：</td>
                <td align="lelf">
                    <label style="width: 90px"></label>
                </td>
            </tr>
            </tbody>
        </table>
        <div style="padding:0px 0px ; height: 36px;background-color: #1E9E97;color: #111111;text-align: left ;line-height:30px">个人生源信息</div>
        <table border="0px" align="center" style="width: 100%;padding: 10px">
            <tbody >
            <tr >
                <td align="right" style="width: 90px">工号：</td>
                <td align="lelf">
                    <label style="width: 90px">1000000001</label>
                </td>
                <td align="right" style="width: 90px">用户名：</td>
                <td align="lelf">
                    <label style="width: 90px">水木年华</label>
                </td>
                <td align="right" style="width: 90px">姓名：</td>
                <td align="lelf">
                    <label style="width: 90px">莫辛华</label>
                </td>
                <td rowspan="11" align="left">
                    <input type="hidden" id="" value="1">
                    <div class="person_image">
                        <img alt="person_image" style="width: 120px;height: 140px;margin-top: 5px" src="imgs/user6.jpg" border="0">
                    </div>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">用户密码：</td>
                <td align="lelf">
                    <label style="width: 90px">100001</label>
                </td>
                <td align="right" style="width: 90px">工作单位：</td>
                <td align="lelf">
                    <label style="width: 90px">前端设计</label>
                </td>
                <td align="right" style="width: 90px">工作职位：</td>
                <td align="lelf">
                    <label style="width: 90px">普通员工</label>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">入职日期：</td>
                <td align="lelf">
                    <label style="width: 90px">2020.10.11</label>
                </td>
                <td align="right" style="width: 90px">联系电话：</td>
                <td align="lelf">
                    <label style="width: 90px">18024252192</label>
                </td>
                <td align="right" style="width: 90px">工作邮箱：</td>
                <td align="lelf">
                    <label style="width: 90px">2889457635@qq.com</label>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 90px">性别：</td>
                <td align="lelf">
                    <label style="width: 90px">女</label>
                </td>
                <td align="right" style="width: 90px">备注：</td>
                <td align="lelf">
                    <label style="width: 90px"></label>
                </td>
            </tr>
            </tbody>
        </table>
        <div style="padding:0px 0px ; height: 36px;background-color: #1E9E97;color: #111111;text-align: left ;line-height:30px">个人家庭信息</div>
        <table border="0px" align="center" style="width: 100%;padding: 10px">
            <tbody >
            <tr >
                <td align="right" style="width: 90px">工号：</td>
                <td align="lelf">
                    <label style="width: 90px">1000000001</label>
                </td>
                <td align="right" style="width: 90px">用户名：</td>
                <td align="lelf">
                    <label style="width: 90px">水木年华</label>
                </td>
                <td align="right" style="width: 90px">姓名：</td>
                <td align="lelf">
                    <label style="width: 90px">莫辛华</label>
                </td>
                <td rowspan="11" align="left">
                    <input type="hidden" id="txpath" value="1">
                    <div class="person_image">
                        <img alt="person_image" style="width: 120px;height: 140px;margin-top: 5px" src="imgs/user6.jpg" border="0">
                    </div>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">用户密码：</td>
                <td align="lelf">
                    <label style="width: 90px">100001</label>
                </td>
                <td align="right" style="width: 90px">工作单位：</td>
                <td align="lelf">
                    <label style="width: 90px">前端设计</label>
                </td>
                <td align="right" style="width: 90px">工作职位：</td>
                <td align="lelf">
                    <label style="width: 90px">普通员工</label>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">入职日期：</td>
                <td align="lelf">
                    <label style="width: 90px">2020.10.11</label>
                </td>
                <td align="right" style="width: 90px">联系电话：</td>
                <td align="lelf">
                    <label style="width: 90px">18024252192</label>
                </td>
                <td align="right" style="width: 90px">工作邮箱：</td>
                <td align="lelf">
                    <label style="width: 90px">2889457635@qq.com</label>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 90px">性别：</td>
                <td align="lelf">
                    <label style="width: 90px">女</label>
                </td>
                <td align="right" style="width: 90px">备注：</td>
                <td align="lelf">
                    <label style="width: 90px"></label>
                </td>
            </tr>
            </tbody>
        </table>
        <div style="padding:0px 0px ; height: 36px;background-color: #1E9E97;color: #111111;text-align: left ;line-height:30px">个人简历信息</div>
        <table border="0px" align="center" style="width: 100%;padding: 10px">
            <tbody >
            <tr >
                <td align="right" style="width: 90px">工号：</td>
                <td align="lelf">
                    <label style="width: 90px">1000000001</label>
                </td>
                <td align="right" style="width: 90px">用户名：</td>
                <td align="lelf">
                    <label style="width: 90px">水木年华</label>
                </td>
                <td align="right" style="width: 90px">姓名：</td>
                <td align="lelf">
                    <label style="width: 90px">莫辛华</label>
                </td>
                <td rowspan="11" align="left">
                    <input type="hidden" id="txpath" value="1">
                    <div class="person_image">
                        <img alt="person_image" style="width: 120px;height: 140px;margin-top: 5px" src="imgs/user6.jpg" border="0">
                    </div>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">用户密码：</td>
                <td align="lelf">
                    <label style="width: 90px">100001</label>
                </td>
                <td align="right" style="width: 90px">工作单位：</td>
                <td align="lelf">
                    <label style="width: 90px">前端设计</label>
                </td>
                <td align="right" style="width: 90px">工作职位：</td>
                <td align="lelf">
                    <label style="width: 90px">普通员工</label>
                </td>
            </tr>
            <tr >
                <td align="right" style="width: 90px">入职日期：</td>
                <td align="lelf">
                    <label style="width: 90px">2020.10.11</label>
                </td>
                <td align="right" style="width: 90px">联系电话：</td>
                <td align="lelf">
                    <label style="width: 90px">18024252192</label>
                </td>
                <td align="right" style="width: 90px">工作邮箱：</td>
                <td align="lelf">
                    <label style="width: 90px">2889457635@qq.com</label>
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 90px">性别：</td>
                <td align="lelf">
                    <label style="width: 90px">女</label>
                </td>
                <td align="right" style="width: 90px">备注：</td>
                <td align="lelf">
                    <label style="width: 90px"></label>
                </td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
</body>
</html>
