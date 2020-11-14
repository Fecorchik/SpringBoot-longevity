package com.longevity.web.repo;

import com.longevity.web.domain.branch.Cabinet;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CabinetRepo extends JpaRepository<Cabinet, Long> {

    Cabinet findByName(String name);

    Cabinet findByNameAndBranchId(String name, Long branchId);
}
