package com.longevity.web.repo;

import com.longevity.web.domain.scripts.ScriptGroup;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ScriptGroupRepo extends JpaRepository<ScriptGroup, Long> {
    ScriptGroup findByName(String name);
}
