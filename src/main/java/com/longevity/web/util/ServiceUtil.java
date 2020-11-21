package com.longevity.web.util;

import com.longevity.web.domain.util.CustomScriptNote;
import com.longevity.web.domain.scripts.Note;
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

    public static CustomScriptNote getServicesAndNotes(Map<String, String> form, ServicesRepo servicesRepo){
        CustomScriptNote list = new CustomScriptNote();
        List<Services> services = new ArrayList<>();
        List<Note> notes = new ArrayList<>();
        form.forEach((key, value) ->{
            String[] mas = key.split("-");
            if(mas.length == 2){
                if(mas[0].equals("service")){
                    if(servicesRepo.findById(Long.parseLong(value)).get() != null){
                        services.add(servicesRepo.findById(Long.parseLong(value)).get());
                    }
                }
            }
            if(mas.length == 3){
                if(mas[0].equals("service") && mas[2].equals("text")){
                    System.out.println();
                    if(value.equals("")){
                        notes.add(new Note("empty"));
                    }else{
                        notes.add(new Note(value));
                    }
                }
            }
        });
        list.setServicesList(services);
        list.setNoteList(notes);
        return list;
    }
}
