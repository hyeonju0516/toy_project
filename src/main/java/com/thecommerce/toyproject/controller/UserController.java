package com.thecommerce.toyproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.thecommerce.toyproject.domain.PageRequestDTO;
import com.thecommerce.toyproject.domain.PageResultDTO;
import com.thecommerce.toyproject.entity.User;
import com.thecommerce.toyproject.service.UserService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RequestMapping(value="/api/user")
@Controller
public class UserController {

	private UserService service;
	
	@GetMapping("/list")
	public String selectList(@RequestParam(value="page", defaultValue="1") int page,
							 @RequestParam(value="pageSize", defaultValue="10") int pageSize,
							 @RequestParam(value="sort", defaultValue="createDate") String sort,
							 Model model) {
		PageRequestDTO requestDTO = PageRequestDTO.builder()
				.page(2).size(pageSize).build();
		
		PageResultDTO<User> resultDTO = service.selectList(requestDTO, sort);
		
		model.addAttribute("userList", resultDTO.getEntityList());
	    model.addAttribute("resultDTO", resultDTO);
	    model.addAttribute("sort", sort);
	    model.addAttribute("pageSize", pageSize);
		
		return "/user/userList";
	}
}
