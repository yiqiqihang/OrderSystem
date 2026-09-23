<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="order.server.orderPersonService" %>
<%@ page import="order.pojo.orderPerson" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="order.server.orderPersonImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人月度销售总表</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body style="margin: 0;padding: 0;font-size: 15px" onload="shoppingCartRefresh()">
<div style="width: 950px;margin: 5px auto;padding: 10px 0px;border-bottom: 1px solid #eee;" id="headBox">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" style="background-color: white"><a href="#"
                                                                                                       onclick="javascript:location.reload();window.location.href='mouthOrder.jsp';"><i
            class="layui-icon layui-icon-return" style="font-size: 30px; color: black;"></i></a></button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData" style="background-color: white"><a href="#"
                                                                                                       onclick="javascript:location.reload()"><i
            class="layui-icon layui-icon-refresh" style="font-size: 30px; color: black;"></i> </a></button>
</div>
<div id="divPrint" style="width: 960px;margin:0 auto;">
    <div id="div1"></div>
    <div id="div2">
        <table width="100%" border="1" cellspacing="0">
            <thead>
            <tr style="height: 80px;text-align: center;font-size: 30px;">
                <td colspan="13">员工月度订单汇总</td>
            </tr>
            <tr style="height: 40px;text-align:center">
                <% Date date1 = new Date();
                    SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
                    request.setAttribute("data1", formatter1.format(date1));%>
                <td colspan="13">员工：${intext} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系电话：15632581771&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;统计月份：${data1} </td>
            </tr>
            <tr style="height: 30px;">
                <%--                <td  style="text-align: center;">下单时间</td>--%>
                <td style="text-align: center;width: 200px">时间</td>
                <td style="text-align: center;width: 300px">菜名</td>
                <td style="text-align: center;width: 100px">单位</td>
                <td style="text-align: center;width: 100px">数量</td>
                <td style="text-align: center;width: 125px">单价</td>
                <td style="text-align: center;">合计</td>
            </tr>
            </thead>
            <% orderPersonService orderPersonService = new orderPersonImpl();
                //获取session保存的个人月度订单中intext和phone
                String xm = String.valueOf(session.getAttribute("intext"));
                String phone = String.valueOf(session.getAttribute("phone"));
                System.out.println("intext："+xm+"phone:"+phone);
                List<orderPerson> ygddbs = orderPersonService.monthCountUser(xm);
                request.setAttribute("monthCountUser", ygddbs);%>

            <% Date odtime = new Date();
                SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
                request.setAttribute("odtime", formatter2.format(odtime));%>

            <c:forEach items="${monthCountUser}" var="monthCountUser" varStatus="s">
                <tr style="height: 30px">
                        <%--                <td class="td_name_0" style="text-align: center;">1</td>--%>
                    <td style="text-align: center;">&nbsp;${odtime}</td>
                    <td style="text-align: center;">&nbsp;${monthCountUser.OM_NAME}</td>
                    <td style="text-align: center;">&nbsp;${monthCountUser.OM_UNIT}</td>
                    <td style="text-align: center;">&nbsp;${monthCountUser.OM_WEIGHT}</td>
                    <td style="text-align: center;">&nbsp;<span>￥${monthCountUser.OM_PRICE}</span></td>
                    <td class="hunbit_0" style="text-align: center;">&nbsp;<span>￥${monthCountUser.ALL_PRICE}</span></td>

                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <%String sum = String.valueOf(session.getAttribute("sum"));%>
                <td colspan="13" style="text-align: right;height: 30px">合计金额：${sum}￥<span
                        id="RechargeCount_TotalMoney"></span></td>
            </tr>
            <tr style="height: 30px;text-align: justify">
                <% Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    request.setAttribute("data", formatter.format(date));%>
                <td colspan="13">操作员：${users.u_NAME}（${users.ROLE}）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  操作时间：${data}</td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
</body>
<script>
    layui.use(['layer', 'form', 'element', 'jquery', 'table', 'laydate'], function () {
        var form = layui.form,
            element = layui.element,
            $ = layui.$,
            layer = layui.layer,
            table = layui.table,
            laydate = layui.laydate;

        /**
         * 购物车刷新函数
         */
        var TotalM = 0;
        $.ajax({
            url: "selectPersonO_price.do",
            type: "post",
            data:{
                data:data,
            },
            success: function (side) {
                alert(side);
                TotalM=side;
                $("#RechargeCount_TotalMoney").html(TotalM);
            }
        });
        function shoppingCartRefresh() {
            $(document).ready(function () {
                //第一次进入页面刷新一次，仅一次
                //location.href.indexOf("#")获取当前页面地址并在其中查找"#"首次出现位置，找不到就是-1
                if (location.href.indexOf("#") == -1) {
                    //在当前页面地址加入"#"，使下次不再进入此判断
                    location.href = location.href + "#";
                    location.reload();
                }
            })
            // $.ajax({
            //     type: "post",
            //     async: false,
            //     url: 'monthCountUser.do',
            //     success: function (data) {
            //
            //         var goodsData = JSON.parse(data);
            //         console.log(goodsData.length)
            //         var TotalMoney = 0;
            //
            //         //计算总数 合计金额
            //         for (var i = 0; i < goodsData.length; i++) {
            //             TotalMoney = (accAdd(TotalMoney, parseFloat(goodsData[i].money))).toFixed(2);
            //         }
            //         console.log("总金额:" + TotalMoney);
            //         $("#RechargeCount_TotalMoney").html(TotalMoney);
            //
            //     }
            //
            // });

        }

        window.onload = shoppingCartRefresh;

        /**
         * 小数加法
         * @param arg1
         * @param arg2
         * @returns {number}
         */
        function accAdd(arg1, arg2) {
            var r1, r2, m;
            try {
                r1 = arg1.toString().split(".")[1].length
            } catch (e) {
                r1 = 0
            }
            try {
                r2 = arg2.toString().split(".")[1].length
            } catch (e) {
                r2 = 0
            }
            m = Math.pow(10, Math.max(r1, r2));
            return (arg1 * m + arg2 * m) / m;
        }

        /**
         * 小数乘法
         * @param arg1
         * @param arg2
         * @param fix
         * @returns {*}
         */
        function accMul(arg1, arg2, fix) {
            if (!parseInt(fix) == fix) {
                return;
            }
            var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
            try {
                m += s1.split(".")[1].length
            } catch (e) {
            }
            try {
                m += s2.split(".")[1].length
            } catch (e) {
            }
            if (m > fix) {
                return (Math.round(Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m - fix)) / Math.pow(10, fix));
            } else if (m <= fix) {
                return (Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m)).toFixed(fix);
            } else {
                return (arg1 * arg2).toFixed(fix);
            }


        }
    })

</script>
</html>




