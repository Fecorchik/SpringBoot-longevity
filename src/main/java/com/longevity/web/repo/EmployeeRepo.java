package com.longevity.web.repo;

import com.longevity.web.domain.users.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepo extends JpaRepository<Employee, Long> {
    Employee findByUsername(String username);
}
