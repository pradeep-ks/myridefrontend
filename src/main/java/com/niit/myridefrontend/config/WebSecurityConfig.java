package com.niit.myridefrontend.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	
	@Autowired
	protected void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
			.usersByUsernameQuery("select username, password, enabled from user where username=?")
			.authoritiesByUsernameQuery("select username, role from user where username=?");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/cart**").access("hasAnyRole('ADMIN', 'USER')")
			.antMatchers("/addToCart/**").access("hasAnyRole(('ADMIN', 'USER')")
			.antMatchers("/productAdmin**").access("hasRole('ADMIN')")
			.and().formLogin().loginPage("/login")
			.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
			.and().csrf().disable();
	}
	
}
