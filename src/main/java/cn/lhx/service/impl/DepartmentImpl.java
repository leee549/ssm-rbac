package cn.lhx.service.impl;

import cn.lhx.dao.DepartmentDao;
import cn.lhx.entity.Department;
import cn.lhx.service.DepartmentService;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentImpl implements DepartmentService {
    @Autowired
    private DepartmentDao departmentDao;

    @Override
    public PageInfo<Department> query(QueryObject qo) {

        PageHelper.startPage(qo.getCurrentPage(),qo.getPagesize());
        List<Department> depts = departmentDao.listAll();
        PageInfo<Department> pageInfo = new PageInfo<>(depts);
        return pageInfo;
    }

    @Override
    public void delete(Integer id) {
        departmentDao.deleteByPrimaryKey(id);
    }

    @Override
    public void save(Department department) {
        departmentDao.insert(department);
    }

    @Override
    public Department selectById(Integer id) {
        return departmentDao.selectByPrimaryKey(id);
    }

    @Override
    public List<Department> listAll() {
        return departmentDao.listAll();
    }


    @Override
    public void update(Department department) {
        departmentDao.updateByPrimaryKey(department);
    }
}
