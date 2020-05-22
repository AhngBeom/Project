package com.ahng.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ahng.domain.Criteria;
import com.ahng.domain.OrderVO;
import com.ahng.domain.ProductVO;

public interface OrderMapper {

	public List<OrderVO> orderList(String userId); // 유저의 전체 주문 목록

	public List<ProductVO> orderItemList(String orderNumber); // 유저가 선택한 주문의 상품 목록

	public int insert(OrderVO vo); // 주문 추가
	public int pdtInsert(String orderNumber); // 주문 추가

	public OrderVO read(String orderNumber);
	
	public int update(OrderVO vo); // 주문 수정

	public int delete(@Param("userID") String userID, @Param("userPW") String userPW);

	public int allDelete();

	public int getTotalCount(Criteria cri);

}
