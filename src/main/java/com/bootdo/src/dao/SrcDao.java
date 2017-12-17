package com.bootdo.src.dao;

import com.bootdo.src.domain.SrcDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * @author ljz
 * @email 1992lcg@163.com
 * @date 2017-12-16 22:48:07
 */
@Mapper
public interface SrcDao {

	SrcDO get(Long id);
	
	List<SrcDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(SrcDO src);
	
	int update(SrcDO src);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);

}
