package com.ahng.mapper;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.InquireVO;

public interface InquireMapper {

	public List<InquireVO> getList(Criteria cri);
	
	public void insert(InquireVO vo);
	
	public InquireVO read(Long ino);
	
	public int update(InquireVO vo);
	
	public int delete(Long ino);
	
	public int getTotalCount(Criteria cri);

}
