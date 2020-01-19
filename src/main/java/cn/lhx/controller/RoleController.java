package cn.lhx.controller;

import cn.lhx.entity.Role;
import cn.lhx.service.RoleService;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping("/list")
    public String listAll(Model model, QueryObject qo){
        PageInfo<Role> result = roleService.query(qo);
        model.addAttribute("result",result);

        return "/role/list";
    }
}
