package org.zerock.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.zerock.security.CustomUserDetailsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Configuration
@EnableWebSecurity
@Log4j
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private CustomUserDetailsService customUserDetailsService;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		log.info("security config...");

		http.authorizeRequests()
				.antMatchers("/customLogin").permitAll()
				.antMatchers("/member/join").permitAll()
				.antMatchers("/board/list").permitAll()
				.antMatchers("/board/get").permitAll()
				.antMatchers("/board/register").hasRole("MEMBER")
				.antMatchers("/board/modify").hasRole("MEMBER")
				.antMatchers("/board/remove").hasRole("MEMBER")
				.anyRequest().permitAll();

		http.formLogin()
				.loginPage("/customLogin")
				.loginProcessingUrl("/login")
				.defaultSuccessUrl("/board/list", true)
				.failureUrl("/customLogin?error")
				.permitAll();

		http.logout()
				.logoutUrl("/customLogout")
				.logoutSuccessUrl("/customLogin?logout")
				.invalidateHttpSession(true);
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService);
	}
}