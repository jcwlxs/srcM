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
    @Autowired
    private DeptService sysDeptService;
    @Autowired
    private SrcService srcService;

    @GetMapping()
    public String dept() {
        return "system/dept/dept";
    }

    @GetMapping("deptSrc")
    public String deptSrc(Model model) {
        model.addAttribute("srcList", srcService.list(null));
        return "system/dept/deptSrc";
    }

    @ResponseBody
    @GetMapping("/list")
    public List<DeptDO> list(@RequestParam Map query) {
    	System.out.println(query);
        List<DeptDO> sysDeptList = sysDeptService.list(query);
        System.out.println(sysDeptList.toString());
        return sysDeptList;
    }


    @GetMapping("/add/{pId}")
    @RequiresPermissions("system:sysDept:add")
    public String add(@PathVariable("pId") Long pId, Model model) {
        model.addAttribute("pId", pId);
        if (pId == 0) {
            model.addAttribute("pName", "根目录");
        } else {
            model.addAttribute("pName", sysDeptService.get(pId).getName());
            model.addAttribute("dept", sysDeptService.get(pId));
        }
        return "system/dept/add";
    }

    @GetMapping("/edit/{deptId}")
    @RequiresPermissions("system:sysDept:edit")
    public String edit(@PathVariable("deptId") Long deptId, Model model) {
        DeptDO sysDept = sysDeptService.get(deptId);
        model.addAttribute("sysDept", sysDept);
        if (Constant.DEPT_ROOT_ID.equals(sysDept.getParentId())) {
            model.addAttribute("parentDeptName", "根目录");
        } else {
            DeptDO parDept = sysDeptService.get(sysDept.getParentId());
            model.addAttribute("parentDeptName", parDept.getName());
        }
        return "system/dept/edit";
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
        if (sysDeptService.remove(deptId) > 0) {
            return R.ok();
        }
        return R.error();
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
        return "system/dept/deptTree";
    }

}
