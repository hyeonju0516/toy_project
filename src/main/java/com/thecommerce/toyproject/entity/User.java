package com.thecommerce.toyproject.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="user")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class User {
	@Id
	@Column(name="user_id")
	private String userId;
	
	@Column(name="user_pw", nullable=false)
	private String userPw;
	
	@Column(name="user_nick")
	private String userNick;
	
	@Column(name="user_name", nullable=false)
	private String userName;
	
	@Column(name="user_phone")
	private String userPhone;
	
	@Column(name="user_email")
	private String userEmail;
	
	@Column(name="create_date", length=20, nullable=false)
	private String createDate;
	@Column(name="modify_date", length=20)
	private String modifyDate;
}
