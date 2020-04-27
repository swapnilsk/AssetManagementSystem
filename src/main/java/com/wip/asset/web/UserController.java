package com.wip.asset.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.wip.asset.model.Employee;
import com.wip.asset.model.User;
import com.wip.asset.service.SecurityService;
import com.wip.asset.service.UserService;
import com.wip.asset.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wip.asset.model.Asset;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;

	@GetMapping("/login")
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");
		return "login";
	}

	@GetMapping({ "/", "/welcome" })
	public String welcome(Model model) {
		return "welcome";
	}

	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());
		return "registration";
	}

	@PostMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "registration";
		}
		userService.save(userForm);
		securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
		return "redirect:/welcome";
	}

	@GetMapping("/addasset")
	public String addAsset(Model model) {
		model.addAttribute("assetForm", new Asset());
		List<String> listEmp = userService.getEmployee();
		model.addAttribute("empList", listEmp);
		return "addasset";
	}

	@PostMapping("/addasset")
	public String addasset(@ModelAttribute("assetForm") Asset assetForm, BindingResult bindingResult) {
		userValidator.validateAsset(assetForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "addasset";
		}
		userService.saveAsset(assetForm);
		return "redirect:/welcome";
	}

	@GetMapping("/addemployee")
	public String addEmployee(Model model) {
		model.addAttribute("employeeForm", new Employee());
		return "addemployee";
	}

	@PostMapping("/addemployee")
	public String addemployee(@ModelAttribute("employeeForm") Employee employeeForm, BindingResult bindingResult) {
		userValidator.validateEmployee(employeeForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "addemployee";
		}

		userService.saveEmployee(employeeForm);
		return "redirect:/welcome";
	}

	@GetMapping("/viewassetlist")
	public String viewassetlist(Model model) {
		return "viewassetlist";
	}

    @PostMapping(value = "/viewassetlist")
    public String viewAssetDetails(@RequestParam("empID") String empID, @RequestParam("assetID") String assetID, Model model) {
        userValidator.validateEmployeeIDAndAssetId(empID, assetID, model);
        if (model.getAttribute("message") == null) {
            List<Asset> list = new ArrayList<>();
            if (!assetID.isEmpty()) {
                Optional<Asset> op = userService.getAssets(assetID);
                if (op.isPresent()) {
                    list.add(op.get());
                } else {
                    model.addAttribute("message", "No asset found . Incorrect Asset ID");
                }
            }
            if (!empID.isEmpty() && model.getAttribute("message") == null) {
                list = new ArrayList<>();
                List<Asset> assetList = userService.getEmployeeById(empID);
                if (assetList == null) {
                    model.addAttribute("message", "No asset found . Incorrect Employee ID");
                } else if (!assetID.isEmpty() && assetID != null) {
                    for (Asset asset : assetList) {
                        if (assetID.equalsIgnoreCase(asset.getAssetId().toString())) {
                            list.add(asset);
                        }
                    }
                    if (list.size() < 1) {
                        model.addAttribute("message", "No matching data found for the given Asset ID & Employee Id");
                    }
                } else {
                    list.addAll(assetList);
                }
            }
            if (model.getAttribute("message") == null)
                model.addAttribute("asset", list);
        }
        return "viewassetlist";
    }

	@GetMapping("/editasset/{assetId}")
	public String editAssets(@PathVariable(name = "assetId") String assetId, Model model) {
		System.out.println("inside /editasset/{assetId}");
		List<String> listEmp = userService.getEmployee();
		model.addAttribute("empList", listEmp);
		Optional<Asset> op = userService.getAssets(assetId);
		model.addAttribute("editAssetsForm", op.get());
		return "editasset";
	}

	@PostMapping("/editasset")
	public String editAssets(@ModelAttribute("editAssetsForm") Asset editassetForm, BindingResult bindingResult) {
		System.out.println("inside POST /editasset/");
		System.out.println(editassetForm);
		userService.saveAsset(editassetForm);
		return "viewassetlist";
	}
}
