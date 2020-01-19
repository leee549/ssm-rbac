package cn.lhx.controller;

import cn.lhx.entity.Employee;
import cn.lhx.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private EmployeeService employeeService;

    @RequestMapping("/login")
    public String loginPage() {
        return "/login";
    }

    @ResponseBody
    @PostMapping("/auth/login")
    public boolean login(Employee employee , HttpServletRequest request) {
        if (null!= employeeService.login(employee).getId()) {
           request.getSession().setAttribute("user",employeeService.login(employee));
            return true;
        }
        return false;
    }
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //清除session
        session.invalidate();
        return "redirect:/login";
    }

}
