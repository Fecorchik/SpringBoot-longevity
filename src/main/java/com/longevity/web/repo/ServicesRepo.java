package com.longevity.web.repo;

import com.longevity.web.domain.services.Services;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServicesRepo extends JpaRepository<Services, Long> {
    Services findByName(String name);
}
