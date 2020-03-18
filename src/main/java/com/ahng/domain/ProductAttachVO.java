package com.ahng.domain;

import lombok.Data;

@Data
public class ProductAttachVO {

	private String uploadPath;
	private String uuid;
	private String fileName;
	private boolean fileType;
	private int sequence;
	
	private Long pno;
}
