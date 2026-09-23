<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2022/10/4
  Time: 13:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>餐厅网络点餐系统——主页</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header" style="height: 60px">
        <div class="layui-logo layui-hide-xs layui-bg-black" >用户</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="introduction.jsp" target="_blank">
                <h1 style="font-size: 20px;color: white ;" >XXX企业餐厅logo</h1>
            </a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item layui-hide-xs  "\>
                <i class='layui-icon layui-icon-time'
                   style='font-size: 18px; color: #009688;'></i>&nbsp;<span id="times"></span>
            </li>
            <li class="layui-nav-item layui-hide layui-show-md-inline-block">
                <a href="javascript:;">
                    <img src="imgs/${users.u_PICTURE}" class="layui-nav-img">
                    个人中心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">用户姓名：${users.u_NAME}</a></dd>
                    <dd><a href="">联系电话：${users.u_PHONE}</a></dd>
                    <dd><a href="">部门：${users.DEPARTMENT}</a></dd>
                    <dd><a href="">角色：${users.ROLE}</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item layui-hide-xs  "\><a href="loginout.do">
                <i class='layui-icon layui-icon-logout'
                   style='font-size: 18px; color: #009688;'></i>安全退出

            </a></li>
            <li class="layui-nav-item" lay-header-event="menuRight" lay-unselect>
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-more-vertical"></i>
                </a>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <%--    用户显示栏--%>
        <div class="layui-side-scroll">
            <div style="text-align: center;padding-bottom: 12px;padding-top: 15px">
                <a href="javascript:;">
                    <img src="imgs/${users.u_PICTURE}" class="layui-nav-img" style="width: 115px;height:115px;position: center">
                    <div style="color:#FFFFFF;text-align: center;margin-right: 15px;margin-top: 15px;letter-spacing: 2px">欢迎回来:${users.u_LOGINNAME}</div>
                </a>
            </div>
            <div   style="text-align: left">
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="test">
                    <li class="layui-nav-item layui-nav-itemed" style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '厨房主管' || users.ROLE == '企业员工'?'block':'none'}"
                    >
                        <a class="" href="javascript:;">
                            <i class="layui-icon layui-icon-user" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;个人中心</a>
                        <dl class="layui-nav-child">
<%--                            <dd><a href="javascript:;"--%>
<%--                                   data-url="personalInformation.jsp"--%>
<%--                                   data-id="personalInformation"--%>
<%--                                   data-title="<i class='layui-icon layui-icon-username'--%>
<%--                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;个人信息"--%>
<%--                                   class="site-demo-active"--%>
<%--                                   data-type="tabAdd"--%>
<%--                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-username" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;个人信息</a></dd>--%>
<%--                            <dd><a href="javascript:;"--%>
<%--                                   data-url="changePassword.jsp"--%>
<%--                                   data-id="changePassword"--%>
<%--                                   data-title="<i class='layui-icon layui-icon-set-fill'--%>
<%--                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;修改密码"--%>
<%--                                   class="site-demo-active"--%>
<%--                                   data-type="tabAdd"--%>
<%--                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-set-fill" style="font-edit: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;修改密码</a></dd>--%>
                            <dd><a href="javascript:;"
                                   data-url="menu.jsp"
                                   data-id="menu"
                                   data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;今日菜单"
                                   class="site-demo-active"
                                   data-type="tabAdd"
                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-tabs" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;当期菜单</a></dd>
                            <dd><a href="javascript:;"
                                   data-url="orderPerson.jsp"
                                   data-id="orderPerson"
                                   data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;个人订单"
                                   class="site-demo-active"
                                   data-type="tabAdd"
                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-tabs" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;个人订单</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item layui-nav-itemed" style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '厨房主管' || users.ROLE == '财务管理'?'block':'none'}">
                        <a href="javascript:;"><i class="layui-icon layui-icon-group" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;管理员中心</a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;"
                                   data-url="recipe.jsp"
                                   data-id="recipe"
                                   style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '厨房主管'?'block':'none'}"
                                   data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;食谱"
                                   class="site-demo-active"
                                   data-type="tabAdd"
                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-table" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;食谱</a></dd>
                            <dd><a href="javascript:;"
                                   data-url="newRecipeMassage.jsp"
                                   data-id="newRecipeMassage"
                                   style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '厨房主管'?'block':'none'}"
                                   data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;当期菜单"
                                   class="site-demo-active"
                                   data-type="tabAdd"
                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-table" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;当期菜单</a></dd>
                            <dd><a href="javascript:;"
                                   data-url="oldMenu.jsp"
                                   data-id="oldMenu"
                                   style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '厨房主管'?'block':'none'}"
                                   data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;历史菜单"
                                   class="site-demo-active"
                                   data-type="tabAdd"
                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-table" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;历史菜单</a></dd>
<%--                            <dd><a href="javascript:;"--%>
<%--                                   data-url="huizong.jsp"--%>
<%--                                   data-id="huizong"--%>
<%--                                   style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '财务管理'?'block':'none'}"--%>
<%--                                   data-title="<i class='layui-icon layui-icon-set-fill'--%>
<%--                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;月度订单"--%>
<%--                                   class="site-demo-active"--%>
<%--                                   data-type="tabAdd"--%>
<%--                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-table" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;月度订单</a></dd>--%>
                            <dd><a href="javascript:;"
                                   data-url="mouthOrder.jsp"
                                   data-id="mouthOrder"
                                   style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '财务管理'?'block':'none'}"
                                   data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;月度订单"
                                   class="site-demo-active"
                                   data-type="tabAdd"
                            >&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon layui-icon-table" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;月度订单</a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item"><a href="javascript:;"
                                                  style="display: ${users.ROLE=='餐厅经理' || users.ROLE == '厨房主管' || users.ROLE == '配餐员'?'block':'none'}"
                                                  data-url="blanketOrder.jsp"
                                                  data-id="blanketOrder"
                                                  data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;订单信息"
                                                  class="site-demo-active"
                                                  data-type="tabAdd"
                    ><i class="layui-icon layui-icon-form" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;订单信息</a></li>
                    <li class="layui-nav-item"><a href="javascript:;"
                                                  data-url="changePassword.jsp"
                                                  data-id="changePassword"
                                                  data-title="<i class='layui-icon layui-icon-set-fill'
                                               style='font-size: 18px; color: #009688;'></i>&nbsp;&nbsp;帮助中心"
                                                  class="site-demo-active"
                                                  data-type="tabAdd"
                    ><i class="layui-icon layui-icon-set-sm" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;&nbsp;帮助中心 </a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px">
            <div class="layui-tab layui-tab-card layui-tab-brief" lay-filter = "demo" lay-allowclose="true" style="width: 100% ">
                <ul class="layui-tab-title">
                    <li class="layui-this">首页——简介</li>
                </ul>
                <div class="layui-tab-content" style="height: 1100px">
                    <div class="layui-tab-item layui-show">
                        1. 该餐厅系统设计是我喜爱的风格，XXX（餐厅介绍）
                        <br>
                        2. XXX（餐厅员工介绍，包含餐厅经理、厨房主管、财务人员、配餐员等）
                    </div>
                </div>
            </div>
        </div>


<%--        <div>--%>
<%--            <div class="layui-tab layui-tab-brief  layui-tab-card " lay-filter="demo" style="width: 100%;" lay-allowclose="true">--%>
<%--                <ul class="layui-tab-title">--%>
<%--                    <li class="layui-this">首页——简介</li>--%>
<%--                </ul>--%>
<%--                <div class="layui-tab-content" style="">--%>
<%--                    <div class="layui-tab-item layui-show">--%>
<%--                      <iframe src=""></iframe>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
    <div class="layui-footer" style="text-align: center;color: #1E9FFF">
        <!-- 底部固定区域 -->
        &copy;五邑大学2020级JavaWeb &lt;必修&gt;&nbsp;&nbsp;上次登录时间：${lasttimesession}
    </div>
</div>
<script src="./layui/layui.js"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function(){
        var element = layui.element
            ,layer = layui.layer
            ,util = layui.util
            ,$ = layui.$;

        //时钟定时器
        setInterval(function () {
            let dateStr = "";
            let date = new Date();
            //要单独的获取时间
            dateStr +=date.getFullYear()+"年";//年
            dateStr +=((date.getMonth()+1)<10?"0"+(date.getMonth()+1):(date.getMonth()+1))+"月";//月
            dateStr +=(date.getDate()<10?+date.getDate():date.getDate())+"日";
            dateStr +=(date.getHours()<10?"0"+date.getHours():date.getHours())+"时";
            dateStr +=(date.getMinutes()<10?"0"+date.getMinutes():date.getMinutes())+"分";
            dateStr +=(date.getSeconds()<10?"0"+date.getSeconds():date.getSeconds())+"秒";
            let xq = ["日","一","二","三","四","五","六"]
            dateStr +="  星期"+xq[date.getDay()];

            $("#times").text(dateStr);

        },1000);
        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });

        //触发事件
        var active = {
            //在这里给active绑定几项事件，后面可通过active调用这些事件
            tabAdd: function (url, id, title) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: title,
                    content: '<iframe data-frameid="' + id
                        + '" scrolling="auto" frameborder="0" src="'
                        + url + '" style="width:100%;height: 100%"></iframe>',
                    id: id
                    //规定好的id
                })
                element.render('tab');

            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            },
            tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            },
            offset: function(othis){
                var type = othis.data('type')
                    ,text = othis.text();

                layer.open({
                    type: 1
                    ,title:'修改个人头像'
                    ,offset: type //具体配置参考：/docs/modules/layer.html#offset
                    ,id: 'layerDemo'+type //防止重复弹出
                    ,content: '<div style="padding: 20px 200px;width: 400px;height: 260px"><iframe src="updateTouX.jsp" width="360px" height="260px"></iframe> </div>'
                    ,btn: '确定'
                    ,btnAlign: 'c' //按钮居中
                    ,shade: 0 //不显示遮罩
                    ,yes: function(){
                        //刷新当前页面
                        location.reload()
                        layer.closeAll();
                    }
                });
            }
        };
        $('#txpic').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });

        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData == false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });
    });
</script>
</body>
</html>
