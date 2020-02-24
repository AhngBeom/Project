package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;
import com.ahng.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;

	@Override
	public List<ProductVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public void register(ProductVO vo) {
		mapper.insert(vo);
//		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
//			return;
//		}
//		vo.getAttachList().forEach(attach -> {
//			attach.setFno(vo.getFno());
//			attachMapper.insert(attach);
//		});
	}

	@Override
	public ProductVO get(Long pno) {
		return mapper.read(pno);
	}

	@Override
	public boolean modify(ProductVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long pno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

}
