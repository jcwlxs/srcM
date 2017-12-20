package com.bootdo.system.service.impl;

import com.bootdo.common.domain.Tree;
import com.bootdo.common.utils.BuildTree;
import com.bootdo.src.domain.SrcDO;
import com.bootdo.src.service.SrcService;
import com.bootdo.system.dao.DeptDao;
import com.bootdo.system.domain.DeptDO;
import com.bootdo.system.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptDao sysDeptMapper;
    @Autowired
    private SrcService srcService;

    @Override
    public DeptDO get(Long deptId) {
        DeptDO deptDO = sysDeptMapper.get(deptId);
        SrcDO srcDO = srcService.get(deptDO.getSrcId());
        if (srcDO != null)
            deptDO.setSrcName(srcDO.getName());
        return deptDO;
    }

    @Override
    public List<DeptDO> list(Map<String, Object> map) {
        List<DeptDO> deptDOList = sysDeptMapper.list(map);
        deptDOList.forEach(deptDO -> {
            SrcDO srcDO = srcService.get(deptDO.getSrcId());
            if (srcDO != null)
                deptDO.setSrcName(srcDO.getName());
        });
        return deptDOList;
    }

    @Override
    public int count(Map<String, Object> map) {
        return sysDeptMapper.count(map);
    }

    @Override
    public int save(DeptDO sysDept) {
        return sysDeptMapper.save(sysDept);
    }

    @Override
    public int update(DeptDO sysDept) {
        //更新本级分类
        int update = sysDeptMapper.update(sysDept);
        //更新所有子分类srcId
        updateTree(sysDept);
        return update;
    }

    //递归更新
    private void updateTree(DeptDO root) {
        sysDeptMapper.updateSrcOnly(root);
        Map<String, Object> map = new HashMap<>();
        Long deptId = root.getDeptId();
        map.put("parentId", deptId);
        sysDeptMapper.list(map).forEach(this::updateTree);
    }

    @Override
    public int remove(Long deptId) {
        try {
            removeTree(deptId);
        } catch (Exception e) {
            return 0;
        }
        return 1;
    }

    private void removeTree(Long rootId) {
        sysDeptMapper.remove(rootId);
        Map<String, Object> map = new HashMap<>();
        map.put("parentId", rootId);
        sysDeptMapper.list(map).forEach(e -> removeTree(e.getDeptId()));
    }

    @Override
    public int batchRemove(Long[] deptIds) {
        return sysDeptMapper.batchRemove(deptIds);
    }

    @Override
    public Tree<DeptDO> getTree(Long srcId) {
        List<Tree<DeptDO>> trees = new ArrayList<>();
        Map<String, Object> map = new HashMap<>(16);
        map.put("srcId", srcId);
        List<DeptDO> sysDepts = sysDeptMapper.list(map);
        for (DeptDO sysDept : sysDepts) {
            Tree<DeptDO> tree = new Tree<>();
            tree.setId(sysDept.getDeptId().toString());
            tree.setParentId(sysDept.getParentId().toString());
            tree.setText(sysDept.getName());
            Map<String, Object> state = new HashMap<>(16);
            state.put("opened", true);
            tree.setState(state);
            trees.add(tree);
        }
        // 默认顶级菜单为０，根据数据库实际情况调整
        Tree<DeptDO> t = BuildTree.build(trees);
        SrcDO srcDO = srcService.get(srcId);
        if (srcDO != null)//设置根节点为公司名
            t.setText(srcDO.getName());
        return t;
    }

    @Override
    public boolean checkDeptHasUser(Long deptId) {
        // TODO Auto-generated method stub
        //查询部门以及此部门的下级部门
        int result = sysDeptMapper.getDeptUserNumber(deptId);
        return result == 0;
    }

}
