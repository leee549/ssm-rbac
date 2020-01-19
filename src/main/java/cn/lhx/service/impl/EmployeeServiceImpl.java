package cn.lhx.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.lhx.dao.EmployeeDao;
import cn.lhx.entity.Employee;
import cn.lhx.service.EmployeeService;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
@Log4j
public class EmployeeServiceImpl implements EmployeeService {

    @Resource
    private EmployeeDao employeeDao;

    private boolean isNotEmpty(QueryObject qo) {
        return StrUtil.isNotEmpty(qo.getKeyword())|| ObjectUtil.isNotEmpty(qo.getDeptId());
    }

    @Override
    public PageInfo<Employee> query(QueryObject qo) {
        List<Employee> employee;
        PageHelper.startPage(qo.getCurrentPage(), qo.getPagesize());
        if (isNotEmpty(qo)){
            employee = employeeDao.selectList(qo);
        }else {
            employee = employeeDao.listAll();
        }
            PageInfo<Employee> pageInfo = new PageInfo<>(employee);

        return pageInfo;
    }

//    @Override
//    public List<Employee> listAll() {
//
//        return employeeDao.listAll();
//    }

    @Override
    public void save(Employee employee) {
        employeeDao.insert(employee);
    }

    @Override
    public void update(Employee employee) {
        employeeDao.update(employee);
    }

    @Override
    public Employee selectById(Integer id) {
        return employeeDao.selectById(id);
    }

    @Override
    public void deleteById(Integer id) {
        employeeDao.deleteById(id);
    }

    @Override
    public Employee login(Employee employee) {
        return employeeDao.login(employee);
    }
}
