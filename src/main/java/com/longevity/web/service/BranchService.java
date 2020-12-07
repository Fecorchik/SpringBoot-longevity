package com.longevity.web.service;

import com.longevity.web.domain.branch.Branch;
import com.longevity.web.repo.BranchRepo;
import com.longevity.web.util.SchedulesUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class BranchService {
    private BranchRepo branchRepo;

    public BranchService(BranchRepo branchRepo) {
        this.branchRepo = branchRepo;
    }

    public Object getAllBranch() {
        return branchRepo.findAll();
    }

    public void addBranch(String name){
        Branch search = branchRepo.findByName(name);
        System.out.println();
        if(search == null){
            Branch branch = new Branch();
            branch.setName(name);
            branch.setWorkSchedule(SchedulesUtils.SetDaySchedules());
            branchRepo.save(branch);
        }
    }
    public void deleteBranch(Branch branch) {
        branchRepo.delete(branch);
    }

    public void updateBranch(Branch branch, Map<String, String> form){
        branch.setWorkSchedule(SchedulesUtils.getWorkSchedule(branch.getWorkSchedule(), SchedulesUtils.getMapFromForm(form)));
        branchRepo.save(branch);
    }

    public Page<Branch> findPaginate(int pageNo, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        return this.branchRepo.findAll(pageable);
    }
}
