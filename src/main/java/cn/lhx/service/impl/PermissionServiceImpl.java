package cn.lhx.service.impl;

import cn.lhx.dao.PermissionDao;
import cn.lhx.entity.Permission;
import cn.lhx.service.PermissionService;
import cn.lhx.utils.page.QueryObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PermissionServiceImpl implements PermissionService {

    @Resource
    PermissionDao permissionDao;

    @Override
    public List<Permission> listAll() {
        return permissionDao.listAll();
    }

    @Override
    public PageInfo<Permission> query(QueryObject qo) {
        PageHelper.startPage(qo.getCurrentPage(), qo.getPagesize());
        List<Permission> pms = permissionDao.listAll();
        PageInfo<Permission> pageInfo = new PageInfo<>(pms);
        return pageInfo;
    }
}
