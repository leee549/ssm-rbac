<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <%@include file="../common/header.jsp" %>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp" %>
    <div class="row">
        <div class="col-sm-3">
            <%--设置当前要回显当前菜单,必须在载人菜单前完成设置--%>
            <c:set var="menu" value="department"/>
            <%@include file="../common/menu.jsp" %>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">部门管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/department/list" method="post">
                <input type="hidden" id="currentPage" name="currentPage" value="1">
                <a href="/department/input" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span> 添加
                </a>
            </form>

            <table class="table table-striped table-hover">
                <tr>
                    <th>编号</th>
                    <th>部门名称</th>
                    <th>部门编号</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="data" items="${result.list}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${data.name}</td>
                        <td>${data.sn}</td>
                        <td>
                            <a class="btn btn-info btn-xs" href="/department/input?id=${data.id}">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </a>
                            <a href="/department/delete/${data.id}" class="btn btn-danger btn-xs">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <%@ include file="../common/page.jsp" %>
        </div>
    </div>
</div>
</body>
</html>