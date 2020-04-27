package com.wip.asset.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import com.wip.asset.model.Employee;
import com.wip.asset.repository.AssetRepository;
import com.wip.asset.repository.EmployeeRepository;
import com.wip.asset.repository.RoleRepository;
import com.wip.asset.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.wip.asset.model.Asset;
import com.wip.asset.model.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private EmployeeRepository empRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private AssetRepository assetRepository;

	@Override
	public void save(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setRoles(new HashSet<>(roleRepository.findAll()));
		userRepository.save(user);
	}

	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	@Override
	public Asset findByModelName(String modelName) {
		return assetRepository.findByModelName(modelName);
	}

	@Override
	public void saveEmployee(Employee emp) {
		empRepository.save(emp);
	}

	@Override
	public List<String> getEmployee() {
		List<Employee> emp = empRepository.findAll();
		List<String> listEmpId = new ArrayList<>();
		for (Employee empId : emp) {
			listEmpId.add(empId.getEmployeeId().toString());
		}
		return listEmpId;
	}

	@Override
	public void saveAsset(Asset assetForm) {
		assetRepository.save(assetForm);
		System.out.println(assetRepository.findAll().toString());
	}

	@Override
	public Optional<Asset> getAssets(String asset) {
		return assetRepository.findById(Long.parseLong(asset));
	}

	@Override
	public List<Asset> getEmployeeById(String empID) {
		Optional<Employee> op = empRepository.findById(Long.parseLong(empID));
		if (op.isPresent())
		 return op.get().getAssets();
		return null;
	}
}
