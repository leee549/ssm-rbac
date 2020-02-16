package cn.lhx.controller;

import cn.lhx.entity.Role;
import cn.lhx.service.PermissionService;
import cn.lhx.service.RoleService;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;
    @Resource
    private PermissionService permissionService;

    @RequestMapping("/list")
    @RequiresPermissions("role:list")
    public String listAll(Model model, QueryObject qo) {
        PageInfo<Role> result = roleService.query(qo);
        model.addAttribute("result", result);

        return "/role/list";
    }

    @RequestMapping("/input")
    @RequiresPermissions("role:input")
    public String input(Long id, Model model) {
        if (id != null) {
            model.addAttribute("role", roleService.selectById(id));
        }
        model.addAttribute("permissions", permissionService.listAll());
        return "role/input";
    }
}
