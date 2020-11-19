package com.longevity.web.util;

import com.longevity.web.domain.services.Services;
import com.longevity.web.repo.ServicesRepo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ServiceUtil {

    public static List<Services> getListService(Map<String, String> form, ServicesRepo servicesRepo){
        List<Services> services = new ArrayList<>();
        form.forEach((key, value) ->{
            String[] mas = key.split("-");
            if(mas[0].equals("service")){
                if(servicesRepo.findById(Long.parseLong(value)).get() != null){
                    services.add(servicesRepo.findById(Long.parseLong(value)).get());
                }
            }
        });
        return services;
    }
}
