package com.wip.asset.service;

import java.util.List;
import java.util.Optional;

import com.wip.asset.model.Asset;
import com.wip.asset.model.Employee;
import com.wip.asset.model.User;

public interface UserService {
    void save(User user);
    void saveEmployee(Employee emp);
    User findByUsername(String username);
	Asset findByModelName(String modelName);
	List<String> getEmployee();
	void saveAsset(Asset assetForm);
	Optional<Asset> getAssets(String assetForm);
	List<Asset> getEmployeeById(String empID);
}
