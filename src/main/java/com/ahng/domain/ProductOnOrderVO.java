package com.ahng.domain;

import java.util.List;

import lombok.Data;

@Data
public class ProductOnOrderVO {
	
	private String orderNumber;
	private Long pno;
	private int amount;

	private String pdtName;
	private String pdtPrice;
	private String pdtTitle;
}
