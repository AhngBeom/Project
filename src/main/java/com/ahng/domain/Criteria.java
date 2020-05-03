package com.ahng.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String category;
	private String column;
	private String sort;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this("", "pno", "DESC", 0, 12);
	}
	
	public Criteria(String category, String column, String sort, int pageNum, int amount) {
		this.category = category;
		this.column = column;
		this.sort = sort;
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.getPageNum())
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
	
}
