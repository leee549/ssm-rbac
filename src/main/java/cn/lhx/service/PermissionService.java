package cn.lhx.service;

import cn.lhx.entity.Permission;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface PermissionService {

    List<Permission> listAll();

    PageInfo<Permission> query(QueryObject qo);

}
