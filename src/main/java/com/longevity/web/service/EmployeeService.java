package com.longevity.web.service;

import com.longevity.web.domain.users.Employee;
import com.longevity.web.repo.EmployeeRepo;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmployeeService {
    private EmployeeRepo employeeRepo;
    public EmployeeService(EmployeeRepo employeeRepo) {
        this.employeeRepo = employeeRepo;
    }



    public List<Employee>  getAllEmployees(){
        return employeeRepo.findAll();
    }

    public Employee findByName(String name){return employeeRepo.findByUsername(name);}

    public boolean updateEmployee(Employee employee, Map<String, String> form){
        return false;
    }
    public void deleteEmployee(Employee employee){
        employeeRepo.delete(employee);
    }
}