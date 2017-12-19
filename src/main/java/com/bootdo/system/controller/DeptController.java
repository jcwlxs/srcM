package com.bootdo.system.controller;

import com.bootdo.common.config.Constant;
import com.bootdo.common.controller.BaseController;
import com.bootdo.common.domain.Tree;
import com.bootdo.common.utils.R;
import com.bootdo.src.service.SrcService;
import com.bootdo.system.domain.DeptDO;
import com.bootdo.system.service.DeptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 部门管理
 *
 * @author chglee
 * @email 1992lcg@163.com
 * @date 2017-09-27 14:40:36
 */

@Controller
@RequestMapping("/system/sysDept")
public class DeptController extends BaseController {
    private String prefix = "system/dept";
    @Autowired
    private DeptService sysDeptService;
    @Autowired
    private SrcService srcService;

    @GetMapping()
    public String dept() {
        return prefix + "/dept";
    }

    @GetMapping("deptSrc")
    public String deptSrc(Model model) {
        model.addAttribute("srcList",srcService.list(null));
        return "system/dept/deptSrc";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("system:sysDept:sysDept")
    public List<DeptDO> list(@RequestParam Map query) {
        List<DeptDO> sysDeptList = sysDeptService.list(query);
        return sysDeptList;
    }

    @GetMapping("/add/{pId}")
    @RequiresPermissions("system:sysDept:add")
    String add(@PathVariable("pId") Long pId, Model model) {
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "根目录");
        } else {
            model.addAttribute("dept",sysDeptService.get(pId));
        }
        return prefix + "/add";
    }

    @GetMapping("/edit/{deptId}")
    @RequiresPermissions("system:sysDept:edit")
    String edit(@PathVariable("deptId") Long deptId, Model model) {
        DeptDO sysDept = sysDeptService.get(deptId);
        model.addAttribute("sysDept", sysDept);
        if (Constant.DEPT_ROOT_ID.equals(sysDept.getParentId())) {
            model.addAttribute("parentDeptName", "根目录");
        } else {
            DeptDO parDept = sysDeptService.get(sysDept.getParentId());
            model.addAttribute("parentDeptName", parDept.getName());
        }
        return prefix + "/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("system:sysDept:add")
    public R save(DeptDO sysDept) {
        if (sysDeptService.save(sysDept) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("system:sysDept:edit")
    public R update(DeptDO sysDept) {
        if (sysDeptService.update(sysDept) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("system:sysDept:remove")
    public R remove(Long deptId) {
        Map<String, Object> map = new HashMap<>();
        map.put("parentId", deptId);
        if (sysDeptService.count(map) > 0) {//有下级部门，删除所有下级
            DeptDO d1 = sysDeptService.get(deptId);
            if (d1 != null) {
//                delTree(deptId);
//                return R.ok();
                // todo 递归删除
            }
            return R.error(1, "包含下级部门,不允许修改");
        } else {//没有下级部门，直接删除
            sysDeptService.remove(deptId);
            return R.ok();
        }
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("system:sysDept:batchRemove")
    public R remove(@RequestParam("ids[]") Long[] deptIds) {
        sysDeptService.batchRemove(deptIds);
        return R.ok();
    }

    @GetMapping("/tree")
    @ResponseBody
    public Tree<DeptDO> tree() {
        Tree<DeptDO> tree;
        tree = sysDeptService.getTree(null);
        return tree;
    }

    @GetMapping("/treeView")
    public String treeView() {
        return prefix + "/deptTree";
    }

}
