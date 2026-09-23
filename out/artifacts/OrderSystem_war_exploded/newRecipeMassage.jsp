<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/11/24
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>当期菜单——管理员</title>
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
        #selectrecipebtn{
            margin-left: 7px;
        }
    </style>
</head>
<body>
<div class="mainWin">
<%--    <div id="selectOldMenuID">--%>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">开始时间</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="begintime" class="layui-input" id="beginTime" placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-inline">--%>
<%--            <label class="layui-form-label">结束时间</label>--%>
<%--            <div class="layui-input-inline">--%>
<%--                <input type="text" name="endtime" class="layui-input" id="endTime" placeholder="yyyy-MM-dd HH:mm:ss">--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <div class="layui-inline">--%>
<%--            <button class="layui-btn" lay-submit lay-filter="LAY-user-front-search" id="selectoldmealbtn">--%>
<%--                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>--%>
<%--                搜索--%>
<%--            </button>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div id="selectOldMenuID">
        <%--搜索--%>
        <div class="layui-inline">
            <input class="layui-input" name="intext" id="intext" autocomplete="off" placeholder="请输入:">
        </div>
        <button type="button" class="layui-btn" id="selectrecipebtn" data-type="reload"><i
                class="layui-icon layui-icon-search" style="font-size: 20px; "></i>搜索
        </button>
        <hr>
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
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>

    <script>
        layui.use('table', function(){
            var table = layui.table;

            table.render({
                elem: '#test'
                ,url:'selectMenu.do'
                ,id:'test'
                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                    title: '提示'
                    ,layEvent: 'LAYTABLE_TIPS'
                    ,icon: 'layui-icon-tips'
                }]
                ,title: '历史菜单'
                ,initSort:{
                    field:'m_ID',
                    // type:'desc',//默认降序
                    type:'asc',
                }
                ,cols: [[
                    {type: 'checkbox', fixed: 'left',width: 90}
                    ,{field:'m_ID', title:'ID', width:110, fixed: 'left', unresize: true, sort: true}
                    ,{field:'m_NAME', title:'菜肴名称', width:320}
                    ,{field:'m_GENRE', title:'类别', width:190, sort: true}
                    ,{field:'m_UNIT', title:'计量单位', width:190}
                    ,{field:'m_PRICE', title:'单位价格', width:190, sort: true}
                    ,{field:'m_IMAGE', title:'菜品图片', width:190,templet:function (item) {
                            return '<img id="picture" style="height: 100%;" src="images/'+item.m_IMAGE+'">';
                        }
                    }
                    ,{field:'m_TIME', title:'时间', width:330, sort: true,templet:'<div>{{ layui.util.toDateString(d.m_TIME, "yyyy-MM-dd HH:mm:ss") }}</div>'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:320}
                ]]
                ,page: true
                ,limit:20
            });

            // 搜索按钮功能
            var selectrecipebtn = document.getElementById("selectrecipebtn");
            selectrecipebtn.onclick=function(){
                var elementById = document.getElementById("intext");
                var data = elementById.value;//转化为前台显示的String类型数据
                // alert(data);
                //方法重载
                table.reload('test',{
                    url:'selectMenucheck.do'
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

            //监听行工具事件
            table.on('tool(test)', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.confirm("确认退选 "+data.m_NAME+"菜品吗？",function (index){
                        // alert("可以编辑菜品信息了",data.r_NAME);
                        $.ajax({
                            url:"remitOldMenu.do",
                            type:"post",
                            data:{'r_NAME':data.m_NAME}, //json数据
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
                            data:{'r_NAME':data.m_NAME}, //json数据
                            async: false,
                            success: function (side) {
                                if (side == 1) {
                                    layer.msg("啊哈退选成功！",{icon:1});
                                } else {
                                    layer.msg("OMG 退选失败! 菜谱不含此菜品！",{icon:5});
                                }
                            }
                        });
                        obj.del();
                        layer.close(index);
                    });
                }
            });
        });
    </script>
</div>
</body>
</html>

