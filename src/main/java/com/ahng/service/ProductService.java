package com.ahng.service;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductVO;

public interface ProductService {

	public List<ProductVO> getPdtList(Criteria cri);

	public List<ProductVO> getListWithPaging(Criteria cri/*, String ctg*/);

	public void register(ProductVO vo);

	public ProductVO get(Long pno);

	public boolean modify(ProductVO vo);

	public boolean remove(Long pno);

	public int getTotal(Criteria cri/*, String ctg*/);

	public List<ProductAttachVO> getAttachList(Long pno);

	public List<ProductVO> getCartList(Long pno);

}
