package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ahng.domain.Criteria;
import com.ahng.domain.ReplyPageDTO;
import com.ahng.domain.ReplyVO;
import com.ahng.mapper.FeedMapper;
import com.ahng.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private FeedMapper feedMapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		feedMapper.updateReplyCnt(vo.getFno(), 1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		ReplyVO vo = mapper.read(rno);
		feedMapper.updateReplyCnt(vo.getFno(), -1);
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long fno) {
		return mapper.getList(cri, fno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long fno) {
		return new ReplyPageDTO(mapper.getCountByFno(fno), mapper.getList(cri, fno));
	}

}
