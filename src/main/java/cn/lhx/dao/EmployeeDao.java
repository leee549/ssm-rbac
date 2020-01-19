package cn.lhx.dao;

import cn.lhx.entity.Employee;
import cn.lhx.utils.page.QueryObject;

import java.util.List;

public interface EmployeeDao {
    List<Employee> listAll();

    int insert(Employee employee);

    void update(Employee employee);

    Employee selectById(Integer id);

    void deleteById(Integer id);

    Employee login(Employee employee);

    List<Employee> selectList(QueryObject qo);
}
