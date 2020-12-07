package com.longevity.web.controller.admin;

import com.longevity.web.domain.branch.Cabinet;
import com.longevity.web.service.BranchService;
import com.longevity.web.service.CabinetService;
import com.longevity.web.service.EmployeeService;
import com.longevity.web.util.PageUtil;
import org.springframework.data.domain.Page;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin/cabinet")
public class AdminCabinet {
    private CabinetService cabinetService;
    private BranchService branchService;
    private EmployeeService employeeService;

    public AdminCabinet(CabinetService cabinetService, BranchService branchService, EmployeeService employeeService) {
        this.cabinetService = cabinetService;
        this.branchService = branchService;
        this.employeeService = employeeService;
    }

    @GetMapping("all")
    public String getAllCabinets(Model model){
//        model.addAttribute("cabinets", cabinetService.getAllCabinets());
////        model.addAttribute("branches", branchService.getAllBranch());
        return findPaginatedCabinets(PageUtil.pageNo, model);
    }

    @GetMapping("{id}")
    public String getCabinetById(@PathVariable(name = "id") Cabinet cabinet, Model model ){
        model.addAttribute("cabinet", cabinet);
        model.addAttribute("branches", branchService.getAllBranch());
        model.addAttribute("employees", employeeService.getAllEmployees());
        System.out.println();
        return "admin/cabinet/cabinet";
    }

    @PostMapping("add")
    public String addCabinet(
            @RequestParam(name = "name") String name,
            @RequestParam(name = "branch")String branch
    ){
        cabinetService.addCabinet(name,branch);
        return "redirect:/admin/cabinet/all";
    }

    @PostMapping("{id}/update")
    public String updateCabinet(
            @PathVariable(name = "id") Cabinet cabinet,
            @RequestParam(name = "nameCabinet") String name,
            @RequestParam(name = "nameBranch") String branch,
            @RequestParam Map<String, String> form
    ){
        cabinetService.updateCabinet(cabinet, name, branch, form);
        return "redirect:/admin/cabinet/"+cabinet.getId();
    }

    @GetMapping("{id}/delete")
    public String deleteCabinetById(@PathVariable(name = "id") Cabinet cabinet){
        cabinetService.deleteCabinet(cabinet);
        return "redirect:/admin/cabinet/all";
    }

    @GetMapping("/all/pageus/{pageNo}")
    public String findPaginatedCabinets(@PathVariable("pageNo") int pageNo, Model model) {
        Page<Cabinet> page = cabinetService.findPaginate(pageNo, PageUtil.pageSize);

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("cabinets", page.getContent());
        model.addAttribute("branches", branchService.getAllBranch());
        return "admin/cabinet/cabinets";
    }

}
