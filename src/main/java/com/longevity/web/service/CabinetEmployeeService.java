package com.longevity.web.service;

import com.longevity.web.domain.schedule.CabinetEmployee;
import com.longevity.web.repo.CabinetEmployeeRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CabinetEmployeeService {
    private CabinetEmployeeRepo cabinetEmployeeRepo;

    public CabinetEmployeeService(CabinetEmployeeRepo cabinetEmployeeRepo) {
        this.cabinetEmployeeRepo = cabinetEmployeeRepo;
    }

    public List<CabinetEmployee> saveNewList(List<CabinetEmployee> list){
        list.forEach(cab -> cabinetEmployeeRepo.save(cab));
        return list;
    }
}
