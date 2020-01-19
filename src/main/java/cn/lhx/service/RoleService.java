package cn.lhx.service;

import cn.lhx.entity.Role;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface RoleService {

    PageInfo<Role> query(QueryObject qo);

    List<Role> listAll();
}
