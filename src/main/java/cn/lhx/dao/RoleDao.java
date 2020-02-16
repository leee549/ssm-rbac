package cn.lhx.dao;

import cn.lhx.entity.Role;

import java.util.List;
import java.util.Set;

public interface RoleDao {
    List<Role> listAll();

    List<Role> selectByEmployeeId(Long id);

    Role selectById(Long id);


    Set<String> querySnByEmployeeId(Long id);
}
