package com.longevity.web.repo;

import com.longevity.web.domain.scripts.ScriptGroup;
import com.longevity.web.domain.scripts.Scripts;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ScriptRepo extends JpaRepository<Scripts, Long> {
    Scripts findByName(String name);

    List<Scripts> findByScriptGroup(ScriptGroup scriptGroup);
}
