<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/11/7
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>食谱</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">

    <%--引入css文件--%>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/jquery.validate.js"></script>

    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>



    <style>
        th div{
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        td div{
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        div.mainWin{
            height: 900px;
            width: 100%;
        }
        #intext{
            padding-left: 15px;
            margin-left: 10px;
            margin-bottom: 7px;
            margin-top: 7px;
            margin-right: -39px;
        }
        #selectrecipebtn{
            margin-left: 7px;
        }
    </style>
</head>
<div id="commitTable" style="display: none;margin: 10px">
    <table class="layui-hide" id="openTable" lay-filter="openTable"></table>
</div>
<body>
<div class="mainWin">
    <%--搜索--%>
    <div class="layui-inline">
        <input class="layui-input" name="intext" id="intext" autocomplete="off" placeholder="请输入:">
    </div>
    <button type="button" class="layui-btn" id="selectrecipebtn" data-type="reload"><i
            class="layui-icon layui-icon-search" style="font-size: 20px; "></i>搜索
    </button>
    <button type="button" class="layui-btn layui-btn-search" onclick="window.location.href='addRecipe.jsp'">
        <i class="layui-icon">&#xe654;</i>
    </button>
    <hr>
    <table class="layui-hide" id="test" lay-filter="test"></table>
    <table class="layui_hide" ></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
<%--        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>--%>
<%--        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
<%--        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
        <button data-method="offset" data-type="auto" class="layui-btn layui-btn-sm" lay-event="commit">多选提交</button>
    </div>
</script>

<script type="text/html" id="barDemo">
        <button type="button" class="layui-btn layui-btn-sm" lay-event="edit">
            <i class="layui-icon">&#xe654;</i>
        </button>
        <button type="button" class="layui-btn layui-btn-sm" lay-event="back">
            <i class="layui-icon">-</i>
        </button>
        <button type="button" class="layui-btn layui-btn-sm" lay-event="tableUpdate">
            <i class="layui-icon">&#xe642;</i>
        </button>
        <button type="button" class="layui-btn layui-btn-sm"  lay-event="del">
            <i class="layui-icon">&#xe640;</i>
        </button>
<%--    <a class="layui-btn layui-btn-xs" lay-event="edit">选择</a>--%>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="back">退选</a>--%>
<%--    <a class="layui-btn layui-btn-xs" lay-event="tableUpdate">修改</a>--%>
<%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
</script>
<script>

    layui.use(['table','jquery'], function(){
        var table = layui.table;
        var $ = layui.jquery;

        table.render({
            elem: '#test'
            ,url:'selectrecipe.do'
            ,id:'test'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {field:'r_ID', title:'ID', width:100, fixed: 'left', unresize: true, sort: true}
                ,{type: 'checkbox', fixed: 'left',width: 80}
                ,{field:'r_NAME', title:'菜肴名称', width:250, edit: 'text'}
                ,{field:'r_GENRE', title:'类别', width:150, edit: 'text',sort: true}
                ,{field:'r_UNIT', title:'计量单位', width:150, edit: 'text'}
                ,{field:'r_PRICE', title:'单位价格', width:150, edit: 'text', sort: true,templet: function (d) {
                        return "<span style='color:red'>￥" + d.r_PRICE + "</span>";
                    }}
                ,{field:'r_IMAGE', title:'菜品图片', width:150,templet:function (item) {
                        return '<img id="picture" style="height: 100%;" src="images/'+item.r_IMAGE+'">';
                    }
                }
                ,{field:'r_INSTRUCTION', title:'烹饪说明', width:650, edit: 'text'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:250}
            ]]
            ,page: true
            ,limit:20
        });

        // 搜索按钮功能
        var selectrecipebtn = document.getElementById("selectrecipebtn");
        selectrecipebtn.onclick=function(){
            // alert("hello world");
            var elementById = document.getElementById("intext");
            var data = elementById.value;//转化为前台显示的String类型数据
            // alert(data);
            //方法重载
            table.reload('test',{
                url:'selectcheck.do'
                ,method:'post'
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                        name: data
                }
                ,limit: 20
                ,page:true
            });
        }

        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);  //获取选中行状态

            switch(obj.event){
                case 'getCheckData':
                    var data = checkStatus.data;   //获取选中行数据
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：'+ data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;
                case 'commit':
                    var data  = checkStatus.data;  //获取选中行的数据
                    layer.open({
                        type: 1
                        ,title:"确认菜单"
                        ,area:['1000px','800px']
                        ,content:$("#commitTable")
                        ,success: function(){
                            table.render({
                                elem: '#openTable'
                                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                                ,data:data
                                ,title: '今日菜单'
                                ,cols: [[
                                    {field:'r_ID', title:'ID', width:100, fixed: 'left', unresize: true, sort: true}
                                    ,{field:'r_NAME', title:'菜肴名称', width:250, edit: 'text'}
                                    ,{field:'r_GENRE', title:'类别', width:150, edit: 'text',sort: true}
                                    ,{field:'r_UNIT', title:'计量单位', width:150, edit: 'text'}
                                    ,{field:'r_PRICE', title:'单位价格', width:150, edit: 'text', sort: true}
                                    ,{field:'r_IMAGE', title:'菜品图片', width:150,templet:function (item) {
                                            return '<img id="picture" style="height: 100%;" src="images/'+item.r_IMAGE+'">';
                                        }
                                    }
                                ]]
                                ,page: true
                                ,limit: 200
                            });
                            table.on('checkbox(templateTable)', function (obj) { //监听复选框,获取选择到的值
                                obj_data = obj.data; //获取到选中复选框上的一行数据
                                let path=obj_data.path; //获取某个字段的值
                                console.log(path);
                            })
                        }
                        ,btn:['继续点餐','确定']
                        ,yes:function () {
                            $.ajax({
                                url: "addDoubleMenu.do"
                                ,dataType:"json"
                                // ,contentType:"application/x-www-form-urlencoded;charset=UTF-8"
                                , type: "post"
                                , data: chargeData
                                , async: false
                                , success: function (side) {
                                    if (side == 1) {
                                        layer.msg("啊哈添加成功！", {icon: 1});
                                    } else {
                                        layer.msg("OMG 添加失败! 请联系管理员！", {icon: 5});
                                    }
                                }
                            });
                        },

                    });
                    break;
                //自定义头工具栏右侧图标 - 提示
                case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('你真的删除这么美味的：'+data.r_NAME+'么?', function(index){
                    $.ajax({
                        url:"delectrecipe.do",
                        type:"post",
                        data:{'r_NAME':data.r_NAME},
                        async:false,
                        success:function (data) {
                            if(data==0){
                                layer.msg("OMG 删除失败! 请联系管理员："+data.r_NAME+"!");
                            }else {
                                layer.msg("已经成功删除!");
                            }
                        }
                    })
                    obj.del();
                    layer.close(index);
                });
            }
            else if(obj.event === 'edit'){
                layer.confirm("是否添加:"+data.r_NAME+"为今日菜品？",function (index) {
                    //弹窗提示确认
                    var judge = true;
                    $.ajax({
                        url:"checkMenu.do",
                        type:"post",
                        data:{'r_NAME':data.r_NAME}, //json数据
                        async: false,
                        success:function (data) {
                            if (data==1){
                                layer.msg("sorry 您已经选过此菜品！",{icon: 5});
                                judge = false;
                            }else {
                                // layer.msg("选择成功！",{icon: 1})
                            }
                        }
                    });
                    // alert("test:"+data.r_NAME);
                    //需要判断这个菜品是否已经选过
                    if (judge) {
                        $.ajax({
                            url: "addMenu.do"
                            ,type: "post"
                            ,data: {'r_ID': data.r_ID,
                                'r_NAME': data.r_NAME,
                                'r_GENRE': data.r_GENRE,
                                'r_UNIT': data.r_UNIT,
                                'r_PRICE': data.r_PRICE,
                                'r_IMAGE': data.r_IMAGE
                            }
                            ,async: false
                            ,success: function (side) {
                                if (side == 1) {
                                    layer.msg("啊哈添加成功！",{icon:1});
                                } else {
                                    layer.msg("OMG 添加失败! 请联系管理员！",{icon:5});
                                }
                            }
                        });
//不需要同步触发添加，已在数据库操作触发器同时提添加
                        // $.ajax({
                        //     // alert("test:"+data.r_NAME);
                        //     url: "insertOldMenu.do"
                        //     ,type: "post"
                        //     ,data: {'r_ID': data.r_ID,
                        //         'r_NAME': data.r_NAME,
                        //         'r_GENRE': data.r_GENRE,
                        //         'r_UNIT': data.r_UNIT,
                        //         'r_PRICE': data.r_PRICE,
                        //         'r_IMAGE': data.r_IMAGE
                        //     }
                        //     ,async: false
                        //     // ,success: function (side) {
                        //     //     if (side == 1) {
                        //     //         layer.msg("啊哈添加成功！",{icon:1});
                        //     //     } else {
                        //     //         layer.msg("OMG 添加失败! 请联系管理员！",{icon:5});
                        //     //     }
                        //     // }
                        // });
                    }
                    layer.close(index);
                })

            }
            else if(obj.event === 'tableUpdate'){
                // alert("可以编辑菜品信息了",data.r_NAME);
                layer.confirm("确认修改 "+data.r_NAME+"信息吗？",function (index) {
                    $.ajax({
                        url: "recipeUpdate.do"
                        ,type: "post"
                        ,data: {
                            'r_ID':data.r_ID,
                            'r_NAME': data.r_NAME,
                            'r_GENRE': data.r_GENRE,
                            'r_UNIT': data.r_UNIT,
                            'r_PRICE': data.r_PRICE,
                            'r_IMAGE': data.r_IMAGE,
                            'r_INSTRUCTION':data.r_INSTRUCTION
                        }
                        ,async: false
                        ,success: function (side) {
                            if (side == 1) {
                                layer.msg("啊哈修改成功！",{icon:1});
                            } else {
                                layer.msg("OMG 修改失败! 请联系管理员！",{icon:5});
                            }
                        }
                    });
                    layer.close(index);
                });

            }
            else if(obj.event === 'back'){
                layer.confirm("确认退选 "+data.r_NAME+"菜品吗？",function (index){
                    // alert("可以编辑菜品信息了",data.r_NAME);
                    $.ajax({
                        url:"remitOldMenu.do",
                        type:"post",
                        data:{'r_NAME':data.r_NAME}, //json数据
                        async: false,
                        success: function (side) {
                            if (side == 1) {
                                // layer.msg("啊哈退选成功！",{icon:1});
                            } else {
                                // layer.msg("OMG 退选失败! 历史菜单不含此菜品！",{icon:5});
                            }
                        }
                    });
                    $.ajax({
                        url:"delectMenu.do",
                        type:"post",
                        data:{'r_NAME':data.r_NAME}, //json数据
                        async: false,
                        success: function (side) {
                            if (side == 1) {
                                layer.msg("啊哈退选成功！",{icon:1});
                            } else {
                                layer.msg("OMG 退选失败! 菜谱不含此菜品！",{icon:5});
                            }
                        }
                    });
                    layer.close(index);
                });
            }
        });

    });
</script>

</div>
</body>
</html>
