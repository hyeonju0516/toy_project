package com.thecommerce.toyproject.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.thecommerce.toyproject.entity.User;

public interface UserRepository extends JpaRepository<User, String>{

}
