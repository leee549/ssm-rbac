package cn.lhx.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author lee549
 * @date 2020/3/20 19:34
 */
@Component
@Aspect
public class LogAspect {
    //定义切入点
    @Pointcut("execution(* cn.lhx..UserServiceImpl.*(..))")
    public void log(){}

    @Before("log()")
    public void mylog(JoinPoint jp){
        String methodName = jp.getSignature().getName();
        System.out.println(methodName+"被访问"+new Date());
    }
}
