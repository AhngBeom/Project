package com.ahng.service;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.DiaryVO;
import com.ahng.domain.OrderVO;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductOnOrderVO;
import com.ahng.domain.ProductVO;

public interface OrderService {

	public List<OrderVO> orderList(String userId); // 유저의 전체 주문 목록

	public List<ProductVO> orderItemList(String orderNumber); // 유저가 선택한 주문의 상품 목록

	public ProductVO get(Long pno);

	public void register(OrderVO vo);
	public void pdtOfOrderRegister(ProductOnOrderVO vo);

	public boolean modify(OrderVO vo);

	public boolean remove(Long pno);

	public int getTotal(Criteria cri);

	public List<ProductAttachVO> getAttachList(Long pno);

	public List<ProductVO> getCartList(Long pno);

}
