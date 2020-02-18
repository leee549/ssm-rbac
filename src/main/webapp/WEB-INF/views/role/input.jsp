<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="../common/header.jsp"%>
</head>
<body>

<div class="container " style="margin-top: 20px">
    <%@include file="../common/top.jsp"%>
    <div class="row">
        <div class="col-sm-3">
            <c:set var="menu" value="role"/>
            <%@include file="../common/menu.jsp"%>
        </div>
        <div class="col-sm-9">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">角色编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/role/saveOrUpdate" method="post" id="editForm">
                    <input type="hidden" value="${role.id}" name="id">
                    <div class="form-group" >
                        <label class="col-sm-2 control-label">角色名称：</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" name="name" value="${role.name}" placeholder="请输入角色名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色编码：</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" name="sn" value="${role.sn}" placeholder="请输入角色编码">
                        </div>
                    </div>

                    <div class="form-group" id="role">
                        <div>
                            <label class="control-label" style="margin-left: 60px">权限：</label>
                        </div>
                        <div class="row" style="margin-top: 10px">
                            <div class="col-sm-4 col-sm-offset-1">
                                <select multiple class="form-control allPermissions" size="15">
                                    <%--系统中拥有的所有权限--%>
                                    <c:forEach var="perm" items="${permissions}">
                                        <option value="${perm.id}">${perm.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-2" style="margin-top: 60px;" align="center">
                                <div >
                                    <a type="button" class="btn btn-info  "  style="margin-top: 10px"
                                       onclick="moveSelected('allPermissions', 'selfPermissions')">&nbsp;&gt;&nbsp;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveSelected('selfPermissions', 'allPermissions')">&nbsp;&lt;&nbsp;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveAll('allPermissions', 'selfPermissions')">&gt;&gt;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveAll('selfPermissions', 'allPermissions')">&lt;&lt;</a>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <select multiple class="form-control selfPermissions" size="15" name="ids">
                                    <%--回显当前角色拥有的权限--%>

                                        <c:forEach var="p" items="${role.permissions}">
                                            <option value="${p.id}">${p.name}</option>
                                        </c:forEach>

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
    $(function(){
        $('#btn_submit').click(function () {
            //1:先选中右边select的所有选项
            $('.selfPermissions option').prop('selected', true);
            //2:提交表单
            $('#editForm').submit();
        });

        //将右边已存在的权限,从左边select中移除
        $.each($('.selfPermissions option'),function (index, ele) {
            $('.allPermissions option[value="'+ele.value+'"]').remove();
        });

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