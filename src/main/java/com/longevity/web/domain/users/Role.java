package com.longevity.web.domain.users;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ADMIN,
    USER,
    EMPLOYEE,

    SENIOR_MEDICAL_STAFF,
    AVERAGE_MEDICAL_STAFF,
    JUNIOR_MEDICAL_STAFF;

    @Override
    public String getAuthority() {
        return name();
    }
}
