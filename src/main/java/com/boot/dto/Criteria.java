package com.boot.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class Criteria {
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 5);
		
	}
}
