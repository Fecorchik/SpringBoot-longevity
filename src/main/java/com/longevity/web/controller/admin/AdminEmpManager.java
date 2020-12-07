package com.longevity.web.controller.admin;

import com.longevity.web.domain.users.Employee;
import com.longevity.web.domain.users.Role;
import com.longevity.web.service.EmployeeService;
import com.longevity.web.util.PageUtil;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin/empl")
public class AdminEmpManager{
    private EmployeeService employeeService;

    public AdminEmpManager(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }

    @GetMapping("/all")
    public String getAllEmployee(Model model){
        return findPaginatedUsers(PageUtil.pageNo, model);
    }

    @GetMapping("/{id}")
    public String getEmployee(@PathVariable(name = "id") Employee employee, Model model){
        if (employee != null){
            model.addAttribute("employee", employee);
            model.addAttribute("roles", Role.values());
            model.addAttribute("professions", employeeService.getAllProfession());

            String employeeRoleName = null;
            String employeeProfessionName = null;

            if (!employee.getRole().isEmpty()) {
                employeeRoleName = employee.getRole().stream().collect(Collectors.toList()).get(0).name();
            }

            if (!employee.getProfession().isEmpty()) {
                employeeProfessionName = employee.getProfession().stream().collect(Collectors.toList()).get(0).getName();
            } else {
                employeeProfessionName = "empty";
            }

            model.addAttribute("employeeRoleName", employeeRoleName);
            model.addAttribute("employeeProfessionName", employeeProfessionName);

            return "admin/employee";
        }
        return "admin/employees";
    }


    @PostMapping("{id}/update")
    public String updateEmployee(@PathVariable(name = "id") Employee employee, @RequestParam Role role, @RequestParam String profession) {
        employeeService.updateEmployee(employee, role, profession);
        return "redirect:/admin/empl/all";
    }

    @GetMapping("/{id}/delete")
    public String deleteEmployee(@PathVariable(name = "id") Employee employee){
        if(employee != null)
            employeeService.deleteEmployee(employee);
        return "redirect:/admin/empl/all";
    }

    @GetMapping("/all/pageus/{pageNo}")
    public String findPaginatedUsers(@PathVariable("pageNo") int pageNo, Model model) {
        Page<Employee> page = employeeService.findPaginate(pageNo, PageUtil.pageSize);
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("employees", page.getContent());
        return "admin/employees";
    }
}
