<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/11/14
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>历史菜单</title>
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
        #selectOldMenuID{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="mainWin">
<%--    <div class="layui-inline">--%>
<%--        <input class="layui-input" name="intext" id="intext" autocomplete="off" placeholder="请输入:">--%>
<%--    </div>--%>
<%--    <button type="button" class="layui-btn" id="selectoldmealbtn" data-type="reload"><i--%>
<%--            class="layui-icon layui-icon-search" style="font-size: 20px; "></i>搜索--%>
<%--    </button>--%>
<%--    <button type="button" class="layui-btn layui-btn-search" onclick="window.location.href='recipe.jsp'">--%>
<%--        <i class="layui-icon">&#xe654;</i>--%>
<%--    </button>--%>
<%--    <hr>--%>
    <div id="selectOldMenuID">
        <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
                <input type="text" name="begintime" class="layui-input" id="beginTime" placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
                <input type="text" name="endtime" class="layui-input" id="endTime" placeholder="yyyy-MM-dd HH:mm:ss">
            </div>
        </div>

        <div class="layui-inline">
            <button class="layui-btn" lay-submit lay-filter="LAY-user-front-search" id="selectoldmealbtn">
                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                搜索
            </button>
        </div>
    </div>

    <table class="layui-hide" id="test" lay-filter="test"></table>

    <script type="text/html" id="toolbarDemo">
<%--        <div class="layui-btn-container">--%>
<%--            <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>--%>
<%--            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
<%--            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
<%--        </div>--%>


    </script>

    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script>
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'seleceOldMenu.do'
                ,id:'test'
                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                    title: '提示'
                    ,layEvent: 'LAYTABLE_TIPS'
                    ,icon: 'layui-icon-tips'
                }]
                ,title: '历史菜单'
                ,cols: [[
                    {type: 'checkbox', fixed: 'left',width: 90}
                    ,{field:'s_ID', title:'ID', width:110, fixed: 'left', unresize: true, sort: true}
                    ,{field:'s_NAME', title:'菜肴名称', width:320}
                    ,{field:'s_GENRE', title:'类别', width:190, sort: true}
                    ,{field:'s_UNIT', title:'计量单位', width:190}
                    ,{field:'s_PRICE', title:'单位价格', width:190, sort: true}
                    ,{field:'s_IMAGE', title:'菜品图片', width:190,templet:function (item) {
                            return '<img id="picture" style="height: 100%;" src="images/'+item.s_IMAGE+'">';
                        }
                    }
                    ,{field:'s_TIME', title:'时间', width:330, sort: true,templet:'<div>{{ layui.util.toDateString(d.s_TIME, "yyyy-MM-dd HH:mm:ss") }}</div>'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:320}
                ]]
                ,page: true
                ,limit:20
            });

            // 搜索按钮功能
            var selectrecipebtn = document.getElementById("selectoldmealbtn");
            selectrecipebtn.onclick=function(){
                // alert("hello world");
                var elementById = document.getElementById("beginTime");
                var elementById_1 = document.getElementById("endTime");
                var data = elementById.value;//转化为前台显示的String类型数据
                var data_1 = elementById_1.value;
                // alert(data);
                //方法重载
                table.reload('test',{
                    url:'seleceOldTime.do'
                    ,method:'post'
                    ,page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        beginTime: data
                        ,endTime:data_1
                    }
                    ,limit: 20
                    ,page:true
                    ,success:function (side) {
                        if (side==0){
                            layer.msg("sorry 请输入正确的时间格式",{icon:5})
                        }
                    }
                });
            }

            //头工具栏事件
            table.on('toolbar(test)', function(obj){
                var checkStatus = table.checkStatus(obj.config.id);
                switch(obj.event){
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：'+ data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选': '未全选');
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
                if(obj.event === 'del'){
                    layer.confirm('你真的删除：'+data.s_NAME+'这条记录吗?', function(index){
                        $.ajax({
                            url:"delectOldMenu.do",
                            type:"post",
                            data:{'s_ID':data.s_ID},
                            async:false,
                            success:function (data) {
                                if(data==0){
                                    layer.msg("OMG 删除失败! 请联系管理员："+data.s_NAME+"!");
                                }else {
                                    layer.msg("已经成功删除："+data.s_NAME+"!");
                                }
                            }
                        })
                        obj.del();
                        layer.close(index);
                    });
                }else if(obj.event === 'edit'){
                    // 修改按钮
                    $.ajax({
                        url:"addToMenu.do",
                        type:"post",
                        data: {
                            's_ID': data.s_ID,
                            's_NAME': data.s_NAME,
                            's_GENRE': data.s_GENRE,
                            's_UNIT': data.s_UNIT,
                            's_PRICE': data.s_PRICE,
                            's_IMAGE': data.s_IMAGE
                        },
                        async:false,
                        success:function (data) {
                            if(data==0){
                                layer.msg("已成功添加至今日菜单："+data.s_NAME+"!");
                            }else {
                                layer.msg("今日菜单已存在："+data.s_NAME+"!");
                            }
                        }
                    })
                }
            });
        });
    </script>
</div>
</body>
</html>
