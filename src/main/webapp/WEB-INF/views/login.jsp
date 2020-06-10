<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>叩丁狼客户关系管理系统-登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/adminlte/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/adminlte/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/adminlte/css/fonts.googleapis.com.css">

    <script src="${pageContext.request.contextPath}/js/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/adminlte/js/adminlte.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/plugins/twbsPagination/jquery.twbsPagination.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/system/commonAll.js"></script>
    <script type="text/javascript">
        $(function () {
            // var verKey;
            // // 获取验证码
            // $.get('/captcha', function(res) {
            //     verKey = res.key;
            //     $('#verImg').attr('src', res.image);
            // },'json');
            //页面回退刷新




                $(".submitBtn").click(function () {
                $.post("/auth/login", $("#loginForm").serialize(), function (data) {
                    console.log("up:"+data);
                    if (data.ret === true) {
                        console.log(data);
                        window.location.href = "employee/list";
                    } else {
                        alert(data.msg);
                        window.location.href = "login";
                    }
                })
            })


        });
    </script>
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="http://www.wolfcode.cn"><b>叩丁狼</b>CRM</a>
    </div>
    <div class="login-box-body">
        <p class="login-box-msg">请输入账号密码</p>

        <form method="post" id="loginForm">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="请输入账号" name="name" value="admin">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="请输入密码" name="password" value="1">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback ">
                <input type="text" class="form-control" maxlength="5" placeholder="请输入验证码" name="verCode" >
                <span class="glyphicon glyphicon-folder-close form-control-feedback "></span>
                <img src="/captcha" onclick="this.src=this.src+'?' "id="verImg" width="130px" height="48px"/>
            </div>


            <div class="row">
                <div class="col-xs-4">
                    <button type="button" class="btn btn-primary btn-block btn-flat submitBtn">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>


<script>


</script>