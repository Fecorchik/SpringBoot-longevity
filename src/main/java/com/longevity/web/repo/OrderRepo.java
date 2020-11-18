package com.longevity.web.repo;

import com.longevity.web.domain.services.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepo extends JpaRepository<Order, Long> {
}
