package com.longevity.web.service.scripts;

import com.longevity.web.domain.scripts.ScriptGroup;
import com.longevity.web.domain.scripts.Scripts;
import com.longevity.web.domain.services.Services;
import com.longevity.web.repo.ScriptGroupRepo;
import com.longevity.web.repo.ScriptRepo;
import com.longevity.web.repo.ServicesRepo;
import com.longevity.web.util.ServiceUtil;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ScriptService {
    private ScriptRepo scriptRepo;
    private ServicesRepo servicesRepo;
    private ScriptGroupRepo scriptGroupRepo;

    public ScriptService(ScriptRepo scriptRepo, ServicesRepo servicesRepo, ScriptGroupRepo scriptGroupRepo) {
        this.scriptRepo = scriptRepo;
        this.servicesRepo = servicesRepo;
        this.scriptGroupRepo = scriptGroupRepo;
    }

    public List<Scripts> findAll(String filter) {
        if (filter != null && !filter.isEmpty()) {
            System.out.println();
            return scriptRepo.findByScriptGroup(scriptGroupRepo.findByName(filter));
        } else {
            return scriptRepo.findAll();
        }
    }

    public void add(Map<String, String> form) {
        if(form.get("name").equals("") || form.get("group").equals("") || form.get("service-1").equals("")) {
            return;
        }
        if(scriptRepo.findByName(form.get("name")) != null){
            return;
        }


        Scripts script = new Scripts();
        script.setName(form.get("name"));
        ScriptGroup scriptGroup = new ScriptGroup();
        scriptGroup = scriptGroupRepo.findById(Long.parseLong(form.get("group"))).get();

        if(scriptGroup != null){
            script.setScriptGroup(scriptGroup);
            List<Services> services = ServiceUtil.getListService(form, servicesRepo);
            if(services.size() > 0){
                script.setServices(services);
                scriptRepo.save(script);
            }
        }
    }

    public void update(Scripts script, Map<String, String> form) {
        System.out.println();
        if(form.get("name").equals("") || form.get("group").equals("") || form.get("service-1").equals("")) {
            return;
        }

        if(!script.getName().equals(form.get("name"))){
            script.setName(form.get("name"));
        }
        ScriptGroup scriptGroup = new ScriptGroup();
        scriptGroup = scriptGroupRepo.findById(Long.parseLong(form.get("group"))).get();
        if(!script.getScriptGroup().equals(scriptGroup)){
            script.setScriptGroup(scriptGroup);
        }
        List<Services> services = ServiceUtil.getListService(form, servicesRepo);
        if(!services.equals(script.getServices()) && services.size() > 0){
            script.setServices(services);
        }
        scriptRepo.save(script);
    }

    public void delete(Scripts scripts){
        scriptRepo.delete(scripts);
    }
}
