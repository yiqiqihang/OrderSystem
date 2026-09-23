<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/12/13
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>月度订单</title>
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
            height: 720px;
            margin: 0 auto;
            /*border: solid 1px red;*/
        }

        #row_panel .table-panel {
            width: 50%;
            height: 600px;
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
            text-align: right;
        }

        #row_panel .bottom-panel span {
            line-height: 40px;
            font-size: 18px;
        }

        #intext {
            padding-left: 15px;
            margin-left: 10px;
            margin-bottom: 7px;
            margin-top: 7px;
            margin-right: -3px;
            width: 200px;
        }

        #selectrecipebtn {
            margin-right: 350px;
        }

        #totleNumber {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div id="guide_panel">
    <blockquote class="layui-elem-quote" style="text-align: center;font-size: 25px;color: #009688">月度统计总报表&nbsp;&&&nbsp;员工月度订单</blockquote>
</div>
<%--<td><input type="submit" onclick="javascript:window.location.href='huizong.jsp'" value="登&nbsp;&nbsp;录" class="sub">--%>
<%--</td>--%>

<div style="text-align: right">
    <%--搜索--%>
    <div class="layui-inline">
        <input class="layui-input" name="intext" id="intext" autocomplete="off" placeholder="员工姓名:">
    </div>
    <button type="button" class="layui-btn" id="selectrecipebtn" data-type="reload"><i
            class="layui-icon layui-icon-search" style="font-size: 20px; "></i>搜索
    </button>
    <td><input type="submit" class="layui-btn" id="" data-type="reload" onclick="javascript:window.location.href='personhuizong.jsp'" value="--&nbsp;&nbsp;>" class="sub">
    </td>

    <hr>
</div>
<div id="row_panel">
    <% Date date = new Date();
        SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
        request.setAttribute("data", formatter1.format(date));%>
    <div id="table_1" class="table-panel">
        <p>${data}月度销售统计总报表</p>
        <hr>
        <table id="List1" lay-filter="List1"></table>
        <div class="bottom-panel" id="totleNumber">
            <span>&nbsp;合计金额：&nbsp;￥&nbsp;</span><span id="RechargeCount_TotalMoney" style="color: red">---</span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
    <div id="table_2" class="table-panel">
        <p>${data}员工月度订单</p>
        <hr>
        <table id="List2" lay-filter="List2"></table>
        <div class="bottom-panel" id="totleNumber_person">
            <span>&nbsp;个人合计金额：&nbsp;￥&nbsp;</span><span id="RechargeCount_TotalMoney_Person"
                                                         style="color: red">---</span>&nbsp;元&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>
</div>
<script>
    layui.use(['layer', 'form', 'element', 'jquery', 'table', 'laydate'], function () {
        var form = layui.form, element = layui.element, $ = layui.$, layer = layui.layer,
            table = layui.table, laydate = layui.laydate;
        var TotalQty = 0;
        $.ajax({
            url: "selectO_price.do",
            type: "post",
            success: function (side) {
                TotalQty = side;
                $("#RechargeCount_TotalMoney").html(TotalQty);
            }
        });
        $(function () {
            // console.table(GoodsData);
            /**
             * List1数据表格渲染
             */
            var ListTable1 = table.render({
                url: 'M_OrderList.do',
                elem: '#List1',
                id: 'List1',
                cellMinWidth: 95,
                height: '820',
                minheight: 430,
                limit: 15,
                limits: [15, 20, 30, 40, 50, 60, 70, 80],
                done: function (res) {
                    if (res.rows && res.rows.length == 1) {
                        var data = res.rows[0];
                        GoodsList_onDblClickRow(data);
                    }
                },
                cols: [
                    [
                        <%--{field: '', title: "${data}月度销售统计总报表", align: 'center', merge: true},--%>
                        {field: 'oM_NAME', title: "菜名", align: 'center'},
                        {field: 'oM_UNIT', title: "单位", align: 'center'},
                        {field: 'oM_WEIGHT', title: "分量", align: 'center'},
                        {
                            field: 'oM_PRICE', title: "单价", align: 'center', templet: function (d) {
                                return "<span style='color:red'>￥" + d.oM_PRICE + "</span>";
                            }
                        },
                        {
                            field: 'aLL_PRICE', title: "合计", align: 'center', templet: function (d) {
                                return "<span style='color:red'>￥" + d.aLL_PRICE + "</span>";
                            }
                        },
                    ]
                ]
            });

            /**
             * List2数据表格渲染
             */
                // 搜索按钮功能--%>
            var selectrecipebtn = document.getElementById("selectrecipebtn");
            var TotalM;
            selectrecipebtn.onclick = function () {
                var elementById = document.getElementById("intext");
                var data = elementById.value;//转化为前台显示的String类型数据
                $.ajax({
                    url: "selectPersonO_price.do",
                    type: "post",
                    data: {
                        data: data,
                    },
                    success: function (side) {
                        TotalM = side;
                        $("#RechargeCount_TotalMoney_Person").html(TotalM);
                    }
                });
                var ListTable2 = table.render({
                    // data:goodsData,
                    url: "M_personOrderList.do",
                    where: {
                        intext: data,
                    },
                    elem: '#List2',
                    cellMinWidth: 95,
                    height: '820',
                    minheight: 430,
                    limit: 15,
                    limits: [15, 20, 30, 40, 50, 60, 70, 80],
                    initSort: {
                        field: 'o_TIME',
                        type: 'asc',
                    },
                    cols: [
                        [
                            {
                                field: 'o_TIME',
                                title: '时间',
                                align: 'center',
                                templet: '<div>{{ layui.util.toDateString(d.o_TIME, "yyyy-MM-dd") }}</div>'
                            },
                            {field: 'oM_NAME', title: "菜名", align: 'center'},
                            {field: 'oM_UNIT', title: "单位", align: 'center'},
                            {field: 'oM_WEIGHT', title: "分量", align: 'center'},
                            {
                                field: 'oM_PRICE', title: "单价", align: 'center', templet: function (d) {
                                    return "<span style='color:red'>￥" + d.oM_PRICE + "</span>";
                                }
                            },
                            {
                                field: 'aLL_PRICE', title: "合计", align: 'center', templet: function (d) {
                                    return "<span style='color:red'>￥" + d.aLL_PRICE + "</span>";
                                }
                            },
                            // {field: '', title: "总计价格", align: 'center',marge:true}
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
                //方法重载
                // table.reload('List1', {
                //     url: 'selectMenucheck.do'
                //     , method: 'post'
                //     , page: {
                //         curr: 1 //重新从第 1 页开始
                //     }
                //     , where: {
                //         name: data
                //     }
                //     , limit: 20
                //     , page: true
                // });
            }

            // /**
            //  * 监听行删除事件
            //  */
            // table.on('tool(List2)', function (obj, index) {
            //     var data = obj.data;
            //     var vKey = data.oM_NAME; //菜品名称
            //     // alert(vKey)
            //     if (obj.event === 'delet') {
            //         $.ajax({
            //             url: ".do",
            //             type: "post",
            //             data: {
            //                 'oM_NAME': vKey,
            //             },
            //             async: false,
            //             success: function (side) {
            //                 if (side == 1) {
            //                     layer.msg("删除成功！", {icon: 1});
            //                 } else {
            //                     layer.msg("删除失败！", {icon: 5});
            //                 }
            //             }
            //         });
            //     }
            //     /**
            //      * 开始刷新
            //      */
            //     shoppingCartRefresh();
            // });

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
<%--<div id="guide_panel">--%>
<%--    <blockquote class="layui-elem-quote" style="text-align: center;font-size: 25px;color: #009688">员工点餐</blockquote>--%>
<%--</div>--%>
<%--<div>--%>
<%--    &lt;%&ndash;搜索&ndash;%&gt;--%>
<%--    <div class="layui-inline">--%>
<%--        <input class="layui-input" name="intext" id="intext" autocomplete="off" placeholder="请输入:">--%>
<%--    </div>--%>
<%--    <button type="button" class="layui-btn" id="selectrecipebtn" data-type="reload"><i--%>
<%--            class="layui-icon layui-icon-search" style="font-size: 20px; "></i>搜索--%>
<%--    </button>--%>
<%--    <hr>--%>
<%--</div>--%>
<%--<div id="row_panel">--%>
<%--    <div class="table-panel">--%>
<%--        <table id="List1" lay-filter="List1"></table>--%>
<%--        <p>菜品列表</p>--%>
<%--    </div>--%>
<%--    <div class="table-panel">--%>
<%--        <table id="List2" lay-filter="List2"></table>--%>
<%--        <p>订单</p>--%>
<%--    </div>--%>
<%--    <div class="bottom-panel" id="totleNumber">--%>
<%--        <span>总数：&nbsp;</span><span id="RechargeCount_TotalQty">---</span>--%>
<%--        <span>&nbsp;总计金额：&nbsp;</span><span id="RechargeCount_TotalMoney">---</span>&nbsp;&nbsp;--%>
<%--        <button type="button" class="layui-btn layui-btn-radius" id="commit">提交</button>--%>
<%--    </div>--%>
<%--</div>--%>
<%--<script>--%>
<%--    layui.use(['layer', 'form', 'element', 'jquery', 'table', 'laydate'], function () {--%>
<%--        var form = layui.form, element = layui.element, $ = layui.$, layer = layui.layer,--%>
<%--            table = layui.table, laydate = layui.laydate;--%>
<%--        /**--%>
<%--         * 数据表格:定义表头数据--%>
<%--         * @type {{}}--%>
<%--         */--%>
<%--        var lan = {};--%>
<%--        lan.cpbm = "菜肴名称";--%>
<%--        lan.cpjm = "类别";--%>
<%--        lan.cpmc = "计量单位";--%>
<%--        lan.ckjj = "单位价格";--%>
<%--        lan.lpbz = "菜品图片";--%>
<%--        lan.spbh = "菜肴名称";--%>
<%--        lan.spmc = "计量单位";--%>
<%--        lan.sl = "分量";--%>
<%--        lan.dj = "单价";--%>
<%--        lan.je = "合计价格";--%>
<%--        lan.cz = "操作";--%>
<%--        /**--%>
<%--         * 购物车数据--%>
<%--         * @type {Array}--%>
<%--         */--%>
<%--        /**--%>
<%--         * 页面加载时执行--%>
<%--         */--%>
<%--        $(function () {--%>
<%--            // console.table(GoodsData);--%>
<%--            /**--%>
<%--             * List1数据表格渲染(商品列表)--%>
<%--             */--%>
<%--            var ListTable1 = table.render({--%>
<%--                url: 'M_OrderList.do',--%>
<%--                elem: '#List1',--%>
<%--                id:'List1',--%>
<%--                cellMinWidth: 95,--%>
<%--                height: '650',--%>
<%--                minheight: 430,--%>
<%--                page: true,--%>
<%--                limit: 14,--%>
<%--                limits: [14, 20, 30, 40, 50, 60, 70, 80],--%>
<%--                done: function (res) {--%>
<%--                    if (res.rows && res.rows.length == 1) {--%>
<%--                        var data = res.rows[0];--%>
<%--                        GoodsList_onDblClickRow(data);--%>
<%--                    }--%>
<%--                },--%>
<%--                cols: [--%>
<%--                    [--%>
<%--                        {field: 'oM_NAME', title: "菜名", align: 'center'},--%>
<%--                        {field: 'oM_UNIT', title: "单位", align: 'center'},--%>
<%--                        {field: 'oM_WEIGHT', title:"分量", align: 'center'},--%>
<%--                        {field: 'oM_PRICE', title: "单价", align: 'center', templet: function (d) {--%>
<%--                                return "<span style='color:red'>￥" + d.oM_PRICE + "</span>";--%>
<%--                            }},--%>
<%--                        {field: 'aLL_PRICE', title: "合计", align: 'center', templet: function (d) {--%>
<%--                                return "<span style='color:red'>￥" + d.aLL_PRICE + "</span>";--%>
<%--                            }},--%>
<%--                    ]--%>
<%--                ]--%>
<%--            });--%>
<%--            // 搜索按钮功能--%>
<%--            var selectrecipebtn = document.getElementById("selectrecipebtn");--%>
<%--            selectrecipebtn.onclick=function(){--%>
<%--                var elementById = document.getElementById("intext");--%>
<%--                var data = elementById.value;//转化为前台显示的String类型数据--%>
<%--                // alert(data);--%>
<%--                //方法重载--%>
<%--                table.reload('List1',{--%>
<%--                    url:'selectMenucheck.do'--%>
<%--                    ,method:'post'--%>
<%--                    ,page: {--%>
<%--                        curr: 1 //重新从第 1 页开始--%>
<%--                    }--%>
<%--                    ,where: {--%>
<%--                        name: data--%>
<%--                    }--%>
<%--                    ,limit: 20--%>
<%--                    ,page:true--%>
<%--                });--%>
<%--            }--%>
<%--            /**--%>
<%--             * List2数据表格渲染(购物车)--%>
<%--             */--%>
<%--            var ListTable2 = table.render({--%>
<%--                // data:goodsData,--%>
<%--                url: "selectMeal.do",--%>
<%--                elem: '#List2',--%>
<%--                cellMinWidth: 95,--%>
<%--                //height: 'full-190',--%>
<%--                height: '650',--%>
<%--                minheight: 430,--%>
<%--                page: true,--%>
<%--                limit: 14,--%>
<%--                limits: [14, 20, 30, 40, 50, 60, 70, 80],--%>
<%--                cols: [--%>
<%--                    [--%>
<%--                        {field: 'oM_NAME', title: lan.spbh},--%>
<%--                        {field: 'oM_UNIT', title: lan.spmc},--%>
<%--                        {field: 'oM_WEIGHT', title: lan.sl, edit: 'text'},--%>
<%--                        {field: 'oM_PRICE', title: lan.dj,},--%>
<%--                        {field: 'aLL_PRICE', title: lan.je, templet: function (d) {--%>
<%--                                return "<span style='color:red'>￥" + d.aLL_PRICE + "</span>";--%>
<%--                            }--%>
<%--                        },--%>
<%--                        {--%>
<%--                            title: lan.cz, align: "center", fixed: 'right', templet: function (d) {--%>
<%--                                var html = '<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="delet">删除</a> ';--%>
<%--                                return html;--%>
<%--                            },--%>

<%--                        },--%>

<%--                    ]--%>
<%--                ],--%>
<%--                done: function (res) {--%>
<%--                    $("#List2").siblings().find("td").each(function () {--%>
<%--                        if ($(this).attr("data-edit") == 'text') {--%>
<%--                            var num = $(this).find("div").text();--%>
<%--                            $(this).append('<input class="layui-input layui-table-edit" value="' + num + '">')--%>
<%--                        }--%>
<%--                    })--%>
<%--                }--%>
<%--            });--%>
<%--            /**--%>
<%--             * 监听商品列表'行'单击事件--%>
<%--             */--%>
<%--            table.on('row(List1)', function (obj) {--%>
<%--                var data = obj.data;--%>
<%--                var vKey = data.m_NAME; //菜品名称--%>
<%--                // alert(vKey);--%>
<%--                var judge = false;--%>
<%--                $.ajax({--%>
<%--                    url: "selectNameMeal.do",--%>
<%--                    type: "post",--%>
<%--                    data: {'m_Name': vKey}, //json数据--%>
<%--                    async: false,--%>
<%--                    success: function (side) {--%>
<%--                        if (side == 1) {--%>
<%--                            // layer.msg("++1", {icon: 1});--%>
<%--                            judge = false;--%>
<%--                        } else if(side == 0) {--%>
<%--                            // layer.msg("添加！", {icon: 5});--%>
<%--                            judge = true;--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--                if (judge) {--%>
<%--                    $.ajax({--%>
<%--                        url: "insertNameMeal.do",--%>
<%--                        type: "post",--%>
<%--                        data: {--%>
<%--                            'm_NAME': vKey,--%>
<%--                            'm_UNIT': data.m_UNIT,--%>
<%--                            'm_PRICE': data.m_PRICE,--%>
<%--                        },--%>
<%--                        async: false,--%>
<%--                        success: function (side) {--%>
<%--                            if (side == 1) {--%>
<%--                                layer.msg("选餐！", {icon: 1});--%>
<%--                            } else {--%>
<%--                                layer.msg("OMG 失败！", {icon: 5});--%>
<%--                            }--%>
<%--                        }--%>
<%--                    });--%>
<%--                }// 无可以，有不能返回值--%>

<%--                /**--%>
<%--                 * 开始刷新购物车--%>
<%--                 */--%>
<%--                shoppingCartRefresh();--%>
<%--            });--%>
<%--            /**--%>
<%--             * 监听购物车行删除事件--%>
<%--             */--%>
<%--            table.on('tool(List2)', function (obj, index) {--%>
<%--                var data = obj.data;--%>
<%--                var vKey = data.oM_NAME; //菜品名称--%>
<%--                // alert(vKey)--%>
<%--                if(obj.event === 'delet'){--%>
<%--                    $.ajax({--%>
<%--                        url: "delectOrderMeal.do",--%>
<%--                        type: "post",--%>
<%--                        data: {--%>
<%--                            'oM_NAME': vKey,--%>
<%--                        },--%>
<%--                        async: false,--%>
<%--                        success: function (side) {--%>
<%--                            if (side == 1) {--%>
<%--                                layer.msg("删除成功！", {icon: 1});--%>
<%--                            } else {--%>
<%--                                layer.msg("删除失败！", {icon: 5});--%>
<%--                            }--%>
<%--                        }--%>
<%--                    });--%>
<%--                }--%>
<%--                /**--%>
<%--                 * 开始刷新购物车--%>
<%--                 */--%>
<%--                shoppingCartRefresh();--%>
<%--            });--%>
<%--            /**--%>
<%--             * 购物车行编辑事件--%>
<%--             */--%>
<%--            table.on('edit(List2)', function (obj) {--%>
<%--                var vKey = data.m_NAME; //菜品名称--%>
<%--                var data = {url: "selectMeal.do"};--%>
<%--                for (var i = 0; i < data.length; i++) {--%>
<%--                    if (obj.data.Id == data[i].Id) {--%>
<%--                        if (isNaN(data[i].Qty) || data[i].Qty < 0) {--%>
<%--                            data[i].Qty = 0;--%>
<%--                        }--%>
<%--                        if (isNaN(data[i].Price) || data[i].Price < 0) {--%>
<%--                            data[i].Price = 0;--%>
<%--                        }--%>
<%--                        data[i].Qty = Number(data[i].Qty); //数量:声明数字类型--%>
<%--                        data[i].Price = parseFloat(data[i].Price).toFixed(2); //金额:声明小数类型--%>
<%--                        data[i].Money = accMul(data[i].Qty, data[i].Price, 2); //计算总金额:保留2位小数--%>
<%--                    }--%>
<%--                }--%>
<%--                /**--%>
<%--                 * 开始刷新购物车--%>
<%--                 */--%>
<%--                shoppingCartRefresh();--%>
<%--            });--%>
<%--            /**--%>
<%--             * 购物车刷新函数--%>
<%--             */--%>
<%--            function shoppingCartRefresh() {--%>
<%--                var goodsData = {url: "selectMeal.do"};--%>
<%--                var TotalQty = 0;--%>
<%--                var TotalMoney = 0;--%>
<%--                //数据表格重载--%>
<%--                ListTable2.reload({data: goodsData});--%>
<%--                // //计算总数 合计金额--%>
<%--                $.ajax({--%>
<%--                    url: "getTotalQty.do",--%>
<%--                    type: "post",--%>
<%--                    async: false,--%>
<%--                    success: function (side) {--%>
<%--                        TotalQty = side;--%>
<%--                    }--%>
<%--                });--%>
<%--                $.ajax({--%>
<%--                    url: "getTotalMoney.do",--%>
<%--                    type: "post",--%>
<%--                    async: false,--%>
<%--                    success: function (side) {--%>
<%--                        TotalMoney = side;--%>
<%--                    }--%>
<%--                });--%>
<%--                //前端页面显示--%>
<%--                $("#RechargeCount_TotalQty").html(TotalQty);--%>
<%--                $("#RechargeCount_TotalMoney").html(TotalMoney);--%>
<%--            }--%>
<%--            // 购物车提交按钮--%>
<%--            var commit = document.getElementById("commit");--%>
<%--            commit.onclick = function () {--%>
<%--                // alert("你好")--%>
<%--                $.ajax({--%>
<%--                    url: "commitOrder.do",--%>
<%--                    type: "post",--%>
<%--                    async: false,--%>
<%--                    success: function (side) {--%>
<%--                        if(side==1){--%>
<%--                            layer.msg("提交成功，可以在个人订单处查看订单详情",{icon:1});--%>
<%--                        }else {--%>
<%--                            layer.msg("提交失败！请尽快联系管理员进行修补漏洞",{icon:5});--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--                /**--%>
<%--                 * 开始刷新购物车--%>
<%--                 */--%>
<%--                shoppingCartRefresh();--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>

