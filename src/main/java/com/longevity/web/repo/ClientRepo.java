package com.longevity.web.repo;

import com.longevity.web.domain.users.Client;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClientRepo extends JpaRepository<Client, Long> {
    Client findByUsername(String username);
}

