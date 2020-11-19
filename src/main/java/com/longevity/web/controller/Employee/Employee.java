package com.longevity.web.controller.Employee;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@PreAuthorize("hasAuthority('ADMIN')" + "|| hasAuthority('EMPLOYEE')")
//TODO роль 'EMPLOYEE' сменить на нужную роль
@RequestMapping("/employee")
public class Employee {
    @GetMapping()
    public String getEmployeePage(){
        return "employee/employee";
    }
}
