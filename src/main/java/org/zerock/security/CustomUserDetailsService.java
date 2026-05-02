package org.zerock.security;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		log.warn("Load User By Username : " + username);

		MemberVO member = memberMapper.read(username);

		if (member == null) {
			throw new UsernameNotFoundException(username);
		}

		return User.builder()
				.username(member.getUsername())
				.password(member.getPassword())
				.roles("MEMBER")
				.build();
	}
}