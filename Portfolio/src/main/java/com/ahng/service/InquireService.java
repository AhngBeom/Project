package com.ahng.service;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.InquireVO;

public interface InquireService {

	public List<InquireVO> getList(Criteria cri);
	
	public void register(InquireVO vo);
	
	public InquireVO get(Long ino);
	
	public boolean modify(InquireVO vo);
	
	public boolean remove(Long ino);
	
	public int getTotal(Criteria cri);
}
