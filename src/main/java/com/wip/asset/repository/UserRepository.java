package com.wip.asset.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wip.asset.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsername(String username);
}
