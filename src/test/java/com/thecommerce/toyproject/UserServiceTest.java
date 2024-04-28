package com.thecommerce.toyproject;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.thecommerce.toyproject.domain.PageRequestDTO;
import com.thecommerce.toyproject.domain.PageResultDTO;
import com.thecommerce.toyproject.entity.User;
import com.thecommerce.toyproject.repository.UserRepository;
import com.thecommerce.toyproject.service.UserService;


@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
class UserServiceTest {
	
	@Autowired
	private UserService userService;
	@Autowired
	private UserRepository userRepository;

	// List테스트
	@Test
    public void testSelectList() {
		//given
		PageRequestDTO requestDTO = PageRequestDTO.builder()
				.page(1).size(5).build();
		String sort = "createDate";
		//when
		PageResultDTO<User> resultDTO =userService.selectList(requestDTO, sort);
		//then
		assertNotNull(resultDTO);
    }
	
	// Detail테스트 - id가 있는 경우
	@Test
    public void testSelectDetail() {
		//given
		String id = "banana";
		//when
		User user = userService.selectDetail(id);
		//then
		assertNotNull(user);
    }

	// Detail테스트 - id가 없는 경우
	@Test
    public void testSelectDetail2() {
		//given
		String id = "!@%@#&!$!#^@$&";
		//when
		User user = userService.selectDetail(id);
		//then
		assertNull(user);
    }
	
	
	// Save테스트
	@Test
    public void testSave() {
		//given
		User user = new User();
		user.setUserId("test1");
		user.setUserPw("test12345678@");
		user.setUserName("테스트");
		user.setUserNick("테스트닉네임");
		user.setUserPhone("010-1234-5678");
		user.setUserEmail("test@test.com");
		user.setCreateDate("2024-01-01 00:00:00");
		//when
		user = userService.save(user);
		System.out.println("*******"+user);
		//then
		assertNotNull(user);
    }
	

}
