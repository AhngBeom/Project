package com.ahng.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InquireVO {

	private Long ino;
	private String title;
	private String writer;
	private String content;
	private Date regDate;
	private Date updateDate;
}
