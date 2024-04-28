package com.thecommerce.toyproject.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.thecommerce.toyproject.domain.PageRequestDTO;
import com.thecommerce.toyproject.domain.PageResultDTO;
import com.thecommerce.toyproject.entity.User;
import com.thecommerce.toyproject.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
	
	private final UserRepository repository;
	PasswordEncoder passwordEncoder;

	@Override
	public PageResultDTO<User> selectList(PageRequestDTO requestDTO, String sort) {
	    Pageable pageable;
	    if ("userName".equals(sort)) {
	    	pageable = requestDTO.getPageable(Sort.by(sort).ascending());
	    } else {
	    	pageable = requestDTO.getPageable(Sort.by(sort).descending());
	    }
	    Page<User> result = repository.findAll(pageable);
	    return new PageResultDTO<>(result);
	}

	
	@Override
	public User selectDetail(String id) {
		Optional<User> user = repository.findById(id);
		
		if(user.isPresent()) {
			return user.get();
		}else {
			return null;
		}
	};
	
	@Override
	public User save(User entity) {
		
		if(selectDetail(entity.getUserId()) != null) {
			entity.setModifyDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));			
		} else {
			entity.setCreateDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
			entity.setUserPw(passwordEncoder.encode(entity.getUserPw()));
		}
		return repository.save(entity);
	};
	
	@Override
	public String login(User entity) {
		String pw = entity.getUserPw();
		entity = selectDetail(entity.getUserId());
		
		if(pw != null && entity != null) {
			if(passwordEncoder.matches(pw, entity.getUserPw())) {
				return entity.getUserId();
			}
		}
		
		return null;
	};
	
	
}
