package com.longevity.web.service.services;

import com.longevity.web.domain.services.Order;
import com.longevity.web.domain.services.Services;
import com.longevity.web.domain.services.StatusScore;
import com.longevity.web.repo.ClientRepo;
import com.longevity.web.repo.OrderRepo;
import com.longevity.web.repo.ServicesRepo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {
    private OrderRepo orderRepo;
    private ServicesRepo servicesRepo;
    private ClientRepo clientRepo;

    public OrderService(OrderRepo orderRepo, ServicesRepo servicesRepo, ClientRepo clientRepo) {
        this.orderRepo = orderRepo;
        this.servicesRepo = servicesRepo;
        this.clientRepo = clientRepo;
    }

    public List<Order> getAllOrder() {
        return orderRepo.findAll();
    }

    public void deleteOrder(Order order) {
        orderRepo.delete(order);
    }

    public void addOrder(Map<String, String> form) {
        System.out.println();

        Order order = new Order();
        order.setStatusScore(StatusScore.valueOf(form.get("status")));
        form.remove("_csrf");
        form.remove("status");
        List<Services> services = new ArrayList<>();

        order.setClient(clientRepo.findById(Long.parseLong(form.get("client"))).get());

        form.forEach((key, value) ->{
            String[] mas = key.split("-");
            if(mas[0].equals("service")){
                if(servicesRepo.findById(Long.parseLong(value)).get() != null){
                    services.add(servicesRepo.findById(Long.parseLong(value)).get());
                }
            }
        });
        order.setServices(services);

        orderRepo.save(order);
    }

    public Page<Order> findPaginate(int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        return this.orderRepo.findAll(pageable);
    }
}
