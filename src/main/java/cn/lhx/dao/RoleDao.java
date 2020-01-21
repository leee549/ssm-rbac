package cn.lhx.dao;

import cn.lhx.entity.Role;

import java.util.List;

public interface RoleDao {
    List<Role> listAll();

    List<Role> selectByEmployeeId(Long id);

    Role selectById(Long id);

}
