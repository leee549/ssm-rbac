package cn.lhx.test;

import cn.lhx.dao.EmployeeDao;
import cn.lhx.entity.Employee;
import cn.lhx.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * @author lee549
 * @date 2020/2/21 13:22
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class MbatisPlusTEST {

    @Autowired
    private EmployeeDao employeeDao;

    @Test
    public void testSelectList(){
        List<Employee> employees = this.employeeDao.selectList(null);
        for (Employee employee:employees){
            System.out.println(employee);
        }
    }



}
