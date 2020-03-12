 package com.ahng.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductVO;

public interface ProductAttachMapper {
	
	public void insert(ProductAttachVO dto);
	
	public void delete(String uuid);
	
	public void deleteAll(Long pno);
	
	public List<ProductAttachVO> findByPno(Long pno);
	
}
