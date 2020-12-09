package com.longevity.web.controller.admin;

import com.longevity.web.domain.users.Profession;
import com.longevity.web.service.ProfessionService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin/profession")
public class AdminProfession {
    private ProfessionService professionService;

    public AdminProfession(ProfessionService professionService) {
        this.professionService = professionService;
    }

    @GetMapping("all")
    public String getAll(Model model) {
        model.addAttribute("professions", professionService.getAll());
        return "admin/profession/professions";
    }

    @GetMapping("{id}")
    public String getById(@PathVariable(name = "id") Profession profession, Model model) {
        model.addAttribute("profession", profession);
        return "admin/profession/profession";
    }

    @PostMapping("add")
    public String add(@RequestParam String name) {
        professionService.add(name);
        return "redirect:/admin/profession/all";
    }

    @GetMapping("{id}/delete")
    public String delete(@PathVariable(name = "id") Profession profession) {
        professionService.delete(profession);
        return "redirect:/admin/profession/all";
    }

}
