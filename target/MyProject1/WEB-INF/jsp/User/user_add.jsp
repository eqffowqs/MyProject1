<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019-11-22
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <title>add user</title>
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
<form class="layui-form layui-form-pane"  method="post" enctype="multipart/form-data" >
    <div class="layui-form-item">
        <label class="layui-form-label">name</label>
        <div class="layui-input-inline">
            <input type="text" id="username" name="username" lay-verify="required" placeholder="create a name"
                   autocomplete="off" class="layui-input"  >
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">password</label>
        <div class="layui-input-inline">
            <input type="password" id="password" name="password" lay-verify="required"
                   placeholder="password" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">Please fill in password</div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">password</label>
        <div class="layui-input-inline">
            <input type="password" id="password2" name="password2" lay-verify="required"
                   placeholder="password" autocomplete="off" class="layui-input" >
        </div>
        <div class="layui-form-mid layui-word-aux">Please fill in password</div>
    </div>

    <div class="layui-form-item" >
        <label class="layui-form-label">gender</label>
        <div class="layui-input-block">
            <input type="radio" id="male" name="sex" filter="gender" value="male" title="male" checked="">
            <input type="radio" id="female" name="sex" filter="gender" value="female" title="female">
            <%--<input type="radio" name="sex" value="禁" title="禁用" disabled="">--%>
        </div>
    </div>

    <div class="layui-form-item" >
        <div class="layui-inline">
            <label class="layui-form-label">phone</label>
            <div class="layui-input-inline">
                <input type="tel" id="phone" name="phone"  autocomplete="off" class="layui-input" lay-verify="required"><%--lay-verify="required|phone"--%>
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">birthday</label>
            <div class="layui-input-inline">
                <input id="birthday" name="birthday" type="text" class="layui-input"  >
            </div>
        </div>
    </div>

    <%--<div class="layui-form-item">
        <label class="layui-form-label">state-on</label>
        <div class="layui-input-block">
            <input type="checkbox" checked="" id="state" name="state" lay-skin="switch" lay-filter="switchTest" title="switch">
        </div>
    </div>--%>

    <div class="layui-form-item">
        <label class="layui-form-label">address</label>
        <div class="layui-input-inline address" >
            <select name="province" id="province" lay-filter="province" lay-verify="required">
                <option value="">Province</option>
            </select>
        </div>
        <div class="layui-input-inline address">
            <select name="city" id="city" lay-filter="city" lay-verify="required">
                <option value="">City</option>
            </select>
        </div>
        <div class="layui-input-inline address">
            <select name="area" id="area" lay-filter="area" lay-verify="required">
                <option value="">Area</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <div class="layui-input-block">
            <textarea placeholder="input detailed address" class="layui-textarea" id="address"
                      name="address" lay-verify="required"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <%--<button class="layui-btn" lay-filter="submit" >submit</button>--%>
        <input class="layui-btn layui-btn-warm" lay-submit lay-filter="*" type="button" value="提交" />
        <%--
            <button class="layui-btn" lay-submit="" lay-filter="" onclick="save();">submit2</button>
             onclick之类的方法要在layui.use 方法体之外，不然无法绑定函数
         --%>
    </div>
</form>


<script src="${basePath}/layui/layui.js"></script>
<script src="${basePath}/images/jquery.js"></script>
<script src="${basePath}/images/gt.js"></script>

<script type="text/javascript">
    layui.use(['form','laydate'],function () {
        var form=layui.form,
            laydate=layui.laydate;

        form.render();//表单自动修饰成功

        laydate.render({
            elem: '#birthday'
            ,lang: 'en'
            ,value: new Date()
        });

        //监听提交事件
        form.on('submit(*)',function(data){
            console.log( "submit "+data.field);
            alert( "submit "+data.field);
            var password1=$("#password").val();
            var password2=$("#password2").val();


            if (password1!=password2){
                layer.msg("two passwords are inconsistent!");
                return false;
                //未解决：使两次密码都变空白
            }
            var user=data.field;
            delete user.file;
            delete user.password2;
            user.province=$("#province").find("option:selected").text();
            user.city=$("#city").find("option:selected").text();
            user.area=$("#area").find("option:selected").text();

            var userInfo=JSON.stringify(user);
            $.ajax({
                type:'post',
                contentType: "application/json;charset=UTF-8",
                url:'${basePath}/User/userSave.action',
                data: userInfo,
                async: true,
                dataType:"json",
                success:function (data) {
                    if (data==1) {
                        layer.msg("save success");
                    }else{
                        layer.msg("what's this");
                    }
                }
            });
            return false;
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



        $("#username").blur(function () {
       //function checkName() {
            //alert("what is this");
            var username1=$("#username").val();

            if(username1==null||username1==""){

                layui.use(['layer','form'],function () {
                    layer.open({
                        title: 'Tips'
                        ,content:'Name cannot be empty!'+username1
                    });
                });
                return false;
            }
            $.ajax({
                type:'post',
                url:'${basePath}/User/checkName.action',
                data: {"name": username1},
                dataType:"json",
                success:function (data) {
                    if (data=="0"){
                        layui.use(['layer','form'],function () {
                            layer.open({
                            title: 'Tips'
                            ,content:'Name occupied, restart name!'+username1
                            });
                        });
                    }else{
                        console.log(data+"this is empty name");
                    }
                }
            })

        });

        /*$("#password2").blur(function () {
            var p1=$("#password1").val();
            var p2=$("#password2").val();
            console.log(p1+"ttttttttttt"+p2);
            if (p1!=p2){
                alert("twossssssss");
                delete p2;
                return false;
            }
        })*/

    })

    function save() {
        alert("this is save method!");
    }

    /*function checkPassword() {
        var p1=$("#password1").val();
        var p2=$("#password2").val();
        console.log(p1+"pppppppp"+p2);
        if (p1!=p2){
            alert("two");
            delete p2;
            return false;
        }
    }*/
</script>
</body>
</html>
