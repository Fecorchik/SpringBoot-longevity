package com.longevity.web.repo;

import com.longevity.web.domain.branch.Branch;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BranchRepo extends JpaRepository<Branch, Long> {
    Branch findByName(String name);
}
