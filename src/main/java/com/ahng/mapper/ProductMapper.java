package com.ahng.mapper;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> getPdtList(Criteria cri);
	
	public List<ProductVO> getListWithPaging(/*@Param("cri") */Criteria cri/*, @Param("ctg") String category*/);

	public void insert(ProductVO vo);

	public ProductVO read(Long pno);

	public int update(ProductVO vo);

	public int delete(Long pno);

	public int getTotalCount(/*@Param("cri") */Criteria cri/*, @Param("ctg") String category*/);

//	public void updateReplyCnt(@Param("pno") Long pno, @Param("amount") int amount);
}
