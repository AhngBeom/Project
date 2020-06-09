package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahng.domain.CartVO;
import com.ahng.domain.Criteria;
import com.ahng.domain.ProductVO;
import com.ahng.mapper.CartMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper mapper;

	@Override
	public List<ProductVO> getList(String userID) {
		return mapper.itemList(userID);
	}

	@Override
	public int register(CartVO vo) {
		return mapper.insert(vo);
//		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
//			return;
//		}
//		vo.getAttachList().forEach(attach -> {
//			attach.setFno(vo.getFno());
//			attachMapper.insert(attach);
//		});
	}

	@Override
	public List<CartVO> get(String userID) {
		return mapper.read(userID);
	}

	@Override
	public boolean modify(CartVO vo) {
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(String userID, Long pno) {
		return mapper.delete(userID, pno) == 1;
	}

	@Override
	public boolean Allremove() {
		return mapper.allDelete() == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<CartVO> getCartList(Long pno) {
		// TODO Auto-generated method stub
		return null;
	}

}
