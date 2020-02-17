package cn.lhx.dao;

import cn.lhx.entity.Employee;
import cn.lhx.utils.page.QueryObject;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
    List<Employee> listAll();

    int insert(Employee employee);

    void update(Employee employee);

    Employee selectById(Integer id);

    void deleteById(Integer id);

    Employee login(Employee employee);

    List<Employee> selectList(QueryObject qo);
    // 新增新的员工-角色关系
    void insertRelation(@Param("employeeId")Long employeeId, @Param("roleId")Long roleId);
    // 删除旧的员工-角色关系
    void deleteRelation(@Param("employeeId")Long id);

    /**
     * 获取登录用户名
     * @param name
     * @return
     */
    Employee selectByName(String name);

    /**
     * 注册时更新加密后的密码
     * @param employee
     */
    void updatePwd(Employee employee);
}
