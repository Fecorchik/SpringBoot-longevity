package com.longevity.web.service;

import com.longevity.web.domain.branch.Branch;
import com.longevity.web.domain.branch.Cabinet;
import com.longevity.web.domain.schedule.Day;
import com.longevity.web.domain.users.Employee;
import com.longevity.web.repo.BranchRepo;
import com.longevity.web.repo.CabinetRepo;
import com.longevity.web.repo.EmployeeRepo;
import com.longevity.web.util.SchedulesUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class CabinetService{
    private CabinetRepo cabinetRepo;
    private BranchRepo branchRepo;
    private CabinetEmployeeService cabinetEmployeeService;
    private EmployeeService employeeService;
    private EmployeeRepo employeeRepo;

    public CabinetService(CabinetRepo cabinetRepo, BranchRepo branchRepo, CabinetEmployeeService cabinetEmployeeService, EmployeeService employeeService, EmployeeRepo employeeRepo) {
        this.cabinetRepo = cabinetRepo;
        this.branchRepo = branchRepo;
        this.cabinetEmployeeService = cabinetEmployeeService;
        this.employeeService = employeeService;
        this.employeeRepo = employeeRepo;
    }

    public List<Cabinet> getAllCabinets() {
        return cabinetRepo.findAll();
    }

    public void addCabinet(String nameCabinet, String nameBranch) {
        if(checkCabinetInBranch(nameCabinet, branchRepo.findByName(nameBranch).getId())){
            Branch branch = branchRepo.findByName(nameBranch);
            Cabinet cabinet = new Cabinet();
            cabinet.setName(nameCabinet);
            cabinet.setBranch(branch);

            Optional<Employee> admin = employeeRepo.findById(Long.valueOf(1));
            cabinet.setCabinetEmployee(cabinetEmployeeService.saveNewList(SchedulesUtils.getNewListCabinetEmployee(admin.get())));

            cabinetRepo.save(cabinet);
        }
    }

    public void updateCabinet(Cabinet cabinet, String newCabinetName, String nameBranch, Map<String, String> form) {
        Branch findBranch = branchRepo.findByName(nameBranch);
        //Проверяем не изменилось ли отделение. Если изменилось
        if (!findBranch.getName().equals(cabinet.getBranch().getName())) {
            //Ищем в этом отделение кабинет с таким именем, если не найден, то обновляем
            if (checkCabinetInBranch(newCabinetName, findBranch.getId())) {
                cabinet.setName(newCabinetName);
                cabinet.setBranch(findBranch);
//                cabinetRepo.save(cabinet);
            }
        } else {
            if (checkCabinetInBranch(newCabinetName, cabinet.getBranch().getId())) {
                cabinet.setName(newCabinetName);
//                cabinetRepo.save(cabinet);
            }
        }

        form.forEach((key, value)-> {
            try {
               Day.valueOf(key);
               cabinet.getCabinetEmployee().forEach(cab ->{
                   if(cab.getDay().equals(Day.valueOf(key))){
                       cab.setEmployee(employeeService.findByName(value));
                   }
               });
            } catch (IllegalArgumentException ex){}
        });
        cabinetRepo.save(cabinet);
    }

    public void deleteCabinet(Cabinet cabinet) {
        cabinetRepo.delete(cabinet);
    }

    private boolean checkCabinetInBranch(String nameCabinet, Long idBranch){
        //true - нету кабинета в отделении, false - есть
        return cabinetRepo.findByNameAndBranchId(nameCabinet, idBranch) == null;
    }

    public Page<Cabinet> findPaginate(int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        return this.cabinetRepo.findAll(pageable);
    }
}
