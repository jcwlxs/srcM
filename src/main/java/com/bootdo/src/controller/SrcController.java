package com.bootdo.src.controller;

import com.bootdo.common.domain.Tree;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.src.domain.SrcDO;
import com.bootdo.src.service.SrcService;
import com.bootdo.system.domain.DeptDO;
import com.bootdo.system.service.DeptService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author ljz
 * @email 1992lcg@163.com
 * @date 2017-12-16 22:48:07
 */

@Controller
@RequestMapping("/src")
public class SrcController {
    @Autowired
    private SrcService srcService;


    @GetMapping("index")
    public String index() {
        return "index";
    }

    @GetMapping("view/{id}")
    public String view(@PathVariable("id") Long id,Model model) {
        model.addAttribute("srcObj",srcService.get(id));
        return "view";
    }

    @GetMapping()
    @RequiresPermissions("src")
    public String Src() {
        return "src/src";
    }

    @ResponseBody
    @GetMapping("/list")
    public PageUtils list(@RequestParam Map<String, Object> params) {
        //查询列表数据
        Query query = new Query(params);
        List<SrcDO> srcList = srcService.list(query);
        int total = srcService.count(query);
        PageUtils pageUtils = new PageUtils(srcList, total);
        return pageUtils;
    }

    @GetMapping("/add")
    @RequiresPermissions("src:add")
    public String add() {
        return "src/add";
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("src:edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        SrcDO src = srcService.get(id);
        model.addAttribute("src", src);
        return "src/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("src:add")
    public R save(SrcDO src) {
        if (srcService.save(src) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("src:edit")
    public R update(SrcDO src) {
        srcService.update(src);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping("/remove")
    @ResponseBody
    @RequiresPermissions("src:remove")
    public R remove(Long id) {
        if (srcService.remove(id) > 0) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("src:batchRemove")
    public R remove(@RequestParam("ids[]") Long[] ids) {
        srcService.batchRemove(ids);
        return R.ok();
    }

    @Resource
    private DeptService deptService;
    @GetMapping("/tree")
    @ResponseBody
    public Tree<DeptDO> tree(@RequestParam(required = false) Long srcId) {
        return deptService.getTree(srcId);
    }

    @GetMapping("/treeView")
    public String treeView() {
        return "/treeView";
    }
}
