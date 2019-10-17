<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>指标管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel = "shortcut icon" href="${site.logo}">
    <link rel="stylesheet" href="${base}/static/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${base}/static/css/user.css" media="all" />
</head>
<body class="childrenBody">
<div style="text-align: center; padding:11% 0;">
    <i class="layui-icon" style="line-height:20rem; font-size:20rem; color: #393D50;">&#xe61c;</i>
    <p style="font-size: 20px; font-weight: 300; color: #999;">批次已开启</p>
    <p style="font-size: 20px; font-weight: 300; color: #999;">不能对指标进行操作，请结束批次再操作此功能</p>
    <#--<#if e??>-->
    <#--<pre class="layui-code">-->
    <#--${e.message}-->
    <#--</pre>-->
    <#--</#if>-->
</div>
<script type="text/javascript" src="${base}/static/layui/layui.js"></script>
<script>
    layui.use('code', function(){ //加载code模块
        layui.code({
            title:'Java Exception Message',
            encode:true
        }); //引用code方法
    });
</script>
</body>
</html>