package com.ahng.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {

	private String orderNumber;
	private String userId;
	private String orderer;
	private String ordererContact;
	private String receiver;
	private String receiverAddress;
	private Date orderDate;

	private int amount;
	
	private List<ProductOnOrderVO> pdtOnOrder;
}
