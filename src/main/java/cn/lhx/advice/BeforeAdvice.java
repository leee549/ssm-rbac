package cn.lhx.advice;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.aop.aspectj.AspectJMethodBeforeAdvice;

import java.lang.reflect.Method;

/**
 * @author lee549
 * @date 2020/3/19 20:13
 */
public class BeforeAdvice implements MethodBeforeAdvice {
    @Override
    public void before(Method method, Object[] objects, Object o) throws Throwable {
        System.out.println("Before ~~method:"+method.getName());
    }
}
