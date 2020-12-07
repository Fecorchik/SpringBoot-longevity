package com.longevity.web.service;

import com.longevity.web.domain.users.Employee;
import com.longevity.web.domain.users.Profession;
import com.longevity.web.domain.users.Role;
import com.longevity.web.repo.EmployeeRepo;
import com.longevity.web.repo.ProfessionRepo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class EmployeeService {
    private EmployeeRepo employeeRepo;
    private ProfessionRepo professionRepo;

    public EmployeeService(EmployeeRepo employeeRepo, ProfessionRepo professionRepo) {
        this.employeeRepo = employeeRepo;
        this.professionRepo = professionRepo;
    }

    public List<Profession> getAllProfession() {
        return professionRepo.findAll();
    }


    public List<Employee>  getAllEmployees(){
        return employeeRepo.findAll();
    }

    public Employee findByName(String name){return employeeRepo.findByUsername(name);}

    public void updateEmployee(Employee employee, Role role, String profession) {

        if (!profession.equals("zero")) {
            Profession prof = professionRepo.findById(Long.parseLong(profession)).get();

            if (prof != null) {
                Set<Profession> p = new HashSet<>();
                p.add(prof);
                employee.setProfession(p);
            }
        }
        Set<Role> r = new HashSet<>();
        r.add(role);
        employee.setRole(r);
        employeeRepo.save(employee);
    }
    public void deleteEmployee(Employee employee){
        employeeRepo.delete(employee);
    }

    public Page<Employee> findPaginate(int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        return this.employeeRepo.findAll(pageable);
    }
}