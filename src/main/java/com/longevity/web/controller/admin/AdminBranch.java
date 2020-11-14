package com.longevity.web.controller.admin;

import com.longevity.web.domain.branch.Branch;
import com.longevity.web.service.BranchService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin/branch/")
public class AdminBranch {
    private BranchService branchService;

    public AdminBranch(BranchService branchService) {
        this.branchService = branchService;
    }

    @GetMapping("all")
    public String getAllBranch(Model model){
        model.addAttribute("branches", branchService.getAllBranch());
        return "admin/branch/branches";
    }

    @GetMapping("{id}")
    public String getBranchById(@PathVariable(name = "id") Branch branch, Model model ){
        model.addAttribute("branch", branch);
        return "admin/branch/branch";
    }

    @PostMapping("add")
    public String addBranch(@RequestParam String name){
        branchService.addBranch(name);
        return "redirect:/admin/branch/all";
    }

    @PostMapping("{id}/update")
    public String updateBranch(
            @PathVariable(name = "id") Branch branch,
            @RequestParam Map<String, String> form
    ){
        branchService.updateBranch(branch, form);
        return "redirect:/admin/branch/"+branch.getId();
    }

    @GetMapping("{id}/delete")
    public String deleteBranchById(@PathVariable(name = "id") Branch branch){
        branchService.deleteBranch(branch);
        return "redirect:/admin/branch/all";
    }
}
