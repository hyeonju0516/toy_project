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
	private String id;
	@Column(nullable=false)
	private String password;
	private String nickname;
	@Column(nullable=false)
	private String name;
	private String phone;
	private String email;
	
	@Column(name="create_date", length=20, nullable=false)
	private String createDate;
	@Column(name="modify_date", length=20)
	private String modifyDate;
}
