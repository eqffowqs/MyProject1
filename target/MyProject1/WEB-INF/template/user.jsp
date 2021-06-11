
<%--没有pageEncoding会乱码--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0
    ,maximum-scale=0.2,minimum-scale=1.0,user-scalable=yes">



    <title>background</title>
    <link rel="stylesheet" href="${basePath}/layui/css/layui.css" media="all">
   <%-- <link rel="stylesheet" href="${basePath}/images/login.css">--%>
<style type="text/css">
    .backgroundpicture-bg{
        z-index: -1;
        opacity: .5;
        filter: opacity(50%);
        position: absolute;
        /*background-image: url(/images/tutu1.jpg);*/
        background-attachment:fixed;
        background-size:25% 50%;
        width: 100%;
        height: 100%;
      /*  background: rgba(0,0,0,0.1);*/
    }
    .backgroundpicture{
        position: fixed;
        
    }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui layout</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">control</a></li>
            <li class="layui-nav-item"><a href="">commodity</a></li>
            <li class="layui-nav-item"><a href="">user</a></li>
            <li class="layui-nav-item layui-this">
                <a href="javascript:;">other systems</a>
                <dl class="layui-nav-child">
                    <dd><a href="">test1</a></dd>
                    <dd><a href="">test2</a></dd>
                    <dd><a href="">test3</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${basePath}/images/wang.jpg" class="layui-nav-img">
                    tutu
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">basic data</a></dd>
                    <dd><a href="">setting</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">quit</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">products</a>
                    <%--<dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>--%>
                </li>
                <%--<li class="layui-nav-item">
                    <a href="javascript:;">解决方案</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">云市场</a></li>
                <li class="layui-nav-item"><a href="">发布商品</a></li>--%>
            </ul>
    </div>

    <div class="layui-body layui-layout-left backgroundpicture-bg" >
        <!-- 内容主体区域 -->
        <div class="backgroundpicture">



        </div>
    </div>

<%--    <div class="layui-footer">
        <!-- 底部固定区域 -->
        &lt;%&ndash;© layui.com - 底部固定区域&ndash;%&gt;
    </div>--%>
</div>

<blockquote class="layui-elem-quote layui-quote-nm layui-hide" id="footer">layui {{ layui.v }} 提供强力驱动</blockquote>
<script src="${basePath}/layui/layui.js"></script>
<script src="${basePath}/images/jquery.js"></script>
<script src="${basePath}/images/gt.js"></script>

<script>
    //JavaScript代码区域
    layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element', 'slider'], function(){
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,carousel = layui.carousel //轮播
            ,upload = layui.upload //上传
            ,element = layui.element //元素操作
            ,slider = layui.slider //滑块

        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
                tips: 1
            });
        });

        //执行一个 table 实例
        var tableIns=table.render({
            elem: '#demo'
            ,height: 420
            ,url: '/demo/table/user/' //数据接口
            ,title: '用户表'
            ,page: true //开启分页
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'id', title: 'ID', width:80, sort: true, fixed: 'left', totalRowText: '合计：'}
                ,{field: 'username', title: '用户名', width:80}
                ,{field: 'experience', title: '积分', width: 90, sort: true, totalRow: true}
                ,{field: 'sex', title: '性别', width:80, sort: true}
                ,{field: 'score', title: '评分', width: 80, sort: true, totalRow: true}
                ,{field: 'city', title: '城市', width:150}
                ,{field: 'sign', title: '签名', width: 200}
                ,{field: 'classify', title: '职业', width: 100}
                ,{field: 'wealth', title: '财富', width: 135, sort: true, totalRow: true}
                ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
            ]]
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.msg('添加');
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.msg('查看操作');
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                layer.msg('编辑操作');
            }
        });

        //执行一个轮播实例
        carousel.render({
            elem: '#test1'
            ,width: '100%' //设置容器宽度
            ,height: 200
            ,arrow: 'none' //不显示箭头
            ,anim: 'fade' //切换动画方式
        });

        //将日期直接嵌套在指定容器中
        var dateIns = laydate.render({
            elem: '#laydateDemo'
            ,position: 'static'
            ,calendar: true //是否开启公历重要节日
            ,mark: { //标记重要日子
                '0-10-14': '生日'
                ,'2018-08-28': '新版'
                ,'2018-10-08': '神秘'
            }
            ,done: function(value, date, endDate){
                if(date.year == 2017 && date.month == 11 && date.date == 30){
                    dateIns.hint('一不小心就月底了呢');
                }
            }
            ,change: function(value, date, endDate){
                layer.msg(value)
            }
        });

        //分页
        laypage.render({
            elem: 'pageDemo' //分页容器的id
            ,count: 100 //总页数
            ,skin: '#1E9FFF' //自定义选中色值
            //,skip: true //开启跳页
            ,jump: function(obj, first){
                if(!first){
                    layer.msg('第'+ obj.curr +'页', {offset: 'b'});
                }
            }
        });

        //上传
        upload.render({
            elem: '#uploadDemo'
            ,url: '' //上传接口
            ,done: function(res){
                console.log(res)
            }
        });

        //滑块
        var sliderInst = slider.render({
            elem: '#sliderDemo'
            ,input: true //输入框
        });


    });
</script>
</body>
</html>