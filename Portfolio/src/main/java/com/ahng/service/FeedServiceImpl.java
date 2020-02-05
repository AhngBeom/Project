package com.ahng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ahng.domain.Criteria;
import com.ahng.domain.FeedAttachDTO;
import com.ahng.domain.FeedVO;
import com.ahng.mapper.FeedAttachMapper;
import com.ahng.mapper.FeedMapper;
import com.ahng.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FeedServiceImpl implements FeedService{
	
	@Setter(onMethod_ = @Autowired)
	private FeedMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private FeedAttachMapper attachMapper;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper replyMapper;

	@Override
	public List<FeedVO> getList(Criteria cri) {
		return mapper.getList(cri);
	}

	@Transactional
	@Override
	public void register(FeedVO vo) {
		mapper.insert(vo);
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		} else {
			vo.setImage(true);
		}
		vo.getAttachList().forEach(attach -> {
			attach.setFno(vo.getFno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public FeedVO get(Long ino) {
		return mapper.read(ino);
	}

	@Transactional
	@Override
	public boolean modify(FeedVO vo) {
		attachMapper.deleteAll(vo.getFno());
		boolean modifyResult = mapper.update(vo) == 1;
		if(modifyResult && vo.getAttachList() != null && vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
				attach.setFno(vo.getFno());
				attachMapper.insert(attach);
			});
		}
		return modifyResult;
	}

	@Transactional
	@Override
	public boolean remove(Long fno) {
		attachMapper.deleteAll(fno);
		replyMapper.deleteAll(fno);
		return mapper.delete(fno) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<FeedAttachDTO> getAttachList(Long fno) {
		return attachMapper.findByFno(fno);
	}
	
}
