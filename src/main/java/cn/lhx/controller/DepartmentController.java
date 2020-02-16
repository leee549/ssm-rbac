package cn.lhx.controller;

import cn.lhx.entity.Department;
import cn.lhx.service.DepartmentService;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/department")
public class DepartmentController {
    @Resource
    private DepartmentService departmentService;

    @RequestMapping("/list")
    @RequiresPermissions("department:list")
    public String listAll(Model model, QueryObject qo) {
        PageInfo<Department> result = departmentService.query(qo);
        model.addAttribute("result", result);
        return "department/list";
    }

    @RequestMapping("/saveOrUpdate")
    @RequiresPermissions("department:saveOrUpdate")
    public String saveOrUpdate(Department department) {
        if (department.getId() != null) {
            departmentService.update(department);
        } else {
            departmentService.save(department);
        }
        return "redirect:/department/list";

    }

    @RequestMapping("/input")
    @RequiresPermissions("department:input")
    public String input(Integer id, Model model) {
        if (id != null) {
            Department dept = departmentService.selectById(id);
            model.addAttribute("dept", dept);
        }
        return "department/input";
    }

    @RequestMapping("/delete/{id}")
    @RequiresPermissions("department:delete")
    public String delete(@PathVariable Integer id) {
        departmentService.delete(id);
        return "redirect:/department/list";
    }


}
