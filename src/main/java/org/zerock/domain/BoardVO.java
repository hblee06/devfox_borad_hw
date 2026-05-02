package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private Long bno; // 番号
	private String title; // タイトル
	private String content; // 内容
	private String writer; // 作成者
	private Date regdate; // 作成日
	private Date updateDate; // 修正日

}
