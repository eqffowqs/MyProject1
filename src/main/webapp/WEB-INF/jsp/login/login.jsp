<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019-12-19
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理-登陆</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="images/login.css">
    <style>
        .admin-header{
            text-align: center;
            font-size: 28px;
            font-family: '微软雅黑';
            font-weight: 100;
            color:#fff;
        }
        .a-button{
            width:300px;
            margin-top:10px;
        }
        .admin-captcha{
            position: absolute;
            margin-left: -98px;
            margin-top: 11px;
        }
        body{
            background-image: url(/images/tutu.jpg);
            background-repeat: no-repeat;
            background-size:100% 100%;
            background-attachment:fixed;
        }
    </style>
</head>
<body>

<div id="container">
    <div></div>
    <div class="admin-login-background">
        <div class="admin-header">

            unset system

        </div>
        <form class="layui-form"  method="post" action="${basePath}/login/login1.action">
            <div>
                <i class="layui-icon layui-icon-username admin-icon admin-icon-username"></i>
                <input type="text" name="username" placeholder="input your name"
                       id="username"
                       autocomplete="off"
                       class="layui-input admin-input admin-input-username">
            </div>
            <div>
                <i class="layui-icon layui-icon-password admin-icon admin-icon-password"></i>
                <input type="password" name="password" id="password"
                       placeholder="input your password"
                       autocomplete="off"
                       class="layui-input admin-input">
            </div>

            <div>
                <input type="text" name="code"
                       id="code" style="float: left;"
                       placeholder="verification "
                       autocomplete="off"
                       onfocus="this.value=''"
                       class="layui-input admin-input admin-input-verify">
                <img class="admin-captcha codeimg" id="codeimg" style="float: left"
                     src="${basePath}/wang/verify.action"
                     onclick="updateVerify()">
            </div>
            <a class="layui-btn a-button"  href="javascript:void(0);" onclick="login();" >登陆</a>

        </form>
    </div>
</div>
<script src="layui/layui.js"></script>
<script src="images/jquery.js"></script>
<script src="images/gt.js"></script>

<script>
    //用户登录的方法
    function login(){
        var username=$("#username").val();
        var password=$("#password").val();
        var code=$("#code").val();
        //用户名是否输入
        if(username==null||username==""){
            alert("please input your name");
            return false;
        }
        //密码是否输入
        if(password==null||password==""){
            alert("please input your password");
            return false;
        }
        //验证码是否输入
        if(code==null||code==""){
            layui.use(['layer','form'], function(){
                layer.open({
                    title:'msg',
                    content:'input verify'
                });
            });
            return false;
        }
        //如果都不为空，则进行登陆
        $.ajax({
            url:"${basePath}/login/login1.action",
            type:"POST",
            data:{"username":username,"password":password,"code":code},
            dataType:"json",
            success:function(data){
                if(data=="1"){
                    layui.use(['layer','form'], function(){
                        layer.open({
                            title:'msg',
                            content:'verification error'
                        });
                    });
                    updateVerify();
                    return false;
                }else if(data=="2"){
                    layui.use(['layer','form'], function(){
                        layer.open({
                            title:'msg',
                            content:'username or password error'
                        });
                    });
                    updateVerify();
                    return false;
                }
                window.location.href="${basePath}/jump/userLogin.action"
            }
        })
    }
    //切换验证码
    function updateVerify(){
        var imgSrc=$("#codeimg");
        var src=imgSrc.attr("src");
        imgSrc.attr("src",chgUrl(src))
    }

    //加入时间戳，去缓存机制
    function chgUrl(url){
        var timestamp=(new Date()).valueOf();
        if((url.indexOf("&"))>=0){
            url=url+"&timestamp="+timestamp;
        }else {
            url=url+"?timestamp="+timestamp;
        }
        return url;
    }

</script>


</body>
</html>
