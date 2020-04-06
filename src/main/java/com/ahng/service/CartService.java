package com.ahng.service;

import java.util.List;

import com.ahng.domain.CartVO;
import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;

public interface CartService {

	public List<ProductVO> getList(String userID);

	public int register(CartVO vo);

	public List<CartVO> get(String userID);

	public boolean modify(CartVO vo);

	public boolean remove(String userID, Long pno);

	public int getTotal(Criteria cri);

	// public List<CartAttachDTO> getAttachList(Long pno);

	public List<CartVO> getCartList(Long pno);

}
