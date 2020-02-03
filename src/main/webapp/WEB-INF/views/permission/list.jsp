<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp"%>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp"%>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="permission"/>
            <%@include file="../common/menu.jsp"%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">权限管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/permission/page" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <a href="/permission/reload" class="btn btn-success">
                    <span class="glyphicon glyphicon-refresh"></span> 重新加载权限
                </a>
            </form>

            <table class="table table-striped table-hover" >
                <tr>
                    <th>编号</th>
                    <th>权限名称</th>
                    <th>权限表达式</th>
                </tr>
                <c:forEach items="${page.data}" var="permission" varStatus="vs">
                    <tr>
                       <td>${vs.count}</td>
                       <td>${permission.name}</td>
                       <td>${permission.expression}</td>
                    </tr>
                </c:forEach>
            </table>
            <%@ include file="../common/page.jsp"%>
        </div>
    </div>
</div>
</body>
</html>