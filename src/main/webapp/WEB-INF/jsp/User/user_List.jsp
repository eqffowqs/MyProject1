
<%--没有pageEncoding会乱码--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1.0
    ,maximum-scale=0.2,minimum-scale=1.0,user-scalable=yes">

    <link rel="stylesheet" href="${basePath}/layui/css/layui.css" media="all">
    <%-- <link rel="stylesheet" href="${basePath}/images/login.css">--%>
    <style type="text/css">
        .layui-table-view .layui-form-checkbox[lay-skin=primary] i {
            width: 18px;
            height: 18px;
            margin-top: 6px;
        }
        .username{
            margin-top: 20px;
            margin-left: 20px;
            margin-bottom: 10px;
            width: 300px;
        }
        .query-btn{
            margin-left:auto;
        }
    </style>
</head>
<body>

<%--<form class="layui-form layui-form-pane" action="">
    <div class="layui-inline username">
        <label class="layui-form-label">username</label>
        <div class="layui-input-inline">
            <input type="text" name="username" id="username" lay-verify="title"
             autocomplete="off" placeholder="input name" class="layui-input">
        </div>
        <input type="button" id="query" name="query_btn" class="layui-btn
        layui-btn-warm query-btn" value="search"/>
    </div>
</form>--%>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-inline username" >
        <label class="layui-form-label">username</label>
        <div class="layui-input-inline">
            <input type="text" id="username" name="username" lay-verify="required"
                   placeholder="input name" autocomplete="off" class="layui-input">
            <%--<input type="button" id="query" class="layui-btn layui-btn-warm
            query-btn" value="retrieval" />--%>
        </div>
    </div>
    <%--<div class="layui-inline username" >
        <label class="layui-form-label">gender</label>
        <div class="layui-input-inline sex-select" style="width:100px;">
        <select name="sex"  id="sex">
            <option value="">select</option>
            <option value="male">male</option>
            <option value="female">female</option>
        </select>
    </div>--%>
        <input type="button" id="query" class="layui-btn layui-btn-warm query-btn"
               value="retrieval" style="margin-top: 10px;"/>
    </div>
</form>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="add">add</button>
        <button class="layui-btn layui-btn-sm" lay-event="del_more">del more</button>
        <%--<button class="layui-btn layui-btn-sm" lay-event="isAll">isAll</button>--%>
    </div>
</script>

<table class="layui-hide" id="user" lay-filter="user"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">edit</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">delete</a>
</script>

<script type="text/html" id="newDateTemplate">
    {{#return layui.util.toDateString(d.newdate, 'yyyy-MM-dd')}}
</script>

<script src="${basePath}/layui/layui.js"></script>
<script src="${basePath}/images/jquery.js"></script>
<script src="${basePath}/images/gt.js"></script>

<%--传递id--%>
<script type="text/html" id="getid">
<%--<input value="{{d.id}}" />--%>
    {{#
    return d.id
    }}
</script>
<%--格式化地址信息--%>
<script type="text/html" id="address">
{{#
    return d.province+d.city+d.area+d.address
    }}
</script>

<script>
    layui.use(['table','util','form'], function(){
            util=layui.util,
            table=layui.table,
            form=layui.form;

            form.render();

        var tableIns=table.render({
            elem: '#user'
            ,url:'${basePath}/User/list.action'
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left',style:'margin-bottom:30px'}
                ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true
                    , sort: true,templet:'#getid'}
                ,{field:'username', title:'name', width:80, edit: 'text'}
                ,{field:'phone', title:'phone', width:150}
                ,{field:'gender', title:'gender', width:80}
                ,{field:'address', title:'address', width:100,templet:'#address'}
                /*,{field:'state', title:'state', width:100}*/
                ,{field:'birthday', title:'birthday', width:120, templet:'#newDateTemplate'}
                ,{fixed: 'right', title:'operation', toolbar: '#barDemo', width:118}
            ]]
            ,page: true,
             done:function () {
                 $("[data-field='id']").css("display","none");
            }
        });

        //头工具栏事件
        table.on('toolbar(user)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    /*var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;*/
                    layer.open({
                        type: 2,
                        title: 'new user',
                        area: ['700px', '520px'],
                        maxmin:true,
                        content: '${basePath}/User/add.action' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    });
                case 'del_more':
                    var data = checkStatus.data;
                    //layer.msg('选中了：'+ data.length + ' 个');
                    break;
                /*case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选': '未全选');
                    break;*/

                //自定义头工具栏右侧图标 - 提示
               /* case 'LAYTABLE_TIPS':
                    layer.alert('这是工具栏右侧自定义的一个图标按钮');
                    break;*/
            };
            /*layer.open({
                type: 2,
                title: 'new user',
                area: ['700px', '520px'],
                content: '$//{basePath}/User/add.action' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });*/

        });

        //监听行工具事件
        table.on('tool(user)', function(obj){
            var data = obj.data;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('confirm delete', function(index){
                    //测试代码,通过id删除用户
                   $.ajax({
                        type:'post',
                        url:'${basePath}/User/userDelete.action',
                        data: {"id":data.id},
                        dataType:"json",
                        success:function (data) {
                            if (data==1) {
                                layer.msg("delete success");
                            }else{
                                layer.msg("what's this");
                            }
                        }
                    });

                    //通过姓名删用户
                   /* $.ajax({
                        type:'post',
                        url:'${basePath}/User/userDelete_name.action',
                        data: {"name":data.username},
                        title:'name',
                        success:function (data) {
                            if (data==1) {
                                layer.msg("delete success");
                            }else{
                                layer.msg("what's this");
                            }
                        }
                    });*/

                    obj.del();
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                layer.open({
                    type: 2,
                    title: 'new user',
                    maxmin:true,
                    area: ['700px', '520px'],
                    //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                    content: '${basePath}/User/Edit.action?id='+data.id
                });
            }


        });

        $("#query").click(function(){
            tableIns.reload({
            where: { //设定异步数据接口的额外参数，任意设
                username: $("#username").val()
               // ,gender: $("#gender").val()
                //…
            }
            ,page: {
                curr: 1 //重新从第 1 页开始
            }
        });
        });
    });
</script>
</body>
</html>