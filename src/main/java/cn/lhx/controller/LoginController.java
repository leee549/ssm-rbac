package cn.lhx.controller;

import cn.hutool.log.Log;
import cn.lhx.base.AjaxResult;
import cn.lhx.entity.Employee;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LoginController {

    private Log log = cn.hutool.log.Log.get();

    @RequestMapping("/login")
    public String loginPage() {
        return "login";
    }

    @ResponseBody
    @PostMapping("/auth/login")
    public AjaxResult login(Employee employee, HttpServletRequest request) {
        // 这里直接try catch ，因为你那种全局异常处理不能处理 Rest 形式的接口
        try {
            Subject subject = SecurityUtils.getSubject();
            request.getSession().setAttribute("user", employee.getName());
            UsernamePasswordToken token =
                    new UsernamePasswordToken(employee.getName(),
                            employee.getPassword(),
                            false);
            subject.login(token);
            return AjaxResult.success();
        } catch (AuthenticationException e) {
            final String msg = "账号或密码错误";
            return AjaxResult.error(msg);
        }
    }

    @RequestMapping("/logout")
    public String logout() {
        SecurityUtils.getSubject().logout();
        return "redirect:/login";
    }

    @RequestMapping("/error")
    public String nopermisson() {
        return "common/nopermission";
    }

}
