package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
public class CommonController {

	private MemberMapper memberMapper;

	@GetMapping("/customLogin")
	public void customLogin() {
	}

	@GetMapping("/member/join")
	public void join() {
	}

	@PostMapping("/member/join")
	public String join(MemberVO member, RedirectAttributes rttr) {

		if (memberMapper.checkUsername(member.getUsername()) > 0) {
			rttr.addFlashAttribute("error", "既に使用いているIDです。");
			return "redirect:/member/join";
		}

		member.setPassword("{noop}" + member.getPassword());

		memberMapper.insert(member);

		return "redirect:/customLogin";
	}
}