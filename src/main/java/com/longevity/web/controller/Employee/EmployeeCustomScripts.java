package com.longevity.web.controller.Employee;

import com.longevity.web.domain.scripts.CustomScripts;
import com.longevity.web.domain.scripts.Scripts;
import com.longevity.web.service.ClientService;
import com.longevity.web.service.scripts.CustomScriptService;
import com.longevity.web.service.scripts.ScriptGroupService;
import com.longevity.web.service.scripts.ScriptService;
import com.longevity.web.service.services.ServicesService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@PreAuthorize("hasAuthority('EMPLOYEE')")
//TODO роль 'EMPLOYEE' сменить на нужную роль
@RequestMapping("/employee/custom_script")
public class EmployeeCustomScripts{
    private ScriptService scriptService;
    private ClientService clientService;
    private ScriptGroupService scriptGroupService;
    private CustomScriptService customScriptService;
    private ServicesService servicesService;

    public EmployeeCustomScripts(ScriptService scriptService, ClientService clientService, ScriptGroupService scriptGroupService, CustomScriptService customScriptService, ServicesService servicesService) {
        this.scriptService = scriptService;
        this.clientService = clientService;
        this.scriptGroupService = scriptGroupService;
        this.customScriptService = customScriptService;
        this.servicesService = servicesService;
    }

    @GetMapping("all")
    public String getAll(
            @RequestParam(required = false, defaultValue = "") String filter,
            Model model
    ){
        model.addAttribute("scripts", scriptService.findAll(filter));
        model.addAttribute("groups", scriptGroupService.findAll());
        model.addAttribute("customScripts", customScriptService.findAll());

        return "employee/custom_script/scripts";
    }

    @GetMapping("{id}")
    public String getById(@PathVariable(name = "id") CustomScripts customScript, Model model ){
        model.addAttribute("customScript", customScript);
        model.addAttribute("count", customScript.getServices().size());
        return "employee/custom_script/script";
    }

    @GetMapping("template/{id}")
    public String template(@PathVariable(name = "id") Scripts script, Model model){
        model.addAttribute("clients", clientService.getAllClient());
        model.addAttribute("services", servicesService.getAllServices());
        model.addAttribute("script", script);
        return "employee/custom_script/create";
    }

    @PostMapping("add")
    public String add(@RequestParam Map<String, String> form){
        customScriptService.add(form);
        return "redirect:/employee/custom_script/all";
    }

    @GetMapping("{id}/delete")
    public String delete(@PathVariable(name = "id") CustomScripts customScript){
        customScriptService.delete(customScript);
        return "redirect:/employee/custom_script/all";
    }
}
