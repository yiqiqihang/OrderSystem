<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/11/21
  Time: 23:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>总括订单+配餐员页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <%--引入css文件--%>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #guide_panel {
            width: 98%;
            margin: 0 auto;
        }

        #row_panel {
            width: 98%;
            height: 920px;
            margin: 0 auto;
            /*border: solid 1px red;*/
        }

        #table_1{
            width: 28%;
            text-align: center;
        }
        #table_2{
            width: 72%;
        }

        #row_panel .table-panel {
            /*width: 50%;*/
            height: 920px;
            float: left;
            text-align: center;
        }

        #row_panel .table-panel p {
            color: #BBBBBB;
        }

        #row_panel .bottom-panel {
            width: 100%;
            height: 40px;
            background: #F0F0F0;
            float: left;
            margin-top: 20px;
            text-align: center;
        }

        #row_panel .bottom-panel span {
            line-height: 40px;
            font-size: 18px;
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
        #totleNumber{
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div id="guide_panel">
    <blockquote class="layui-elem-quote" style="text-align: center;font-size: 25px;color: #009688">总括订单&nbsp;&&&nbsp;配餐员订单</blockquote>
</div>
<div>
<%--    &lt;%&ndash;搜索&ndash;%&gt;--%>
<%--    <div class="layui-inline">--%>
<%--        <input class="layui-input" name="intext" id="intext" autocomplete="off" placeholder="请输入:">--%>
<%--    </div>--%>
<%--    <button type="button" class="layui-btn" id="selectrecipebtn" data-type="reload"><i--%>
<%--            class="layui-icon layui-icon-search" style="font-size: 20px; "></i>搜索--%>
<%--    </button>--%>
<%--    <hr>--%>
</div>
<div id="row_panel">
    <div id="table_1" class="table-panel">
        <p>总括订单：菜名 + 份量信息</p>
        <hr>
        <table id="List1" lay-filter="List1"></table>
    </div>
    <div id = "table_2" class="table-panel">
        <p>配餐员：用户信息 + 用户订单</p>
        <hr>
        <table id="List2" lay-filter="List2"></table>
    </div>
</div>
<script>
    layui.use(['layer', 'form', 'element', 'jquery', 'table', 'laydate'], function () {
        var form = layui.form, element = layui.element, $ = layui.$, layer = layui.layer,
            table = layui.table, laydate = layui.laydate;
        $(function () {
            // console.table(GoodsData);
            /**
             * List1数据表格渲染
             */
            var ListTable1 = table.render({
                url: 'selectBlanketOrder.do',
                elem: '#List1',
                id:'List1',
                cellMinWidth: 95,
                height: '920',
                minheight: 430,
                limit: 15,
                limits: [15, 20, 30, 40, 50, 60, 70, 80]
                , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                    title: '提示'
                    , layEvent: 'LAYTABLE_TIPS'
                    , icon: 'layui-icon-tips'
                }],
                done: function (res) {
                    if (res.rows && res.rows.length == 1) {
                        var data = res.rows[0];
                        GoodsList_onDblClickRow(data);
                    }
                },
                cols: [
                    [
                        {field: 'oM_NAME',align:'center', title:"菜名"},
                        {field: 'sUM',align:'center', title:"数量",sort:true},
                    ]
                ]
            });

            /**
             * List2数据表格渲染
             */
            var ListTable2 = table.render({
                // data:goodsData,
                url: "selectCaterInformation.do",
                elem: '#List2',
                cellMinWidth: 95,
                height: '920',
                minheight: 430,
                limit: 15,
                limits: [15, 20, 30, 40, 50, 60, 70, 80],
                toolbar: '#toolbarDemo', //开启头部工具栏，并为其绑定左侧模板
                defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                    title: '提示'
                    , layEvent: 'LAYTABLE_TIPS'
                    , icon: 'layui-icon-tips'
                }],
                initSort: {
                    field: 'o_ID',
                    // type:'desc',//默认降序
                    type: 'asc',
                },
                cols: [
                    [
                        {field: 'o_ID', title:"订单号",align:'center',width:90,sort:true},
                        {field: 'o_NAME', title:"员工姓名",align:'center',width:120},
                        {field: 'o_PHONE', title:"员工电话",align:'center',width:180},
                        {field: 'o_MENUNAEM', title:"订单详情",align:'center',width:500},
                        {field: 'o_PRICE', title:"总价",align:'center',width:100, templet: function (d) {
                                return "<span style='color:red'>￥" + d.o_PRICE + "</span>";
                            }
                        },
                        {field: 'o_TIME', title:"下单时间",align:'center',sort:true,width:270,templet:'<div>{{ layui.util.toDateString(d.o_TIME, "yyyy-MM-dd HH:mm:ss") }}</div>'},
                        {
                            title: "操作", align: "center", fixed: 'right',width:100, templet: function (d) {
                                var html = '<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delet">接单</a> ';
                                return html;
                            },

                        },

                    ]
                ],
                done: function (res) {
                    $("#List2").siblings().find("td").each(function () {
                        if ($(this).attr("data-edit") == 'text') {
                            var num = $(this).find("div").text();
                            $(this).append('<input class="layui-input layui-table-edit" value="' + num + '">')
                        }
                    })
                }
            });
            /**
             * 监听行删除事件
             */
            table.on('tool(List2)', function (obj, index) {
                var data = obj.data;
                var vKey = data.oM_NAME; //菜品名称
                // alert(vKey)
                if(obj.event === 'delet'){
                    $.ajax({
                        url: ".do",
                        type: "post",
                        data: {
                            'oM_NAME': vKey,
                        },
                        async: false,
                        success: function (side) {
                            if (side == 1) {
                                layer.msg("删除成功！", {icon: 1});
                            } else {
                                layer.msg("删除失败！", {icon: 5});
                            }
                        }
                    });
                }
                /**
                 * 开始刷新
                 */
                shoppingCartRefresh();
            });
            /**
             * 购物车刷新函数
             */
            function shoppingCartRefresh() {
                var goodsData = {url: "selectCaterInformation.do"};
                //数据表格重载
                ListTable2.reload({data: goodsData});
            }
        });
    });
</script>
</body>
</html>
