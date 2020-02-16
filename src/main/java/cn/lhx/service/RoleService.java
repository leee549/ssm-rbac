package cn.lhx.service;

import cn.lhx.entity.Role;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Set;

public interface RoleService {


    PageInfo<Role> query(QueryObject qo);

    List<Role> listAll();

    Role selectById(Long id);


    Set<String> querySnByEmployeeId(Long id);
}
