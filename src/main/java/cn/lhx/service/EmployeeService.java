package cn.lhx.service;

import cn.lhx.entity.Employee;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface EmployeeService {

    PageInfo<Employee> query(QueryObject qo);

    //List<Employee> listAll();

    void save(Employee employee);

    void update(Employee employee);

    Employee selectById(Integer id);

    void deleteById(Integer id);

    Employee login(Employee employee);


}
