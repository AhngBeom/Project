package com.ahng.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ahng.domain.Criteria;
import com.ahng.domain.FeedVO;

public interface FeedMapper {

	public List<FeedVO> getList(Criteria cri);

	public void insert(FeedVO vo);

	public FeedVO read(Long fno);

	public int update(FeedVO vo);

	public int delete(Long fno);

	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("fno") Long fno, @Param("amount") int amount);

}
