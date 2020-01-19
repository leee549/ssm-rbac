<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">



<head>
    <%@include file="../common/header.jsp" %>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp" %>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="employee"/>
            <%@include file="../common/menu.jsp" %>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">员工编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/employee/saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" value="${emp.id}" name="id">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" value="${emp.name}"
                                   placeholder="请输入用户名">
                        </div>
                    </div>

                    <%--新增时才显示密码框--%>
                    <c:if test="${empty emp}">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">密码：</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" id="pwd" name="password"
                                       placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">验证密码：</label>
                            <div class="col-sm-6">
                                <input type="password" class="form-control" name="repwd" placeholder="再输入一遍密码">
                            </div>
                        </div>
                    </c:if>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Email：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="email" value="${emp.email}"
                                   placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">年龄：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="age" value="${emp.age}"
                                   placeholder="请输入年龄">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="deptId">
                                <c:forEach var="dept" items="${depts}">
                                    <option value="${dept.id}" ${dept.id==emp.dept.id?"selected":""}>${dept.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <script>
                            //部门回显:设置当前编辑的员工id为选中状态
                           // $('#editForm select[name="dept.id"]').val(${dept.id});

                        </script>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">超级管理员：</label>
                        <label class="checkbox-inline" style="margin-left: 15px;">
                            <input type="checkbox" id="admin" name="admin">
                        </label>
                    </div>
                    <div class="form-group" id="role">
                        <div>
                            <label class="control-label" style="margin-left: 60px">角色：</label>
                        </div>
                        <div class="row" style="margin-top: 10px">
                            <div class="col-sm-4 col-sm-offset-1">
                                <%--显示系统中所有的角色--%>
                                <select multiple class="form-control allRoles" size="15">
                                    <c:forEach var="role" varStatus="vs" items="${roles}">
                                        <option value="${role.id}">${role.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-2" style="margin-top: 60px;" align="center">
                                <div>
                                    <a type="button" class="btn btn-info  " style="margin-top: 10px"
                                       onclick="moveSelected('allRoles', 'selfRoles')">&nbsp;&gt;&nbsp;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveSelected('selfRoles', 'allRoles')">&nbsp;&lt;&nbsp;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveAll('allRoles', 'selfRoles')">&gt;&gt;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveAll('selfRoles', 'allRoles')">&lt;&lt;</a>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <select multiple class="form-control selfRoles" size="15" name="ids">
                                    <%--显示当前用户拥有的角色--%>
                                    <%--<c:forEach var="role" items="${emp.roles}">--%>
                                        <%--<option value="${role.id}">${role.name}</option>--%>
                                    <%--</c:forEach>--%>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-6">
                            <button id="btn_submit" type="button" class="btn btn-success">
                                <span class="glyphicon glyphicon-saved"></span> 保存
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        // 定义变量role,用于存储被移除的角色下拉框
        var role = null;

        $('#btn_submit').click(function () {
            //1:先选中右边select的所有选项
            $('.selfRoles option').prop('selected', true);
            //2:再提交表单
            $('#editForm').submit();
        });

        $('#admin').click(function () {
            console.log(this.checked);
            //当勾选"超管"复选框时,移出角色下拉框,否则恢复角色下拉框
            if (this.checked) {
                role = $('#role').remove();
            } else {
                $('#admin').closest('div').after(role);
            }
        });

        //将右边已存在的角色,从左边select中移除
        $.each($('.selfRoles option'),function (index, ele) {
            $('.allRoles option[value="'+ele.value+'"]').remove();
        });

        //超管回显
        <c:if test="${emp.admin}">
            //移除
            role = $('#role').remove();
            //打钩
            $('#admin').prop('checked', true);
        </c:if>

    });

    //移动全部选项
    function moveAll(rolesClass1, rolesClass2) {
        $('.' + rolesClass1 + ' option').appendTo($('.' + rolesClass2));
    }

    //移动选中的选项
    function moveSelected(rolesClass1, rolesClass2) {
        $('.' + rolesClass1 + ' option:selected').appendTo($('.' + rolesClass2));
    }

</script>
</body>
</html>