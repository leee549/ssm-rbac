<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
     .lg2 {
        position: absolute;
        top: 26px;
        left: 150px;
    }
</style>
<div class="navbar cm-navbar">
    <img class="logo" alt="Brand" src="/images/logo.png">
    <img src="/images/logo1.png" class="lg2">
    <span class="pageTitle">&nbsp;</span>
    <ul class="nav navbar-nav navbar-right cm-navbar-nav ">
        <li>
           <p class="navbar-text text-info">
               <span class="glyphicon glyphicon-user">${sessionScope.user.name}</span>

           </p>
        </li>
        <li><a href="/logout">安全退出</a></li>
    </ul>
</div>