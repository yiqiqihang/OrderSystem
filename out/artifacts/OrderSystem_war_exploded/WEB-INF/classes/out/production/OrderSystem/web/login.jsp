<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: 86180--%>
<%--  Date: 2022/9/20--%>
<%--  Time: 15:28--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>企业内部餐厅管理系统</title>--%>
<%--    <link rel="stylesheet" href="logincss/css/supersized.css">--%>
<%--    <link rel="stylesheet" href="logincss/css/login.css">--%>
<%--    <script src="logincss/js/jquery-1.8.2.min.js" ></script>--%>
<%--    <script src="logincss/js/supersized.3.2.7.min.js"></script>--%>
<%--    <script src="logincss/js/supersized-init.js"></script>--%>
<%--    <script src="js/jquery-3.5.1.min.js"></script>--%>
<%--    <script src="js/jquery.validate.js"></script>--%>
<%--    &lt;%&ndash;    登录界面的css样式&ndash;%&gt;--%>
<%--    <style>--%>
<%--        *{--%>
<%--            margin: 0 auto;--%>
<%--            padding: 0;--%>
<%--        }--%>
<%--        /*#表示id选择器，一个页面中只能有一个，唯一的*/--%>
<%--        #div1{--%>
<%--            width: 450px;--%>
<%--            height: 380px;--%>
<%--            background-color: #FFFFFF;--%>
<%--            position: absolute;--%>
<%--            top: 370px;--%>
<%--            right: 300px;--%>
<%--            border-radius: 10px;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        #sp1{--%>
<%--            margin-top: 30px;--%>
<%--            font-size: 25px;--%>
<%--            font-weight: bold;--%>
<%--            color: #01AAED;--%>

<%--        }--%>
<%--        table{--%>
<%--            margin-top: 30px;--%>
<%--            border-spacing: 5px 25px;--%>
<%--        }--%>
<%--        table tr td input{--%>
<%--            width: 260px;--%>
<%--            height: 35px;--%>
<%--            border: 1px #01AAED solid;--%>
<%--            border-radius: 3px;--%>
<%--        }--%>
<%--        .tx1{--%>
<%--            color: #01AAED;--%>
<%--        }--%>
<%--        .sub{--%>
<%--            width: 100px;--%>
<%--            height: 40px;--%>
<%--            color: #FFFFFF;--%>
<%--            font-size: 16px;--%>
<%--            border: none;--%>
<%--            background-color: #01AAED;--%>
<%--            font-weight: bold;--%>
<%--            border-radius: 5px;--%>
<%--        }--%>
<%--        .sub:hover{--%>
<%--            background-color: #2D93CA;--%>
<%--        }--%>
<%--        #sp2{--%>
<%--            font-size: 11px;--%>
<%--        }--%>
<%--        #sp2:hover{--%>
<%--            color: #0C0C0C;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="div1">--%>
<%--    <div id="sp1">企业内部餐厅管理系统</div>--%>
<%--    <form action="LoginService" id="form2">--%>
<%--        <table>--%>
<%--            <tr>--%>
<%--                <td><span class="tx1">账号</span></td>--%>
<%--                <td><input type="text" name="username"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><span class="tx1">密码</span></td>--%>
<%--                <td><input type="password" name="password"></td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td><span class="tx1" >验证码</span></td>--%>
<%--                <td style="position: relative"><input type="text" style="width: 100px" name="checkcode">--%>
<%--                    <a href="javascript:void(0)">--%>
<%--                        <img id="codePic" src="CheckCodeUtile" alt="" onclick="sfCode()" height="35"--%>
<%--                             style="position: absolute;right: 55px;width: 90px;height: 32px;border: 1px #000000 solid"></a>--%>

<%--                    <a href="javascript:void(0)" style="position: absolute;right: -40px;top: 10px;text-decoration: none ;color: #01AAED">--%>
<%--                        <span id="sp2" onclick="sfCode()">看不清，换一张</span>--%>
<%--                    </a>--%>
<%--                    <br>--%>
<%--                    <p style="color: red;font-size: 11px;margin-top: 5px;margin-left: 5px;">${loginMsg}</p>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td></td>--%>
<%--                <td><input type="submit" value="登&nbsp;&nbsp;录" class="sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="注&nbsp;&nbsp;册" class="sub"></td>--%>
<%--            &lt;%&ndash;                <td><input type="submit" onclick="javascript:window.location.href='main.jsp'"  value="登&nbsp;&nbsp;录" class="sub">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <input type="submit"   onclick="javascript:window.location.href='register.jsp'" value="注&nbsp;&nbsp;册" class="sub"></td>&ndash;%&gt;--%>
<%--            </tr>--%>
<%--        </table>--%>

<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--<script>--%>
<%--    //表单效验(表单传输到后台比较)--%>
<%--    $("#form2").validate({--%>
<%--        rules:{--%>
<%--            username:{--%>
<%--                /*表示不能为空*/--%>
<%--                required: true,--%>
<%--                maxlength:[11]--%>
<%--            },--%>
<%--            password:{--%>
<%--                required: true--%>
<%--            },--%>
<%--            checkcode:{--%>
<%--                required: true--%>
<%--            }--%>
<%--        },--%>
<%--        messages:{--%>
<%--            username:{--%>
<%--                required: "<span style='color:red;font-size:12px'><br>用户名不能为空</span>",--%>
<%--                maxlength: "<span style='color:red;font-size:12px'><br>最大不能超过11位数字</span>"--%>
<%--            },--%>
<%--            password:{--%>
<%--                required: "<span style='color:red;font-size:12px'><br>密码不能为空</span>"--%>
<%--            },--%>
<%--            checkcode:{--%>
<%--                required: "<span style='color:red;font-size:12px;position:absolute;left: 5px;top: -6px'><br>验证码不能为空</span>"--%>
<%--            }--%>
<%--        }--%>
<%--    })--%>
<%--    $(function () {--%>

<%--    })--%>
<%--    //验证码刷新函数--%>
<%--    function sfCode(){--%>
<%--        //获得图片,因为浏览器会抓缓存，所以要加一个时间戳--%>
<%--        $("#codePic").attr("src","CheckCodeUtile?"+new Date().getTime());--%>
<%--    }--%>
<%--    //session显示后需要将其清空--%>
<%--    var loginMsg = "${loginMsg}";--%>
<%--    if (loginMsg !=""){--%>
<%--        <%--%>
<%--        //清空session--%>
<%--        session.removeAttribute("loginMsg");--%>
<%--        %>--%>
<%--    }--%>
<%--</script>--%>
<%--</html>--%>
