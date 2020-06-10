package cn.lhx.service.impl;

import cn.lhx.service.UserService;
import org.springframework.stereotype.Service;

/**
 * @author lee549
 * @date 2020/3/19 20:24
 */
@Service
public class UserServiceImpl implements UserService {


    @Override
    public void delete(Integer id) {
        //前置功能
        System.out.println("核心功能:delete");
    }
}
