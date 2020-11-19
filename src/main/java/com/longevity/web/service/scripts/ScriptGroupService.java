package com.longevity.web.service.scripts;

import com.longevity.web.domain.scripts.ScriptGroup;
import com.longevity.web.repo.ScriptGroupRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScriptGroupService {
    private ScriptGroupRepo scriptGroupRepo;

    public ScriptGroupService(ScriptGroupRepo scriptGroupRepo) {
        this.scriptGroupRepo = scriptGroupRepo;
    }


    public List<ScriptGroup> findAll() {
        return scriptGroupRepo.findAll();
    }
    public void add(String name) {
        if(scriptGroupRepo.findByName(name) == null){
            ScriptGroup scriptGroup = new ScriptGroup();
            scriptGroup.setName(name);
            scriptGroupRepo.save(scriptGroup);
        }
    }
    public void update(ScriptGroup scriptGroup, String name) {
        if(!scriptGroup.getName().equals(name)){
            scriptGroup.setName(name);
            scriptGroupRepo.save(scriptGroup);
        }
    }

    public void delete(ScriptGroup scriptGroup) {
        scriptGroupRepo.delete(scriptGroup);
    }
}
