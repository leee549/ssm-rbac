package cn.lhx.controller;

import cn.hutool.log.Log;
import cn.lhx.base.AjaxResult;
import cn.lhx.entity.Employee;
import com.wf.captcha.GifCaptcha;
import com.wf.captcha.utils.CaptchaUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


@Controller
public class LoginController {

    private Log log = cn.hutool.log.Log.get();

    @RequestMapping("/login")
    public String loginPage() {
        return "login";
    }

    @ResponseBody
    @PostMapping("/auth/login")
    public AjaxResult login(Employee employee, HttpServletRequest request, String verCode) {
        //把前端传来的值 与session 中的 验证码进行比较
        System.out.println(request.getSession().getAttribute("captcha"));
        if (!CaptchaUtil.ver(verCode, request)) {
            // 清除session中的验证码
            CaptchaUtil.clear(request);
            return AjaxResult.error("验证码不正确");
        }
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
    @ResponseBody
    @RequestMapping("/captcha")
    public void captcha(HttpServletRequest request, HttpServletResponse response) throws Exception{

        // 使用gif验证码
        GifCaptcha gifCaptcha = new GifCaptcha(130,48,5);
        CaptchaUtil.out(gifCaptcha, request, response);
        // 中文类型
//        ChineseCaptcha captcha = new ChineseCaptcha(130, 48);
//        CaptchaUtil.out(captcha,request,response);

          // 中文gif类型
//        ChineseGifCaptcha captcha = new ChineseGifCaptcha(130, 48);
//        CaptchaUtil.out(captcha,request,response);
        // 算术类型
//        ArithmeticCaptcha captcha = new ArithmeticCaptcha(130, 48);
//        captcha.setLen(3);  // 几位数运算，默认是两位
//        captcha.getArithmeticString();  // 获取运算的公式：3+2=?
//        captcha.text();  // 获取运算的结果：5
//
//        CaptchaUtil.out(captcha,request, response);

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
