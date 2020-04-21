package com.ahng.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class DiaryVO {

	private Long dno;
	private String title;
	private String content;
	private Date regDate;
	private Date upToDate;
	
//	private List<ProductAttachVO> attachList;

}
