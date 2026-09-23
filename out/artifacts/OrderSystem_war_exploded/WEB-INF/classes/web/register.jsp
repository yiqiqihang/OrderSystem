<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/11
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        .register{
            margin: 20px;
            border: #1E9E97 1px solid
        }
       .hr{
           border: none;
           background-color: #1E9E97;
       }
       .h1{
           color: #009688;
           text-align: center;
           font-weight: bold;
           padding-top: 5px;
       }
    </style>
</head>
<body>
<div class="register">
    <h1 class="h1">注册用户</h1>
    <hr class="hr">
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入用户名" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="username" lay-verify="required" lay-reqtext="姓名是必填项，岂能为空？" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">联系电话</label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">工作邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">工作单位</label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">工号</label>
            <div class="layui-input-inline">
                <input type="tel" name="url" lay-verify="url" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-inline">
                <select name="quiz3">
                    <option value="">请选择您的角色</option>
                    <option value="企业员工">企业员工</option>
                    <option value="配菜员">配菜员</option>
                    <option value="厨房主管">厨房主管</option>
                    <option value="财务管理">财务管理</option>
                    <option value="餐厅经理">餐厅经理</option>
                </select>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">身份证号</label>
        <div class="layui-input-block">
            <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">账号密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">个人爱好</label>
        <div class="layui-input-block">
            <select name="interest" lay-filter="aihao">
                <option value="" selected="">请根据个人口味选择，让自己生活更美好噢</option>
                <option value="0">不辣</option>
                <option value="1">微辣</option>
                <option value="2">中辣</option>
                <option value="3">麻辣</option>
            </select>
        </div>
    </div>


<%--    <div class="layui-form-item">--%>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">分组选择框</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <select name="quiz">--%>
<%--                    <option value="">请选择问题</option>--%>
<%--                    <optgroup label="城市记忆">--%>
<%--                        <option value="你工作的第一个城市">你工作的第一个城市</option>--%>
<%--                    </optgroup>--%>
<%--                    <optgroup label="学生时代">--%>
<%--                        <option value="你的工号">你的工号</option>--%>
<%--                        <option value="你最喜欢的老师">你最喜欢的老师</option>--%>
<%--                    </optgroup>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">搜索选择框</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <select name="modules" lay-verify="required" lay-search="">--%>
<%--                    <option value="">直接选择或搜索选择</option>--%>
<%--                    <option value="1">layer</option>--%>
<%--                    <option value="2">form</option>--%>
<%--                    <option value="3">layim</option>--%>
<%--                    <option value="4">element</option>--%>
<%--                    <option value="5">laytpl</option>--%>
<%--                    <option value="6">upload</option>--%>
<%--                    <option value="7">laydate</option>--%>
<%--                    <option value="8">laypage</option>--%>
<%--                    <option value="9">flow</option>--%>
<%--                    <option value="10">util</option>--%>
<%--                    <option value="11">code</option>--%>
<%--                    <option value="12">tree</option>--%>
<%--                    <option value="13">layedit</option>--%>
<%--                    <option value="14">nav</option>--%>
<%--                    <option value="15">tab</option>--%>
<%--                    <option value="16">table</option>--%>
<%--                    <option value="17">select</option>--%>
<%--                    <option value="18">checkbox</option>--%>
<%--                    <option value="19">switch</option>--%>
<%--                    <option value="20">radio</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">联动选择框</label>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <select name="quiz1">--%>
<%--                <option value="">请选择省</option>--%>
<%--                <option value="浙江" selected="">浙江省</option>--%>
<%--                <option value="你的工号">江西省</option>--%>
<%--                <option value="你最喜欢的老师">福建省</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <select name="quiz2">--%>
<%--                <option value="">请选择市</option>--%>
<%--                <option value="杭州">杭州</option>--%>
<%--                <option value="宁波" disabled="">宁波</option>--%>
<%--                <option value="温州">温州</option>--%>
<%--                <option value="温州">台州</option>--%>
<%--                <option value="温州">绍兴</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="layui-input-inline">--%>
<%--            <select name="quiz3">--%>
<%--                <option value="">请选择县/区</option>--%>
<%--                <option value="西湖区">西湖区</option>--%>
<%--                <option value="余杭区">余杭区</option>--%>
<%--                <option value="拱墅区">临安市</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="layui-form-mid layui-word-aux">此处只是演示联动排版，并未做联动交互</div>--%>
<%--    </div>--%>

<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">复选框</label>--%>
<%--        <div class="layui-input-block">--%>
<%--            <input type="checkbox" name="like[write]" title="写作">--%>
<%--            <input type="checkbox" name="like[read]" title="阅读" checked="">--%>
<%--            <input type="checkbox" name="like[game]" title="游戏">--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">开关-默认关</label>--%>
<%--        <div class="layui-input-block">--%>
<%--            <input type="checkbox" name="close" lay-skin="switch" lay-text="ON|OFF">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="layui-form-item">--%>
<%--        <label class="layui-form-label">开关-默认开</label>--%>
<%--        <div class="layui-input-block">--%>
<%--            <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" lay-text="ON|OFF">--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="layui-form-item">
        <label class="layui-form-label">单选框</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
            <input type="radio" name="sex" value="禁" title="禁用" disabled="">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
        </div>
    </div>
    <!--<div class="layui-form-item layui-form-text">
      <label class="layui-form-label">编辑器</label>
      <div class="layui-input-block">
        <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
      </div>
    </div>-->
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
</div>
</body>
</html>
