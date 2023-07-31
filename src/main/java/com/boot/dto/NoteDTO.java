package com.boot.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class NoteDTO {
	private int noteno;
	private String name;
	private String pass;
	private String title;
	private String content;
	private Date notetime;
	private String imgName;
}


