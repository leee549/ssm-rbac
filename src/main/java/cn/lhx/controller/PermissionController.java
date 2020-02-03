package cn.lhx.controller;

import cn.lhx.service.PermissionService;
import cn.lhx.utils.page.QueryObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/permission")
public class PermissionController {

    @Resource
    PermissionService permissionService;

    @RequestMapping("/list")
    public String listAll(QueryObject qo, Model model) {

        model.addAttribute("result",permissionService.query(qo));
        return "permission/list";
    }
}
