<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程用户修改--${site.name}</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <style type="text/css">
        .layui-form-item .layui-inline{ width:33.333%; float:left; margin-right:0; }
        @media(max-width:1240px){
            .layui-form-item .layui-inline{ width:100%; float:none; }
        }
        .layui-form-item .role-box {
            position: relative;
        }
        .layui-form-item .role-box .jq-role-inline {
            height: 100%;
            overflow: auto;
        }

    </style>
</head>
<body class="childrenBody">
<form class="layui-form" style="width:80%;">
    <input class="layui-hide" name="id" value="${course.id}"/>
    <div class="layui-form-item">
        <label class="layui-form-label">课程名称</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="name" lay-verify="required" placeholder="课程名称" value="${course.name}">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">课程代码</label>
            <div class="layui-input-block">
                <input type="text" class="layui-input" name="code" lay-verify="required" placeholder="课程代码" value="${course.code}">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程备注</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" name="note" lay-verify="required" placeholder="课程备注" value="${course.note}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否启用</label>
        <div class="layui-input-block">
            <input type="checkbox" name="status" lay-skin="switch" value="1"  lay-text="启用|停用" <#if (course.status  == 1)>checked=""</#if> >
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="addCourse">我要修改</button>
            <button class="layui-btn"   class="layui-btn layui-btn-primary">我不改了</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    var index = parent.layer.getFrameIndex(window.name); //当前窗口索引
    layui.use(['form','jquery','layer'],function(){
        var form = layui.form,
                $    = layui.jquery,
                layer = layui.layer,
                status = ${course.status};

        form.on("submit(addCourse)",function(data){
            if(data.field.id == null){
                layer.msg("课程ID不存在");
                return false;
            }
            //判断用户是否启用
            if(undefined !== data.field.status && null != data.field.status){
                data.field.status = 1;
            }else{
                data.field.status = 0;
            }
            var loadIndex = layer.load(2, {
                shade: [0.3, '#333']
            });
            $.ajax({
                type:"POST",
                url:"${base}/admin/system/course/edit",
                dataType:"json",
                contentType:"application/json",
                data:JSON.stringify(data.field),
                success:function(res){
                    layer.close(loadIndex);
                    if(res.success){
                        parent.layer.msg("课程编辑成功！",{time:1500},function(){
                            parent.location.reload();
                        });
                    }else{
                        layer.msg(res.message);
                    }
                }
            });
            return false;
        });

    });
</script>
</body>
</html>