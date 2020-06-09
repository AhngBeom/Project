package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ahng.domain.Criteria;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductVO;
import com.ahng.mapper.ProductAttachMapper;
import com.ahng.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;
	@Autowired
	private ProductAttachMapper attachMapper;

	@Override
	public List<ProductVO> getPdtList(Criteria cri) {
		return mapper.getPdtList(cri);
	}

	@Override
	public List<ProductVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Transactional
	@Override
	public void register(ProductVO vo) {
		mapper.insert(vo);
		log.info(vo.getPno());
		if (vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		vo.getAttachList().forEach(attach -> {
			attach.setPno(vo.getPno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public ProductVO get(Long pno) {
		return mapper.read(pno);
	}

	@Transactional
	@Override
	public boolean modify(ProductVO vo) {
		attachMapper.deleteAll(vo.getPno());

		boolean result = mapper.update(vo) == 1;
		if (result && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
				attach.setPno(vo.getPno());
				attachMapper.insert(attach);
			});
		}

		return result;
	}

	@Override
	public boolean remove(Long pno) {
		attachMapper.deleteAll(pno);
		return mapper.delete(pno) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ProductAttachVO> getAttachList(Long pno) {
		return attachMapper.findByPno(pno);
	}

	@Override
	public List<ProductVO> getCartList(Long pno) {
		// TODO Auto-generated method stub
		return null;
	}

}
