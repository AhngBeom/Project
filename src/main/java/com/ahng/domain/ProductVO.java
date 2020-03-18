package com.ahng.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductVO {

	private Long pno;
	private String name;
	private int price;
	private String category;
	private String title;
	private String descript;
	private Date regDate;
	private Date upToDate;
	
	private List<CartVO> cartVO;
	
	private List<ProductAttachVO> attachList;

}
