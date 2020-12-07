package com.longevity.web.repo;

import com.longevity.web.domain.users.Profession;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProfessionRepo extends JpaRepository<Profession, Long> {
    Profession findByName(String name);
}
