package com.thecommerce.toyproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	@GetMapping({"/","/home"})
	public String home() {
		return "home";
	}
}
