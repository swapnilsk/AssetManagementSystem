package com.wip.asset.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.wip.asset.model.Asset;
import com.wip.asset.model.Employee;
import com.wip.asset.model.User;
import com.wip.asset.service.UserService;

@Component
public class UserValidator implements Validator {
	@Autowired
	private UserService userService;

	@Override
	public boolean supports(Class<?> aClass) {
		return User.class.equals(aClass);
	}

	@Override
	public void validate(Object o, Errors errors) {
		User user = (User) o;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
		if (user.getUsername().length() < 6 || user.getUsername().length() > 32) {
			errors.rejectValue("username", "Size.userForm.username");
		}
		if (userService.findByUsername(user.getUsername()) != null) {
			errors.rejectValue("username", "Duplicate.userForm.username");
		}

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
		if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
			errors.rejectValue("password", "Size.userForm.password");
		}

		if (!user.getPasswordConfirm().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
		}
	}

	public void validateEmployee(Object o, Errors errors) {
		Employee emp = (Employee) o;
	}

	public void validateAsset(Object o, Errors errors) {
		Asset asset = (Asset) o;

	}

	public void validateEmployeeIDAndAssetId(String empID, String assetID, Model model) {
		if ((empID == null || empID.trim().isEmpty()) && (assetID == null || assetID.trim().isEmpty())) {
			model.addAttribute("message", "Please enter a valid Employee Id or Asset Id");
		}
	}
}
