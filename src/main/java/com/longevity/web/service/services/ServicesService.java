package com.longevity.web.service.services;

import com.longevity.web.domain.services.Services;
import com.longevity.web.repo.ServicesRepo;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServicesService {
    private ServicesRepo servicesRepo;

    public ServicesService(ServicesRepo servicesRepo) {
        this.servicesRepo = servicesRepo;
    }

    public List<Services> getAllServices(){
        return servicesRepo.findAll();
    }

    public void deleteService(Services service) {
        servicesRepo.delete(service);
    }

    public void addService(String name, double price) {
        System.out.println();
        if(servicesRepo.findByName(name) == null){
            Services service = new Services();
            service.setName(name);
            service.setPrice(price);

            servicesRepo.save(service);
        }
    }

    public void updateService(Services service, String name, double price) {
        boolean check = false;
        if(!service.equals(name)){
            service.setName(name);
            check = true;
        }
        if(service.getPrice() != price){
            service.setPrice(price);
            check = true;
        }
        if(check){
            servicesRepo.save(service);
        }
    }

    public Page<Services> findPaginate(int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        return this.servicesRepo.findAll(pageable);
    }
}
