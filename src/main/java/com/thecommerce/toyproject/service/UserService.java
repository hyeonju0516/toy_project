package com.thecommerce.toyproject.service;

import com.thecommerce.toyproject.domain.PageRequestDTO;
import com.thecommerce.toyproject.domain.PageResultDTO;
import com.thecommerce.toyproject.entity.User;

public interface UserService {
	
	PageResultDTO<User> selectList(PageRequestDTO requestDTO, String sort);
	User selectDetail(String id);
	User save(User entity);
	String login(User entity);
	
}
