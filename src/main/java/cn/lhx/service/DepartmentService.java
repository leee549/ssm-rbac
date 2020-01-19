package cn.lhx.service;

import cn.lhx.entity.Department;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface DepartmentService {

    void delete(Integer id);

    void save(Department department);

    Department selectById(Integer id);

    List<Department> listAll();

    PageInfo<Department> query(QueryObject qo);

    void update(Department department);

}
