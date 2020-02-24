package com.ahng.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {

	private Long pno;
	private String name;
	private int price;
	private Date regDate;
	private Date upToDate;

}
