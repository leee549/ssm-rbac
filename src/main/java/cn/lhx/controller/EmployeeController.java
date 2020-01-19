package cn.lhx.controller;

import cn.lhx.entity.Department;
import cn.lhx.entity.Employee;
import cn.lhx.entity.Role;
import cn.lhx.service.DepartmentService;
import cn.lhx.service.EmployeeService;
import cn.lhx.service.RoleService;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Resource
    private EmployeeService employeeService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private RoleService roleService;

    @RequestMapping("/list")
    public String listAll(Model model, QueryObject qo) {

        PageInfo<Employee> result = employeeService.query(qo);
        List<Department> depts = departmentService.listAll();
        model.addAttribute("result", result);
        model.addAttribute("depts", depts);
        return "employee/list";
    }

    @RequestMapping("/saveOrUpdate")
    public String saveOrUpdate(Employee employee) {
        if (employee.getId() != null) {
            employeeService.update(employee);
            // System.out.println("=========拿到id=========");
        } else {
            employeeService.save(employee);
            //System.out.println("拿不到id=============");
        }
        return "redirect:/employee/list";

    }

    /**
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("/input")
    public String input(Integer id, Model model) {
        if (id != null) {
            Employee emp = employeeService.selectById(id);
            model.addAttribute("emp", emp);
        }
        model.addAttribute("depts", departmentService.listAll());
        model.addAttribute("roles", roleService.listAll());
        return "employee/input";
    }

    /**
     * @param id
     * @return
     */
    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        employeeService.deleteById(id);
        return "redirect:/employee/list";
    }


}
