package cn.lhx.dao;

import cn.lhx.entity.Department;


import java.util.List;


public interface DepartmentDao {
    void deleteByPrimaryKey(Integer id);

    void insert(Department department);

    Department selectByPrimaryKey(Integer id);

    List<Department> listAll();

    void updateByPrimaryKey(Department department);
}