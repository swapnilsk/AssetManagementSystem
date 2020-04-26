package com.wip.asset.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wip.asset.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
}
