
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
    /*.backgroundpicture-bg{
        z-index: -1;
        opacity: .5;
        filter: opacity(50%);
        position: absolute;
        !*background-image: url(/images/tutu.jpg);*!!*需要刚加载的时候有背景图，之后没有*!
        background-attachment:fixed;
        background-size:25% 50%;
        width: 100%;
        height: 100%;
      !*  background: rgba(0,0,0,0.1);*!
    }
    .backgroundpicture{
        position: fixed;
    }*/

    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui layout</div>
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
                <li class="layui-nav-item ">
                    <a  href="${basePath}/jump/userList.action" target="iframe">user</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${basePath}/jump/productList.action" target="iframe">products</a>
<%--                    <dl class="layui-nav-child">--%>
<%--                        <dd><a href="javascript:;">1</a></dd>--%>
<%--                        <dd><a href="javascript:;">2</a></dd>--%>
<%--                        <dd><a href="javascript:;">3</a></dd>--%>
<%--                    </dl>--%>
                </li>
                <li class="layui-nav-item"><a href="${basePath}/jump/orderList.action" target="iframe">orders</a></li>
                <li class="layui-nav-item"><a href="${basePath}/jump/moreList.action" target="iframe">more</a></li>
            </ul>
    </div>

    <div class="layui-body" >
        <!-- 内容主体区域 -->

            <iframe name="iframe" id="iframe" src=""
            width="100%" height="100%" frameborder="0" border="0" scrolling="auto">
            </iframe>

    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <%--© layui.com - 底部固定区域--%>
        first control system @iqffowqs
    </div>
</div>
</div>
<script src="${basePath}/layui/layui.js"></script>
<script src="${basePath}/images/jquery.js"></script>
<script src="${basePath}/images/gt.js"></script>

<script>
    //JavaScript代码区域
    layui.use('element',function () {
        var element=layui.element;
    })

</script>
</body>
</html>