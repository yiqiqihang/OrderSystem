<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/10
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>ADD</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="layui/css/layui.css"    media="all">
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item" lay-unselect="">
        <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img"></a>
        <dl class="layui-nav-child">
            <dd><a href="">个人信息</a></dd>
            <hr>
            <dd style="text-align: center;"><a href="">退出</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="index.jsp">首页</a>
        <dl class="layui-nav-child">
            <dd><a href="">用户数据</a></dd>
            <dd><a href="">历史订单</a></dd>
            <dd><a href="">用餐评价</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="index.jsp">菜品推荐</a>
    </li>
    <li class="layui-nav-item"><a href="selectOrder.jsp">经理选餐</a></li>
    <li class="layui-nav-item"><a href="">导航</a></li>

    <li class="layui-nav-item" style="float: right"><a href="login.jsp">登录</a></li>
    <li class="layui-nav-item" style="float: right"><a href="register.jsp">注册</a></li>
</ul>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px">
    <legend>新增菜品</legend>
</fieldset>

<form class="layui-form" id="recForm" lay-submit enctype="multipart/form-data" style="margin-top: 30px">
    <div class="layui-form-item" style="width: 50%">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input type="text" name="foodId" id="foodId" lay-verify="required" lay-reqtext="必填项岂能为空？" placeholder="如：f1001" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="width: 50%">
        <label class="layui-form-label">名称</label>
        <div class="layui-input-block">
            <input type="text" name="foodName" id="foodName" lay-verify="required" lay-reqtext="必填项岂能为空？" placeholder="如：小鸡炖蘑菇" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="width: 50%">
        <label class="layui-form-label">分类</label>
        <div class="layui-input-block">
            <select name="classify" id="classify" lay-filter="aihao">
                <option value="" selected=""></option>
                <option value="0">主食</option>
                <option value="1">荤菜</option>
                <option value="2">素材</option>
                <option value="3">汤类</option>
                <option value="4">甜品</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item" style="width: 50%">
        <label class="layui-form-label">单位</label>
        <div class="layui-input-block">
            <input type="text" name="unit" id="unit" lay-verify="required" lay-reqtext="必填项岂能为空？" placeholder="如：碗" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="width: 50%">
        <label class="layui-form-label">价格</label>
        <div class="layui-input-block">
            <input type="text" name="price" id="price" lay-verify="required" lay-reqtext="必填项岂能为空？" placeholder="￥" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" style="width: 50%">
        <label class="layui-form-label">标签</label>
        <div class="layui-input-block">
            <select name="classify" id="label" lay-filter="aihao">
                <option value="" selected=""></option>
                <option value="0">清淡</option>
                <option value="1">偏辣</option>
                <option value="2">偏咸</option>
                <option value="3">偏咸</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">图片</label>
        <h5 id="fileName" style="float: left;margin:0 10px; line-height: 38px;"></h5>
        <button style="float: left;" class="layui-btn" id="preview_img" type="button">
            选择图片
        </button>
    </div>

    <div class="layui-form-item layui-form-text" style="width: 50%">
        <label class="layui-form-label">备注</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" id="exp"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button id="addRoomType" class="layui-btn" lay-submit lay-filter="addRoomType" style="display: none">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

</body>
<script src="layui\layui.js" charset="UTF-8"></script>
<script>
    layui.use('element', function () {
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //导航点击事件
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //提交
        form.on('submit(articlesub)', function(data){
            $.ajax({
                url:'addRecipe.do',
                method:'post',
                data:{'foodId': data.foodId,
                    'foodName': data.foodName,
                    'classify': data.classify,
                    'unit': data.unit,
                    'price': data.price,
                    'lable':data.lable,
                    'exp':data.exp},
                dataType:'JSON',
                success:function(res){
                    if(res.code=='0'){
                        layer.msg("提交成功",{icon: 1, time: 3000},function(){location.reload();}); //提交成功后跳转
                    }
                    else
                        alert(res.msg);
                },
                error:function (data) {

                }
            });
            return false;
        });
        //监听提交
        form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
                title: '最终的提交信息'
            })
            return false;
        });


        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
<%--文件上传script--%>

</html>

