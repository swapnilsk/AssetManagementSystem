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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
		if(emp==null) return;

		String regexAlphaNumeric = "^[a-zA-Z0-9]+$";
		String regexAlphabetOnly = "^[a-zA-Z]+$";
		String regexNumericOnly = "^[0-9]+$";

		if (emp.getEmployeeId()==null || emp.getEmployeeId().trim().length()<1)
			errors.rejectValue("employeeId","EmployeeValidation.employeeId.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphaNumeric, emp.getEmployeeId()))
			errors.rejectValue("employeeId","EmployeeValidation.employeeId.alphaNumeric");

		if (errors.getErrorCount()==0 && (emp.getSurname()==null || emp.getSurname().trim().length()<1))
			errors.rejectValue("surname","EmployeeValidation.surname.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphabetOnly, emp.getSurname()))
			errors.rejectValue("surname","EmployeeValidation.surname.alphabetOnly");

		if (errors.getErrorCount()==0 && (emp.getName()==null || emp.getName().trim().length()<1))
			errors.rejectValue("name","EmployeeValidation.name.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphabetOnly, emp.getName()))
			errors.rejectValue("name","EmployeeValidation.name.alphabetOnly");

		if (errors.getErrorCount()==0 && (emp.getMobileNumber()==null || emp.getMobileNumber().trim().length()<1))
			errors.rejectValue("mobileNumber","EmployeeValidation.mobileNumber.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexNumericOnly, emp.getMobileNumber()))
			errors.rejectValue("mobileNumber","EmployeeValidation.mobileNumber.numericOnly");
		if (errors.getErrorCount()==0 && (emp.getMobileNumber()==null || emp.getMobileNumber().trim().length()!=10))
			errors.rejectValue("mobileNumber","EmployeeValidation.mobileNumber.invalid");

		if (errors.getErrorCount()==0 && (emp.getLocation()==null || emp.getLocation().trim().length()<1))
			errors.rejectValue("location","EmployeeValidation.location.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphabetOnly, emp.getLocation()))
			errors.rejectValue("location","EmployeeValidation.location.alphabetOnly");

		if (errors.getErrorCount()==0 && (emp.getDesignation()==null || emp.getDesignation().trim().length()<1))
			errors.rejectValue("designation","EmployeeValidation.designation.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphabetOnly, emp.getDesignation()))
			errors.rejectValue("designation","EmployeeValidation.designation.alphabetOnly");
	}

	public void validateAsset(Object o, Errors errors) {
		Asset asset = (Asset) o;

		//TODO The commented code does not belong here
		/*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "modelName", "NotEmpty");
		if (asset.getModelName().length() < 6 || asset.getModelName().length() > 32) {
			errors.rejectValue("modelName", "Size.userForm.username");
		}
		if (userService.findByUsername(asset.getModelName()) != null) {
			errors.rejectValue("modelName", "Duplicate.userForm.username");
		}*/
		String regexAlphaNumeric = "^[a-zA-Z0-9]+$";
		String regexAlphabetOnly = "^[a-zA-Z]+$";
		if(asset==null) return;

		if (asset.getAssetId()==null || asset.getAssetId().trim().length()<1)
			errors.rejectValue("assetId","AssetValidation.assetID.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphaNumeric, asset.getAssetId()))
			errors.rejectValue("assetId","AssetValidation.assetID.alphaNumeric");

		if (errors.getErrorCount()==0 && (asset.getProductName()==null || asset.getProductName().trim().length()<1))
			errors.rejectValue("productName","AssetValidation.productName.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphaNumeric, asset.getProductName()))
			errors.rejectValue("productName","AssetValidation.productName.alphaNumeric");

		if (errors.getErrorCount()==0 && (asset.getModelName()==null || asset.getModelName().length()<1))
			errors.rejectValue("modelName","AssetValidation.modelName.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphaNumeric, asset.getModelName()))
			errors.rejectValue("modelName","AssetValidation.modelName.alphaNumeric");

		if (errors.getErrorCount()==0 && (asset.getProductCondition()==null || asset.getProductCondition().length()<1))
			errors.rejectValue("productCondition","AssetValidation.productCondition.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphabetOnly, asset.getProductCondition()))
			errors.rejectValue("productCondition","AssetValidation.productCondition.alphabetOnly");

		if (errors.getErrorCount()==0 && (asset.getProductColor()==null || asset.getProductColor().length()<1))
			errors.rejectValue("productColor","AssetValidation.productColor.mandatory");
		if (errors.getErrorCount()==0 && !isRegexCompatible(regexAlphabetOnly, asset.getProductColor()))
			errors.rejectValue("productColor","AssetValidation.productColor.alphabetOnly");

		if (errors.getErrorCount()==0 && (asset.getEmployee()==null))
			errors.rejectValue("employee","AssetValidation.employee.mandatory");
	}

	public void validateEmployeeIDAndAssetId(String empID, String assetID, Model model) {
		if ((empID == null || empID.trim().isEmpty()) && (assetID == null || assetID.trim().isEmpty())) {
			model.addAttribute("message", "Please enter a valid Employee Id or Asset Id");
		}
	}

	private boolean isRegexCompatible(String regex, String valueToValidate) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(valueToValidate);
		return matcher.matches();
	}
}
