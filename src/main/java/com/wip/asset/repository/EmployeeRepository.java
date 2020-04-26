package com.wip.asset.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wip.asset.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

}
