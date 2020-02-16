package cn.lhx.controller;

import cn.hutool.log.Log;
import cn.lhx.base.AjaxResult;
import cn.lhx.entity.Employee;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    private Log log = Log.get();


    @RequestMapping("/login")
    public String loginPage() {
        return "login";
    }

    @ResponseBody
    @PostMapping("/auth/login")
    public AjaxResult login(Employee employee) {

       try {
           Subject subject = SecurityUtils.getSubject();
           UsernamePasswordToken token =
                   new UsernamePasswordToken(employee.getName(),
                           employee.getPassword(),
                           false);
           subject.login(token);
       }catch (UnknownAccountException | IncorrectCredentialsException e){
           return AjaxResult.error(e.getMessage());
       }
        return AjaxResult.success();
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        //清除session
//        session.invalidate();
        SecurityUtils.getSubject().logout();
        return "redirect:/login";
    }

    @RequestMapping("/error")
    public String nopermisson() {
        return "common/nopermission";
    }

}
