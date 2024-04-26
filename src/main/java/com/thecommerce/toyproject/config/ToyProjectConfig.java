package com.thecommerce.toyproject.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class ToyProjectConfig {

	@Bean
	public PasswordEncoder getPasswordEncord() {
		return new BCryptPasswordEncoder();
	}	
	
}
