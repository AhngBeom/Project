package com.ahng.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> getList(Criteria cri);

	public List<ProductVO> categoryList(String category);

	public void insert(ProductVO vo);

	public ProductVO read(Long pno);

	public int update(ProductVO vo);

	public int delete(Long pno);

	public int getTotalCount(Criteria cri);

	public void updateReplyCnt(@Param("pno") Long pno, @Param("amount") int amount);
}
