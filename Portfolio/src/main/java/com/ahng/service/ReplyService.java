package com.ahng.service;

import java.util.List;

import com.ahng.domain.Criteria;
import com.ahng.domain.ReplyPageDTO;
import com.ahng.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public int remove(Long rno);

	public int modify(ReplyVO vo);

	public List<ReplyVO> getList(Criteria cri, Long fno);
	
	public ReplyPageDTO getListPage(Criteria cri, Long fno);
	
}
