package com.longevity.web.controller;

import com.longevity.web.domain.users.Client;
import com.longevity.web.domain.users.Employee;
import com.longevity.web.service.UserService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class RegistrationController {
    private UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/registration/client")
    public String registrationClient() {
        return "registrationClient";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/registration/employee")
    public String registrationEmployee() {
        return "registrationEmployee";
    }

    @PostMapping("/registration/client")
    public String addUserClient(
            @RequestParam("password2") String passwordConfirm,
            @Valid Client client,
            BindingResult bindingResult,
            Model model
    ){
        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);
        System.out.println();
        if(isConfirmEmpty){
            model.addAttribute("password2Error", "Password confirmation cannot be empty");
        }
        if (client.getPassword() != null && !client.getPassword().equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if (isConfirmEmpty || bindingResult.hasErrors() ) {
//            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
//            model.mergeAttributes(errors);
            return "registration/client";
        }

        if (!userService.addUser(client)) {
            model.addAttribute("usernameError", "client exists!");
            return "registration/client";
        }
        return "redirect:/login";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/registration/employee")
    public String addUserEmployee(
            @RequestParam("password2") String passwordConfirm,
            @Valid Employee employee,
            BindingResult bindingResult,
            Model model
    ){
        System.out.println();
        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirm);
        if(isConfirmEmpty){
            model.addAttribute("password2Error", "Password confirmation cannot be empty");
        }
        if (employee.getPassword() != null && !employee.getPassword().equals(passwordConfirm)) {
            model.addAttribute("passwordError", "Passwords are different!");
        }

        if (isConfirmEmpty || bindingResult.hasErrors() ) {
//            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
//            model.mergeAttributes(errors);
            return "registration/employee";
        }

        if (!userService.addUser(employee)) {
            model.addAttribute("usernameError", "Employee exists!");
            return "registration/employee";
        }
        return "redirect:/login";
    }

}
