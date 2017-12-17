package com.bootdo.src.service;

import com.bootdo.common.domain.Tree;
import com.bootdo.src.domain.SrcDO;
import com.bootdo.system.domain.DeptDO;

import java.util.List;
import java.util.Map;

/**
 * 
 * 
 * @author ljz
 * @email 1992lcg@163.com
 * @date 2017-12-16 22:48:07
 */
public interface SrcService {
	
	SrcDO get(Long id);
	
	List<SrcDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(SrcDO src);
	
	int update(SrcDO src);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

    Tree<DeptDO> getTree(Long srcId);
}
