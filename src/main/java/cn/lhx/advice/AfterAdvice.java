package cn.lhx.advice;

import org.springframework.aop.AfterReturningAdvice;

import java.lang.reflect.Method;

/**
 * @author lee549
 * @date 2020/3/19 20:13
 */
public class AfterAdvice implements AfterReturningAdvice {
    /**
     * 在核心功能返回之后执行
     * @param o 核心功能的返回值（查询结果）
     * @param method 当前方法对象
     * @param objects 方法的形参
     * @param o1 目标
     * @throws Throwable
     */
    @Override
    public void afterReturning(Object o, Method method, Object[] objects, Object o1) throws Throwable {
        System.out.println("After ~~ret："+o+"method:"+method.getName());
    }
}
