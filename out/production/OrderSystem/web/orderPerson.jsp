<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/11/14
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人订单页面</title>
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
        #selectOrderPersonID{
            text-align: center;
        }
    </style>
</head>
<div id="commitTable" style="display: none;margin: 10px">
    <table class="layui-hide" id="openTable" lay-filter="openTable"></table>
</div>
<body>
<div class="mainWin">
    <div id="selectOrderPersonID">
        <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
                <input type="text" name="begintime" class="layui-input" id="beginTime" placeholder="yyyy-MM-dd">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
                <input type="text" name="endtime" class="layui-input" id="endTime" placeholder="yyyy-MM-dd">
            </div>
        </div>
        <div class="layui-inline">
            <button class="layui-btn" lay-submit lay-filter="LAY-user-front-search" id="selectoldmealbtn">
                <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                搜索
            </button>
        </div>
        <hr>
    </div>

    <table class="layui-hide" id="test" lay-filter="test"></table>
    <table class="layui_hide" ></table>
    <script type="text/html" id="toolbarDemo">
        <div class="layui-btn-container">
<%--            <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>--%>
<%--            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>--%>
<%--            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
<%--            <button data-method="offset" data-type="auto" class="layui-btn layui-btn-sm" lay-event="commit">居中弹出</button>--%>
        </div>

    </script>
    <script type="text/html" id="barDemo">
<%--        <a class="layui-btn layui-btn-xs" lay-event="edit">选择</a>--%>
        <a class="layui-btn layui-btn-xs" lay-event="tableUpdate">取消订单</a>
<%--        <button type="button" class="layui-btn layui-btn-sm" lay-event="tableUpdate">--%>
<%--            <i class="layui-icon">&#xe640;</i>--%>
<%--        </button>--%>
<%--        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>
    </script>
    <script>
        layui.use(['table','jquery'], function(){
            var table = layui.table;
            var $ = layui.jquery;
            var ListTable = table.render({
                elem: '#test'
                ,url:'selectOrderPerson.do'
                ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
                ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                    title: '提示'
                    ,layEvent: 'LAYTABLE_TIPS'
                    ,icon: 'layui-icon-tips'
                }]
                ,done :function (res,curr,count) {
                    merge(res);
                }
                ,title: '用户数据表'
                ,initSort:{
                    field:'o_ID',
                    // type:'desc',//默认降序
                    type:'asc',
                }
                ,cols: [[
                    {type: '', fixed: 'left',width: 1}
                    ,{field:'o_ID', title:'订单号', width:100, fixed: 'left', sort: true}
                    ,{field:'o_NAME', title:'用户', width:150}
                    ,{field:'o_PHONE', title:'电话号码', width:200}
                    ,{field:'o_TIME', title:'下单时间', width:210,templet:'<div>{{ layui.util.toDateString(d.o_TIME, "yyyy-MM-dd HH:mm:ss") }}</div>'}
                    ,{field:'oM_NAME', title:'菜名', width:220}
                    ,{field:'oM_WEIGHT', title:'份量', width:160}
                    ,{field:'oM_UNIT', title:'计量单位', width:160}
                    ,{field:'oM_PRICE', title:'单价', width:160}
                    ,{field:'aLL_PRICE', title:'合计价格', width:160}
                    ,{field:'o_PRICE', title:'总计价格', width:160,templet: function (d) {
                                return "<span style='color:red'>￥" + d.o_PRICE + "</span>";
                            }}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:230}
                ]]
                ,page: true
                ,limit:30

            });

            // 有点大bug！！！明天得空需要进行修改！！
            function merge(res) {
                var data = res.data;
                var mergeIndex = 0;//定位需要添加合并属性的行数
                var mark = 1; //这里涉及到简单的运算，mark是计算每次需要合并的格子数
                var columsName = ['o_ID', 'o_NAME','o_PHONE','o_TIME','o_PRICE'];//需要合并的列名称
                var columsIndex = [1, 2, 3, 4, 10];//需要合并的列索引值

                for (var k = 0; k < columsName.length; k++) { //这里循环所有要合并的列
                    var trArr = $(".layui-table-body>.layui-table").find("tr");//所有行
                    for (var i = 1; i < res.data.length; i++) { //这里循环表格当前的数据
                        var tdCurArr = trArr.eq(i).find("td").eq(columsIndex[k]);//获取当前行的当前列
                        var tdPreArr = trArr.eq(mergeIndex).find("td").eq(columsIndex[k]);//获取相同列的第一列
                        if (data[i][columsName[k]] === data[i - 1][columsName[k]]) { //后一行的值与前一行的值做比较，相同就需要合并
                            mark += 1;
                            tdPreArr.each(function () {//相同列的第一列增加rowspan属性
                                $(this).attr("rowspan", mark);
                            });
                            tdCurArr.each(function () {//当前行隐藏
                                $(this).css("display", "none");
                            });
                        } else {
                            mergeIndex = i;
                            mark = 1;//一旦前后两行的值不一样了，那么需要合并的格子数mark就需要重新计算
                        }
                    }
                    mergeIndex = 0;
                    mark = 1;
                }
            }

            // 个人订单页面刷新函数
            function orderPersonCartRefresh() {
                //数据表格重载
                ListTable.reload('test', {
                    url:'selectOrderPerson.do'
                    ,method:'post'
                    ,page:{
                        curr:1
                    }
                    ,limit: 20
                } );
            }
            // 监听行工具事件
            table.on('tool(test)', function(obj){
                var data = obj.data;
                var o_ID = data.o_ID;
                if(obj.event === 'tableUpdate'){
                    // alert("取消该订单",o_ID);
                    layer.confirm("确认取消 "+o_ID+"订单吗？",function (index) {
                        $.ajax({
                            url: "cancelOrderPerson.do"
                            ,type: "post"
                            ,data: {
                                'r_ID':o_ID,
                            }
                            ,async: false
                            ,success: function (side) {
                                if (side == 1) {
                                    layer.msg("取消订单成功！",{icon:1});
                                    //开始刷新
                                    orderPersonCartRefresh();
                                } else {
                                    layer.msg("OMG 取消订单失败! 请联系管理员！",{icon:5});
                                }
                            }
                        });
                        layer.close(index);
                    });
                }
            });
            // 查询功能
            var selectrecipebtn = document.getElementById("selectoldmealbtn");
            selectrecipebtn.onclick=function(){
                var elementById = document.getElementById("beginTime");
                var elementById_1 = document.getElementById("endTime");
                var data = elementById.value;
                var data_1 = elementById_1.value;
                //方法重载
                table.reload('test',{
                    url:'selectPersonTime.do'
                    ,method:'post'
                    ,page: {
                        curr: 1
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
        });
    </script>

</div>
</body>
</html>

