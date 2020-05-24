package com.ahng.domain;

import java.util.List;

import lombok.Data;

@Data
public class TestVO {
	
	private String name;
	private List<ProductOnOrderVO> pdtList;
}
