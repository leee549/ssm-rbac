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
            <c:set var="menu" value="role"/>
            <%@include file="../common/menu.jsp" %>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">角色管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/role/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label>关键字:</label>
                    <input type="text" class="form-control" name="keyword" value="${qo.keyword}"
                           placeholder="请输入名称/编码">
                </div>

                <button id="btn_query" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> 查询
                </button>
                <a href="/role/input" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span> 添加
                </a>
            </form>

            <table class="table table-striped table-hover">
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>编码</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="entity" items="${result.list}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${entity.name}</td>
                        <td>${entity.sn}</td>
                        <td>
                            <a class="btn btn-info btn-xs" href="/role/input?id=${entity.id}">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </a>
                            <a class="btn btn-danger btn-xs" href="/role/delete/${entity.id}">
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