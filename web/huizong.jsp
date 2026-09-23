<%@ page import="order.pojo.orderPerson" %>
<%@ page import="java.util.List" %>
<%@ page import="order.server.orderPersonService" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="order.server.orderPersonImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script src="layui/layui.js"></script>
</head>
<body style="margin: 0;padding: 0;font-size: 15px"onload="shoppingCartRefresh()">
<%--<div style="width: 950px;margin: 5px auto;padding: 10px 0px;border-bottom: 1px solid #eee;" id="headBox">--%>
<%--    <button class="layui-btn layui-btn-sm" lay-event="getCheckData"><a  href="#" onclick="javascript:location.reload()">刷新</a></button>--%>
<%--</div>--%>
<div id="divPrint" style="width: 960px;margin:0 auto;">
    <div id="div1"></div>
    <div id="div2">
        <table width="100%" border="1" cellspacing="0">
            <thead>
            <tr style="height: 40px;text-align: center;font-size: 30px;">
                <td colspan="13">月度订单汇总</td>
            </tr>
            <tr style="height: 40px">
                <% Date date1 = new Date();
                    SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
                    request.setAttribute("data1",formatter1.format(date1));%>
                <td colspan="13" style="text-align: right">统计月份：${data1} </td>
            </tr>
            <tr>
                <%--                <td  style="text-align: center;">下单时间</td>--%>
                <td  style="text-align: center;">菜名</td>
                <td  style="text-align: center;">数量</td>
                <td  style="text-align: center;">单价</td>
                <td  style="text-align: center;">合计</td>
            </tr>
            </thead>
            <% orderPersonService orderPersonService = new orderPersonImpl();
                List<orderPerson> orderPeople = orderPersonService.M_OrderList();
                request.setAttribute("M_OrderList",orderPeople);%>

            <c:forEach items="${M_OrderList}" var = "M_OrderList" varStatus="s">
                <tr>
                        <%--                <td class="td_name_0" style="text-align: center;">1</td>--%>
                    <td style="text-align: center;">&nbsp;${M_OrderList.OM_NAME}</td>
                    <td style="text-align: center;">&nbsp;${M_OrderList.OM_WEIGHT}</td>
                    <td style="text-align: center;">&nbsp;${M_OrderList.OM_PRICE}</td>
                    <td class="hunbit_0" style="text-align: center;">&nbsp;${M_OrderList.ALL_PRICE}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="13" style="text-align: right">合计金额：<span id="RechargeCount_TotalMoney"></span></td>
            </tr>
            <tr>
                <td colspan="2">操作员：${users.u_NAME}（${users.ROLE}）</td>
                <% Date date = new Date();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    request.setAttribute("data",formatter.format(date));%>
                <td colspan="3"style="text-align: right">操作时间：${data}</td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
</body>
<script>

    /**
     * 购物车刷新函数
     */

    function shoppingCartRefresh(){

        $.ajax({
            url: "M_OrderList.do",
            success:function(data){
                // var goodsData= eval( data );
                //     for(var i=0;i<data.length;i++){
                //
                //     // alert("直接->jsonobj[0].name:\n"+goodsData[i].money);
                //     // alert(goodsData.money);
                //     console.log(goodsData.money)
                //     }
                console.log(data);
                var goodsData=  JSON.parse(data) ;
                console.log(goodsData.length)
                var TotalMoney = 0;

                //计算总数 合计金额
                for (var i = 0; i < goodsData.length; i++) {
                    // console.log(goodsData[i]);
                    TotalMoney = (accAdd(TotalMoney, parseFloat(goodsData[i].ALL_PRICE))).toFixed(2);
                }
                console.log("总金额:"+TotalMoney);
                $("#RechargeCount_TotalMoney").html(TotalMoney);
            }
        });
    }
    window.onload=shoppingCartRefresh;
    /**
     * 小数加法
     * @param arg1
     * @param arg2
     * @returns {number}
     */
    function accAdd(arg1,arg2){
        var r1,r2,m;
        try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
        try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
        m=Math.pow(10,Math.max(r1,r2));
        return (arg1*m+arg2*m)/m;
    }
    /**
     * 小数乘法
     * @param arg1
     * @param arg2
     * @param fix
     * @returns {*}
     */
    function accMul(arg1,arg2,fix) {
        if(!parseInt(fix)==fix)
        {
            return;
        }
        var m=0,s1=arg1.toString(),s2=arg2.toString();
        try{m+=s1.split(".")[1].length}catch(e){}
        try{m+=s2.split(".")[1].length}catch(e){}
        if(m>fix){
            return (Math.round(Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m-fix))/Math.pow(10,fix));
        }else if(m<=fix){
            return (Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)).toFixed(fix);
        }else{
            return (arg1*arg2).toFixed(fix);
        }
    }
    // });

</script>
</html>




