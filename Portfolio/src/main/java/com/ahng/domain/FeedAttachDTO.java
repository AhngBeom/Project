package com.ahng.domain;

import lombok.Data;

@Data
public class FeedAttachDTO {

	private String uploadPath;
	private String uuid;
	private String fileName;
	private boolean fileType;
	
	private Long fno;
}
