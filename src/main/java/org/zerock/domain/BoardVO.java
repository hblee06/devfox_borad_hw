package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno; //번호
	private String title; //글 제목
	private String content; //글 내용
	private String writer; //작성자
	private Date regdate; //작성일
	private Date updateDate; //수정일

}
