package com.longevity.web.domain.users;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Collection;
import java.util.Set;
import java.util.stream.Collectors;

@MappedSuperclass
@Data
public class BaseUserEntity implements UserDetails {
    @Column(name = "username")
    private String username;


    @Column(name = "first_name")
    private String firstName;


    @Column(name = "last_name")
    private String lastName;


    @Column(name = "patronymic")
    private String patronymic;

    @JsonIgnore
    @Column(name = "password")
    private String password;


    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @Enumerated(EnumType.STRING)
    private Set<Role> role;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private StatusUser status;

    @CreatedDate
    @Column(name = "created")
    private LocalDateTime created;

    @CreatedDate
    @Column(name = "updated")
    private LocalDateTime updated;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRole();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public boolean isAdmin(){
        return getRole().contains(Role.ADMIN);
    }

    public boolean isEmployee() {
        return getRole().contains(Role.EMPLOYEE);
    }

    public String roleName() {
        return getRole().stream().map(Role::name).collect(Collectors.toList()).get(0);
    }

}
