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
            <c:set var="menu" value="employee"/>
            <%@include file="../common/menu.jsp"%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">员工管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/employee/list" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label>关键字:</label>
                    <input type="text" class="form-control" name="keyword" value="${qo.keyword}"
                           placeholder="请输入姓名/邮箱">
                </div>
                <div class="form-group">
                    <label>部门:</label>
                    <select class="form-control" id="dept" name="deptId">
                        <option value="-1">全部</option>
                        <c:forEach var="d" items="${depts}">
                            <option value="${d.id}">${d.name}</option>
                        </c:forEach>
                    </select>
                    <script>
                        //回显查询的部门:设置部门ID是 qo.deptId 为选中状态
                        //$("#dept option[value='${qo.sb}']").prop("selected", true);
                    </script>
                </div>
                <button id="btn_query" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> 查询
                </button>
                <a href="/employee/input" class="btn btn-success">
                    <span class="glyphicon glyphicon-plus"></span> 添加
                </a>
            </form>

            <table class="table table-striped table-hover" >
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>email</th>
                    <th>年龄</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="emp" items="${result.list}" varStatus="vs">
                    <tr>
                        <td>${vs.count}</td>
                        <td>${emp.name}</td>
                        <td>${emp.email}</td>
                        <td>${emp.age}</td>
                        <td>${emp.dept.name}</td>
                        <td>
                            <a class="btn btn-info btn-xs" href="/employee/input?id=${emp.id}">
                                <span class="glyphicon glyphicon-pencil"></span> 编辑
                            </a>
                            <a class="btn btn-danger btn-xs" href="/employee/delete/${emp.id}">
                                <span class="glyphicon glyphicon-trash"></span> 删除
                            </a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <%@ include file="../common/page.jsp"%>
        </div>
    </div>
</div>
</body>
</html>