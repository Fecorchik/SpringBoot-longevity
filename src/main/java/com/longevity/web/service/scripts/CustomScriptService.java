package com.longevity.web.service.scripts;

import com.longevity.web.domain.scripts.CustomScripts;
import com.longevity.web.domain.users.Client;
import com.longevity.web.domain.util.CustomScriptNote;
import com.longevity.web.repo.ClientRepo;
import com.longevity.web.repo.CustomScriptRepo;
import com.longevity.web.repo.NoteRepo;
import com.longevity.web.repo.ServicesRepo;
import com.longevity.web.util.ServiceUtil;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CustomScriptService {
    private CustomScriptRepo customScriptRepo;
    private ClientRepo clientRepo;
    private ServicesRepo servicesRepo;
    private NoteRepo noteRepo;

    public CustomScriptService(CustomScriptRepo customScriptRepo, ClientRepo clientRepo, ServicesRepo servicesRepo, NoteRepo noteRepo) {
        this.customScriptRepo = customScriptRepo;
        this.clientRepo = clientRepo;
        this.servicesRepo = servicesRepo;
        this.noteRepo = noteRepo;
    }

    public List<CustomScripts> findAll() {
        return customScriptRepo.findAll();
    }

    public void add(Map<String, String> form) {
        System.out.println();
        Client client = clientRepo.findById(Long.parseLong(form.get("client"))).get();
        if (client != null) {
            form.remove("_csrf");
            form.remove("client");

            CustomScriptNote list = ServiceUtil.getServicesAndNotes(form, servicesRepo);
            CustomScripts customScripts = new CustomScripts();

            list.getNoteList().forEach(note -> noteRepo.save(note));

            customScripts.setClient(client);
            customScripts.setServices(list.getServicesList());
            customScripts.setNote(list.getNoteList());
            customScriptRepo.save(customScripts);
        }

    }

    public void delete(CustomScripts customScript) {
        customScriptRepo.delete(customScript);
    }
}
