<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/11/12
  Time: 23:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>增加菜品</title>
    <link rel="stylesheet" href="layui/css/layui.css"    media="all">
    <style>
        #back{
            float: right;
            margin: 5px;
        }
    </style>
</head>

<body style="border: #1E9E97 1px solid;margin-left: 180px ;margin-right:180px;">
        <h1 style="color: #009688;text-align: center"><button data-method="offset" data-type="auto" class="layui-btn layui-btn-danger" id="back" onclick="window.location.href='recipe.jsp'">X</button>添加菜品</h1>
        <hr>
        <form class="layui-form" id="recForm" lay-submit enctype="multipart/form-data" style="margin-top: 30px">
            <div class="layui-form-item" style="width: 65%;margin-right:280px;margin-left: 250px">
                <label class="layui-form-label" style="color: #1E9E97">菜品名称</label>
                <div class="layui-input-block">
                    <input type="text" name="cname" id="r_NAME" lay-verify="required" lay-reqtext="菜品名称不可为空" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 65%;margin-right:280px;margin-left: 250px">
                <label class="layui-form-label" style="color: #1E9E97">菜品分类</label>
                <div class="layui-input-block">
                    <input type="text" name="fenlei" id="r_GENRE" lay-verify="required" lay-reqtext="菜品分类不可为空" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 65%;margin-right:280px;margin-left: 250px">
                <label class="layui-form-label" style="color: #1E9E97">计量单位</label>
                <div class="layui-input-block">
                    <input type="text" name="danwei" id="r_UNIT" lay-verify="required" lay-reqtext="计量单位不可为空" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 65%;margin-right:280px;margin-left: 250px">
                <label class="layui-form-label" style="color: #1E9E97">单位价格</label>
                <div class="layui-input-block">
                    <input type="text" name="money" id="r_PRICE" lay-verify="required" lay-reqtext="单位价格不可为空" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 65%;margin-right:280px;margin-left: 250px">
                <label class="layui-form-label" style="color: #1E9E97">烹饪说明</label>
                <div class="layui-input-block">
                    <input type="text" name="shuoming" id="r_INSTRUCTION" lay-verify="required" lay-reqtext="烹饪说明不可为空"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="width: 65%;margin-right:280px;margin-left: 250px">
                <label class="layui-form-label" style="color: #1E9E97">菜品图片</label>
                <div class="layui-form-label">
                    <div class="layui-upload" style="margin-left: 0px;margin-top: 10px">
                        <button type="button" class="layui-btn" id="test1" style="margin-left: 15px">添加图片</button>
                        <div class="layui-upload-list">
                            <img class="layui-upload-img" id="demo1" style="width: 120px;height: 120px">
                            <p id="demoText"></p>
                        </div>
                        <div style="width: 120px;">
                            <div class="layui-progress layui-progress-big" lay-showpercent="yes" lay-filter="demo">
                                <div class="layui-progress-bar" lay-percent=""></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="layui-form-item" style="width: 50%">
                <label class="layui-form-label" style="display: none">图片名称</label>
                <div class="layui-input-block">
                    <input type="text" name="image" id="image" class="layui-input" value="${image}" style="display: none">
                </div>
            </div>


            <div class="layui-form-item" style="width: 65%;margin-right:280px;margin-left: 1072px">
                <div class="layui-input-block">
                    <button id="addCP" class="layui-btn" lay-submit lay-filter="addRoomType">确定添加</button>
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
    layui.use(['form', 'layedit', 'laydate','layer'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
        ;var $ = layui.jquery
        //图片名称
        //提交
        addCP.onclick = function(data){
            console.log(image.value)
            $.ajax({
                url:'addCP.do',
                method:'post',
                data:{'r_NAME': r_NAME.value,
                    'r_GENRE': r_GENRE.value,
                    'r_UNIT': r_UNIT.value,
                    'r_PRICE': r_PRICE.value,
                    'r_INSTRUCTION': r_INSTRUCTION.value,
                    'r_IMAGE':image.value}
                ,dataType:'JSON'
                ,async: false
                ,success: function (res) {
                    if (res ==0) {
                        layer.msg("添加成功了！", {icon:  1,time:3000});
                        parent.location.reload();
                    }else {
                        layer.msg("添加失败！",{icon: 5});
                    }

                }
            });
            return false;
        };
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

        var active = {
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();
            }
        }
        $('#imageBt').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

    });
</script>
<script>
    layui.use(['upload', 'element', 'layer'], function(){
        var $ = layui.jquery
            ,upload = layui.upload
            ,element = layui.element
            ,layer = layui.layer;

        //常规使用 - 普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: 'addImage.do' //此处用的是第三方的 http 请求演示，实际使用时改成您自己的上传接口即可。
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
                element.progress('demo', '0%'); //进度条复位
                layer.msg('上传中', {icon: 16, time: 0});
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                //上传成功的一些操作
                //……
                $('#demoText').html(''); //置空上传失败的状态
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
            //进度条
            ,progress: function(n, elem, e){
                element.progress('demo', n + '%'); //可配合 layui 进度条元素使用
                if(n == 100){
                    layer.msg('上传完毕', {icon: 1});
                    // location.reload();
                }
            }
        });

    });
</script>
</html>

