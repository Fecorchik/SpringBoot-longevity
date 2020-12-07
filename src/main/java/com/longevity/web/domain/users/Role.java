package com.longevity.web.domain.users;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ADMIN("Админ"),
    CLIENT("Клиент"),
    EMPLOYEE("Сотрудник"),

    SENIOR_MEDICAL_STAFF("Старший сотрудник"),
    AVERAGE_MEDICAL_STAFF("Средний сотрудник"),
    JUNIOR_MEDICAL_STAFF("Младший сотрудник");



    @Override
    public String getAuthority() {
        return name();
    }


    private String role;

    Role() {
    }

    Role(String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }
}
