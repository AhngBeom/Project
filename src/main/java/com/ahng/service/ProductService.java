package com.ahng.service;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductVO;

public interface ProductService {

	public List<ProductVO> getList(Criteria cri);

	public void register(ProductVO vo);

	public ProductVO get(Long pno);

	public boolean modify(ProductVO vo);

	public boolean remove(Long pno);

	public int getTotal(Criteria cri);

	public List<ProductAttachVO> getAttachList(Long pno);
	
	public List<ProductVO> getCartList(Long pno);

}
