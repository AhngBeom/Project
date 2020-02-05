package com.ahng.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FeedVO {

	private Long fno;
	private String userID;
	private String message;
	private Date regDate;
	private Date updateDate;
	
	private int replyCnt;
	
	private String link;
	private boolean image = false;
	
	private List<FeedAttachDTO> attachList;
}
