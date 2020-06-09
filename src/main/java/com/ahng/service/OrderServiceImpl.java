package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ahng.domain.Criteria;
import com.ahng.domain.OrderVO;
import com.ahng.domain.ProductAttachVO;
import com.ahng.domain.ProductOnOrderVO;
import com.ahng.domain.ProductVO;
import com.ahng.mapper.CartMapper;
import com.ahng.mapper.OrderMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper mapper;
	@Autowired
	private CartMapper cartMapper;
	
	@Transactional
	@Override
	public void register(OrderVO vo) {
//		log.warn("OrderVO : " + vo);
		mapper.insert(vo);
		if (vo.getPdtOnOrder() == null || vo.getPdtOnOrder().size() <= 0) {
			log.warn("Product on Order IS NULL");
			return;
		}

		vo.getPdtOnOrder().forEach(product -> {
			product.setOrderNumber(vo.getOrderNumber());
			log.warn("Product : " + product);
			mapper.pdtInsert(product);
			cartMapper.delete(vo.getUserId(), product.getPno());
		});
	}

	@Override
	public void pdtOfOrderRegister(ProductOnOrderVO vo) {
		mapper.pdtInsert(vo);
	}

	@Transactional
	@Override
	public boolean modify(OrderVO vo) {
//		attachMapper.deleteAll(vo.getPno());
//
//		boolean result = mapper.update(vo) == 1;
//		if (result && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
//			vo.getAttachList().forEach(attach -> {
//				attach.setPno(vo.getPno());
//				attachMapper.insert(attach);
//			});
//		}
//
//		return result;
		return false;
	}

	@Override
	public List<OrderVO> orderList(String userId) {
		return mapper.orderList(userId);
	}

	@Override
	public List<ProductOnOrderVO> getPdtOnOrder(String userId) {
		return mapper.getPdtOnOrder(userId);
	}

	@Override
	public List<ProductVO> orderPdtList(String orderNumber) {
		return mapper.orderItemList(orderNumber);
	}

	@Override
	public ProductVO get(Long pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean remove(String orderNumber) {
		mapper.deletePdtOnOrder(orderNumber);
		return mapper.delete(orderNumber) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductAttachVO> getAttachList(Long pno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductVO> getCartList(Long pno) {
		// TODO Auto-generated method stub
		return null;
	}

}
