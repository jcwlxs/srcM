package com.bootdo.src.service.impl;

import com.bootdo.common.domain.Tree;
import com.bootdo.system.domain.DeptDO;
import com.bootdo.system.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.bootdo.src.dao.SrcDao;
import com.bootdo.src.domain.SrcDO;
import com.bootdo.src.service.SrcService;

import javax.annotation.Resource;


@Service
public class SrcServiceImpl implements SrcService {
    @Autowired
    private SrcDao srcDao;

    @Override
    public SrcDO get(Long id) {
        return srcDao.get(id);
    }

    @Override
    public List<SrcDO> list(Map<String, Object> map) {
        return srcDao.list(map);
    }

    @Override
    public int count(Map<String, Object> map) {
        return srcDao.count(map);
    }

    @Override
    public int save(SrcDO src) {
        src.setGmtCreate(new Date());
        src.setGmtModified(new Date());
        return srcDao.save(src);
    }

    @Override
    public int update(SrcDO src) {
        src.setGmtModified(new Date());
        return srcDao.update(src);
    }

    @Override
    public int remove(Long id) {
        return srcDao.remove(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        return srcDao.batchRemove(ids);
    }

    @Resource
    private DeptService deptService;
    @Override
    public Tree<DeptDO> getTree(Long srcId) {
        return deptService.getTree(srcId);
    }

}
