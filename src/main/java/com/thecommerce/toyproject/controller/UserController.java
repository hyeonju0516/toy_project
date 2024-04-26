package com.thecommerce.toyproject.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thecommerce.toyproject.domain.PageRequestDTO;
import com.thecommerce.toyproject.domain.PageResultDTO;
import com.thecommerce.toyproject.entity.User;
import com.thecommerce.toyproject.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@AllArgsConstructor
@RequestMapping(value="/api/user")
@Controller
public class UserController {

	private UserService service;
	PasswordEncoder passwordEncoder;
	
	// 회원리스트
	@GetMapping("/list")
	public String selectList(@RequestParam(value="page", defaultValue="1") int page,
							 @RequestParam(value="pageSize", defaultValue="10") int pageSize,
							 @RequestParam(value="sort", defaultValue="createDate") String sort,
							 Model model) {
		PageRequestDTO requestDTO = PageRequestDTO.builder()
				.page(page).size(pageSize).build();
		
		PageResultDTO<User> resultDTO = service.selectList(requestDTO, sort);
		
		log.info(resultDTO.toString());
		
		model.addAttribute("userList", resultDTO.getEntityList());
	    model.addAttribute("resultDTO", resultDTO);
	    model.addAttribute("sort", sort);
	    model.addAttribute("pageSize", pageSize);
		
		return "user/userList";
	}
	
	
	// 회원상세
	@GetMapping("/{userId}")
	public String selectDetail(@PathVariable("userId") String userId, Model model, HttpServletRequest request) {
		
		try {
			
			if(userId != null || !"".equals(userId)) {
				model.addAttribute("userDetail", service.selectDetail(userId));
				
				if("U".equals(request.getParameter("jCode"))) {
					return "user/userUpdate";
				}else {
					return "user/userDetail";
				}
			}else {
				throw new NullPointerException("userId 값이 존재하지 않습니다.");
			}
		} catch (NullPointerException e) {
			log.error(e.toString());
		} catch (Exception e) {
			log.error("user selectDetail Exception => "+ e.toString());
		}
		
		return "redirect:/api/user/list";
	}
	
	// 회원수정
	@PostMapping("/{userId}")
	public String update(User entity, Model model) {
		try {
			if(entity.getUserId() == null || entity.getUserPw() == null || 
			   entity.getUserName() == null || entity.getUserPhone() == null) {
				throw new Exception("전송 받은 정보가 부족합니다. => "+entity.toString());
			}else {
				entity.setModifyDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
				if(service.save(entity) != null) {
					return "redirect:/api/user/"+entity.getUserId();
				}else {
					model.addAttribute("message", "정보수정에 실패했습니다.");
				}
			}
		} catch (Exception e) {
			log.error("user join Exception =>  "+e.toString());
		}
		
		return "redirect:/api/user/"+entity.getUserId()+"?jCode=U";
	
	}
	
	
	// 회원가입
	@GetMapping("/join")
	public String joinPage() {
		return "user/userJoin";
	}
	
	@PostMapping("/join")
	public String join(User entity, Model model, HttpServletResponse response) {
		try {
			if(entity.getUserId() == null || entity.getUserPw() == null || 
			   entity.getUserName() == null || entity.getUserPhone() == null) {
				throw new Exception("전송 받은 정보가 부족합니다. => "+entity.toString());
			}else {
				entity.setUserPw(passwordEncoder.encode(entity.getUserPw()));
				entity.setCreateDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
				if(service.save(entity) != null) {
					response.setStatus(HttpServletResponse.SC_CREATED);
					return "/home";
				}else {
					model.addAttribute("message", "회원가입에 실패했습니다.");
					return "redirect:/api/user/join";
				}
			}
		} catch (Exception e) {
			log.error("user join Exception =>  "+e.toString());
			return "redirect:/api/user/join";
		}

	}
	
	// ID중복검사
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String id) {
		try {
			if(id != null || !"".equals(id)) {
				if(service.selectDetail(id) == null) {
					return "ok";
				}
			}else {
				throw new NullPointerException("userId 값이 존재하지 않습니다.");
			}
		} catch (NullPointerException e) {
			log.error(e.toString());
		} catch (Exception e) {
			log.error("join idCheck Exception => "+ e.toString());
		}
		return "no";
	}
	
	// 로그인
	@GetMapping("/login")
	public String loginPage() {
		return "user/userLogin";
	}
	
	@PostMapping(value = "/login")
	public String login(User entity, Model model, HttpSession session) {

		try {
			String pw = entity.getUserPw();
			User user = service.selectDetail(entity.getUserId());

			if (user != null && passwordEncoder.matches(pw, user.getUserPw())) {
				session.setAttribute("loginId", entity.getUserId());

				return "redirect:/home";

			} else {
				
				model.addAttribute("message", "아이디와 비밀번호를 확인해 주세요.");
				return "redirect:/login";
			}

		} catch (Exception e) {
			log.info("** Login Exception => " + e.toString());

			return "redirect:/login";
		}
	}
	
	// 로그아웃
	@GetMapping(value="/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/home";
	}
	
}
