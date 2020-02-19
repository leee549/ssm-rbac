package cn.lhx.exception;

import cn.hutool.core.exceptions.ExceptionUtil;
import cn.lhx.base.AjaxResult;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.UnauthenticatedException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author lee549
 * @date 2020/2/14 14:05
 */
@Slf4j
public class GlobalExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        ModelAndView mv = new ModelAndView();
        log.info("test:" + ExceptionUtil.stacktraceToOneLineString(ex));
        if (ex instanceof UnauthorizedException) {
            //角色 权限不足
            //跳转权限不足的页面
            mv.setViewName("redirect:/error");
        } else if (ex instanceof UnauthenticatedException) {
            //没登陆 没合法身份
            mv.setViewName("redirect:/login");

        }
        return mv;
    }
}
