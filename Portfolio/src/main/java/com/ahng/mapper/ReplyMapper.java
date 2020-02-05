package com.ahng.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ahng.domain.Criteria;
import com.ahng.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(Long rno);
	
	public int delete(Long rno);
	
	public int deleteAll(Long fno);
	
	public int update(ReplyVO vo);
	
	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("fno") Long fno);
	
	public int getCountByFno(Long fno);
	
}
