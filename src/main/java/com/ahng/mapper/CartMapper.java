package com.ahng.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ahng.domain.CartVO;
import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;

public interface CartMapper {

	public List<ProductVO> itemList(String userID);

	public int insert(CartVO vo);

	public CartVO read(String userID);

	public int update(CartVO vo);

	public int delete(@Param("userID") String userID, @Param("pno") Long pno);

	public int getTotalCount(Criteria cri);

//	public void updateReplyCnt(@Param("pno") Long pno, @Param("amount") int amount);
}
