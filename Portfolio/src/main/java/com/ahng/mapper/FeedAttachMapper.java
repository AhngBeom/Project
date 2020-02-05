package com.ahng.mapper;

import java.util.List;

import com.ahng.domain.FeedAttachDTO;

public interface FeedAttachMapper {

	public void insert(FeedAttachDTO vo);
	
	public void delete(String uuid);
	
	public List<FeedAttachDTO> findByFno(Long fno);
	
	public void deleteAll(Long fno);
	
	public List<FeedAttachDTO> getOldFiles();
	
}
