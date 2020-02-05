package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ahng.domain.Criteria;
import com.ahng.domain.InquireVO;
import com.ahng.mapper.InquireMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class InquireServiceImpl implements InquireService{

	@Setter(onMethod_ = @Autowired)
	private InquireMapper mapper;
	
	@Override
	public List<InquireVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public void register(InquireVO vo) {
		log.info("Register : " + vo);
		mapper.insert(vo);
	}

	@Override
	public InquireVO get(Long ino) {
		return mapper.read(ino);
	}

	@Override
	public boolean modify(InquireVO vo) {
		return mapper.update(vo) == 1;
	}

	@Override
	public boolean remove(Long ino) {
		return mapper.delete(ino) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
}
