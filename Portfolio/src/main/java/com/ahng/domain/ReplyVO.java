package com.ahng.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {

	private Long rno;
	private Long fno;
	
	private String reply;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
}
