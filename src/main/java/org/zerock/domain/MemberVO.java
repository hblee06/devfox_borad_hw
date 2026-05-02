package org.zerock.domain;

import lombok.Data;

@Data
public class MemberVO {

	private String username; // ID
	private String password; // パスワード
	private String name; // 名前
}