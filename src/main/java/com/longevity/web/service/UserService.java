package com.longevity.web.service;

import com.longevity.web.domain.users.*;
import com.longevity.web.repo.ClientRepo;
import com.longevity.web.repo.EmployeeRepo;
import com.longevity.web.util.SchedulesUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Collections;

@Service
public class UserService implements UserDetailsService {
    private ClientRepo clientRepo;
    private EmployeeRepo employeeRepo;
    private PasswordEncoder passwordEncoder;

    public UserService(ClientRepo clientRepo, EmployeeRepo employeeRepo, PasswordEncoder passwordEncoder) {
        this.clientRepo = clientRepo;
        this.employeeRepo = employeeRepo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Client client = clientRepo.findByUsername(username);
        if(client == null){
            Employee employee = employeeRepo.findByUsername(username);
            if(employee == null){
                throw new UsernameNotFoundException("User not found");
            }
            return employee;
        }
        return client;
    }

    public boolean addUser(User user) {
        System.out.println();
        if(user instanceof Client){
            if (clientRepo.findByUsername(((Client) user).getUsername()) != null) {
                return false;
            }
            ((Client) user).setRole(Collections.singleton(Role.CLIENT));
            ((Client) user).setStatus(StatusUser.ACTIVE);
            ((Client) user).setPassword(passwordEncoder.encode(((Client) user).getPassword()));
            ((Client) user).setCreated(LocalDateTime.now());
            ((Client) user).setUpdated(LocalDateTime.now());
            clientRepo.save(((Client) user));
            return true;
        }
        else if(user instanceof Employee){
            if (employeeRepo.findByUsername(((Employee) user).getUsername()) != null) {
                return false;
            }
            ((Employee) user).setRole(Collections.singleton(Role.EMPLOYEE));
            ((Employee) user).setStatus(StatusUser.ACTIVE);
            ((Employee) user).setPassword(passwordEncoder.encode(((Employee) user).getPassword()));
            ((Employee) user).setCreated(LocalDateTime.now());
            ((Employee) user).setUpdated(LocalDateTime.now());
//            ((Employee) user).setWorkSchedules(SchedulesUtils.SetDaySchedules());
            ((Employee) user).setWorkSchedules(SchedulesUtils.SetDaySchedules());
            employeeRepo.save(((Employee) user));
            return true;
        }
        return false;
    }
}
