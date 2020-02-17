package cn.lhx.service.impl;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.lhx.dao.EmployeeDao;
import cn.lhx.entity.Employee;
import cn.lhx.service.EmployeeService;
import cn.lhx.utils.Md5Util;
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
        return StrUtil.isNotEmpty(qo.getKeyword()) || ObjectUtil.isNotEmpty(qo.getDeptId());
    }

    @Override
    public PageInfo<Employee> query(QueryObject qo) {
        List<Employee> employee;
        PageHelper.startPage(qo.getCurrentPage(), qo.getPagesize());
        if (isNotEmpty(qo)) {
            employee = employeeDao.selectList(qo);
        } else {
            employee = employeeDao.listAll();
        }
        PageInfo<Employee> pageInfo = new PageInfo<>(employee);

        return pageInfo;
    }


    @Override
    public void save(Employee employee, Long[] ids) {
        // 你到这里的时候，还没插入，自增id 就还没有
        employeeDao.insert(employee);
        // 加密
        String salt = employee.getId().toString();

        employee.setPassword(Md5Util.encode(employee.getPassword(), salt));
        // 更新加密后的密码
        this.employeeDao.updatePwd(employee);
        if (ids != null) {
            for (Long roleId : ids) {
                employeeDao.insertRelation(employee.getId(), roleId);
            }
        }
    }


    @Override
    public void update(Employee employee, Long[] ids) {
        employeeDao.update(employee);
        if (ids != null) {
            employeeDao.deleteRelation(employee.getId());
            for (Long roleId : ids) {
                employeeDao.insertRelation(employee.getId(), roleId);
            }
        }

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

    @Override
    public Employee selectByName(String username) {
        return employeeDao.selectByName(username);
    }
}
