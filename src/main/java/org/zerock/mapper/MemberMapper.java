package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public void insert(MemberVO member);
	
	public MemberVO read(String username);
	
	public int checkUsername(String username);
}