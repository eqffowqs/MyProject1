<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019-11-22
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>edit user</title>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0
    ,maximum-scale=0.2,minimum-scale=1.0,user-scalable=yes">

    <link rel="stylesheet" href="${basePath}/layui/css/layui.css" media="all">
    <style type="text/css">
        .layui-textarea {
            width: 590px;
        }
        .layui-form-item{
            margin-left: 20px;
        }
        .address{
            max-width: 100px
        }
    </style>
</head>
<body>
<form class="layui-form layui-form-pane" method="post" enctype="multipart/form-data">

    <%--需要ModelAndView传递的id--%>
    <input type="hidden" id="userid" value="${user.id}">


    <div class="layui-form-item">
        <label class="layui-form-label">name</label>
        <div class="layui-input-inline">
            <input type="text" id="username" name="username" value="${user.username}"
                   autocomplete="off" class="layui-input" disabled="disabled">
        </div>
    </div>

    <div class="layui-form-item" >
        <label class="layui-form-label">gender</label>
        <div class="layui-input-block">
            <input type="radio" id="male" name="gender" value="male" title="male" checked="">
            <input type="radio" id="female" name="gender" value="female" title="female">
            <%--<input type="radio" name="sex" value="禁" title="禁用" disabled="">--%>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">phone</label>
            <div class="layui-input-inline">
                <input type="text" id="phone" name="phone" value="${user.phone}"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">birthday</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="birthday" value="${user.birthday}" >
            </div>
        </div>
    </div>



    <div class="layui-form-item">
        <label class="layui-form-label">address</label>
        <div class="layui-input-inline address" >
            <select name="province" id="province" lay-filter="province">
                <option value="">Province</option>
            </select>
        </div>
        <div class="layui-input-inline address">
            <select name="city" id="city" lay-filter="city">
                <option value="">City</option>
            </select>
        </div>
        <div class="layui-input-inline address">
            <select name="area" id="area" lay-filter="area">
                <option value="">Area</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <div class="layui-input-block">
            <textarea id="address" name="address"
                      class="layui-textarea">${user.address}</textarea>
        </div>
    </div>

        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
            <legend>上传多张图片</legend>
        </fieldset>
        <div class="layui-upload">
            <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
                预览图：
                <div class="layui-upload-list" id="demo2"></div>
            </blockquote>
            <button type="button" class="layui-btn" id="test2">多图片上传</button>
        </div>


    <div class="layui-form-item">
        <button class="layui-btn" onclick="save();" style="margin-left: 250px;">save</button>
    </div>
</form>

<script src="${basePath}/layui/layui.js"></script>
<script src="${basePath}/images/jquery.js"></script>
<script src="${basePath}/images/gt.js"></script>

<script type="text/html" id="newDateTemplate">
    {{#return layui.util.toDateString(d.newdate, 'yyyy-MM-dd')}}
</script>

<script>
    $(function(){
        var gender="${user.gender}";//从后端modelandview传递的数据
        if(gender==0){
            $("input[name=gender][value='female']").attr("checked",true);
        }else{
            $("input[name=gender][value='male']").attr("checked",true);
        }
        });


    layui.use(['form','laydate'],function () {
        var form=layui.form,
            laydate=layui.laydate
            ,$=layui.$;

        form.render();

        laydate.render({
            elem: '#birthday'
            ,lang: 'en'
            ,value: new Date()
        });

        //省级数据
        $.ajax({
            type:'post',
            url:'${basePath}/area/ProvinceList.action',
            //data: Province,
            success:function (data) {
                $.each(data, function (i, d) {
                    $("select[name='province']").append("<option value='"+d.code+"'>"+d.name+"</option>");
                });
                form.render('select');
            }
        });
        //监听下拉框
        // lay-filter="province" 具有监听作用的定位代码
        form.on('select(province)',function (data) {//省的信息改变时候
            var code=data.value;
            initCity(code);

            //执行数据会过快，需要加载一个延迟
            window.setTimeout(function () {
                var cityCode=$('#city option:first').val();
                initArea(cityCode)},400);
            });

        function initCity(code){
            $.ajax({
                type:'post',
                url:'${basePath}/area/CityList.action',
                data: {"code":code},
                success:function (data) {
                    $("select[name='city']").empty();
                    $.each(data, function (i, d) {
                        $("select[name='city']").append("<option value='"+d.code+"'>"+d.name+"</option>");
                    });
                    form.render('select');
                }
            });
        }
        //监听下拉框
        form.on('select(city)',function (data) {//城市的信息改变时候
            var code=data.value;
            initArea(code);
        });

        function initArea(code){
            $.ajax({
                type:'post',
                url:'${basePath}/area/AreaList.action',
                data: {"code":code},
                success:function (data) {
                    $("select[name='area']").empty();
                    $.each(data, function (i, d) {
                        $("select[name='area']").append("<option value='"+d.code+"'>"+d.name+"</option>");
                    });
                    form.render('select');
                }
            });
        }


        window.setTimeout(function(){
            initAddress()
        },1000);

        //根据数据库的值填充地址
        function initAddress() {
            var dProvince="${user.province}";
            var dCity="${user.city}";
            var dArea="${user.area}";

            if(dProvince!=null&&dProvince!=""){
                $("#province").find("option:contains('"+dProvince+"')").attr("selected",true);
                initCity($("#province").val());

                window.setTimeout(function(){
                    $("#city").find("option:contains('"+dCity+"')").attr("selected",true);
                    initArea($("#city").val());
                },500);//延迟加载city

                window.setTimeout(function(){
                    $("#area").find("option:contains('"+dArea+"')").attr("selected",true);
                },800);//延迟加载area

                window.setTimeout(function () {
                    form.render('select');
                },1000);
            }
        }

    });

    layui.use('upload', function() {
        var $ = layui.jquery
            , upload = layui.upload;

        //多图片上传
        var uploadInst =upload.render({
            elem: '#test2'
            ,url: '${basePath}/User/uploadPic.action' //改成您自己的上传接口
            ,multiple: true
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                });
            }
            ,done: function(res){
                //上传完毕
                if (res.code=="1") {
                    layer.msg("upload successful");
                }else{
                    layer.msg("upload failure");
                }
            }
            ,error: function(index, upload){
                layer.msg("upload exception");
            }
        });
    });


    function save(){
        var id=$("#userid").val();
        var phone=$("#phone").val();
        var birthday=$("#birthday").val();
        var gender=$("input[name='gender']:checked").val();
        var address=$("#address").val();
        var province=$("#province").find("option:selected").text();
        var city=$("#city").find("option:selected").text();
        var area=$("#area").find("option:selected").text();

        var userData='{"id":'+id+',"gender":"'+gender+'","birthday":"'+birthday+'"' +
            ',"address":"'+address+'","province":"'+province+'","city":"'+city+'"' +
            ',"area":"'+area+'"}';

        $.ajax({
            url:"${basePath}/User/userEdit.action",
            type:"post",
            contentType: "application/json;charset=UTF-8",
            data:userData,
            dataType:"json",
            success:function (data) {
                if (data!="1"){
                    layer.msg("save successful");
                    console.log("save successful");
                }else{
                    console.log("save failure");
                }
                //页面关闭
            }
        });


    }
</script>
</body>
</html>
