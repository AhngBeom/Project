package com.ahng.service;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.FeedAttachDTO;
import com.ahng.domain.FeedVO;

public interface FeedService {

	public List<FeedVO> getList(Criteria cri);

	public void register(FeedVO vo);

	public FeedVO get(Long ino);

	public boolean modify(FeedVO vo);

	public boolean remove(Long ino);

	public int getTotal(Criteria cri);
	
	public List<FeedAttachDTO> getAttachList(Long fno);
	
}
