package com.longevity.web.controller.Employee;

import com.longevity.web.domain.scripts.Scripts;
import com.longevity.web.service.scripts.ScriptGroupService;
import com.longevity.web.service.scripts.ScriptService;
import com.longevity.web.service.services.ServicesService;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('EMPLOYEE')")
//TODO роль 'EMPLOYEE' сменить на нужную роль
@RequestMapping("/employee/script")
public class EmployeeScripts {
    private ScriptService scriptService;
    private ServicesService servicesService;
    private ScriptGroupService scriptGroupService;

    public EmployeeScripts(ScriptService scriptService, ServicesService servicesService, ScriptGroupService scriptGroupService) {
        this.scriptService = scriptService;
        this.servicesService = servicesService;
        this.scriptGroupService = scriptGroupService;
    }

    @GetMapping("all")
    public String getAll(
            @RequestParam(required = false, defaultValue = "") String filter,
            @PageableDefault(sort = { "id" }, direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ){
        model.addAttribute("scripts", scriptService.findAll(filter));
        model.addAttribute("services", servicesService.getAllServices());
        model.addAttribute("groups", scriptGroupService.findAll());

        return "employee/script/scripts";
    }


    @GetMapping("{id}")
    public String getById(@PathVariable(name = "id") Scripts script, Model model ){
        model.addAttribute("script", script);
        model.addAttribute("services", servicesService.getAllServices());
        model.addAttribute("groups", scriptGroupService.findAll());
        return "employee/script/script";
    }

    @PostMapping("add")
    public String add(@RequestParam Map<String, String> form){
        scriptService.add(form);
        return "redirect:/employee/script/all";
    }

    @PostMapping("{id}/update")
    public String update(@PathVariable(name = "id") Scripts script, @RequestParam Map<String, String> form){
        scriptService.update(script, form);
        return "redirect:/employee/script/"+script.getId();
    }

    @GetMapping("{id}/delete")
    public String delete(@PathVariable(name = "id") Scripts scripts){
        scriptService.delete(scripts);
        return "redirect:/employee/script/all";
    }
}
