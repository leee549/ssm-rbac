package cn.lhx.service;

import cn.lhx.entity.Employee;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;

public interface EmployeeService {

    PageInfo<Employee> query(QueryObject qo);

    //List<Employee> listAll();

    void save(Employee employee, Long[] ids);

    void update(Employee employee, Long[] ids);

    Employee selectById(Integer id);

    void deleteById(Integer id);

    Employee login(Employee employee);


}
