package com.longevity.web.repo;

import com.longevity.web.domain.scripts.CustomScripts;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomScriptRepo extends JpaRepository<CustomScripts, Long> {
}
