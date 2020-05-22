package com.ahng.domain;

import java.sql.Timestamp;
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
	private Timestamp upToDate;
	
//	private int amount;
	private List<CartVO> cartVO;
	private List<ProductAttachVO> attachList;

}
