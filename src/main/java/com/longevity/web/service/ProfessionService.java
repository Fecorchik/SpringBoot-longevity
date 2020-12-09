package com.longevity.web.service;

import com.longevity.web.domain.users.Profession;
import com.longevity.web.repo.ProfessionRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProfessionService {
    private ProfessionRepo professionRepo;

    public ProfessionService(ProfessionRepo professionRepo) {
        this.professionRepo = professionRepo;
    }


    public List<Profession> getAll() {
        return professionRepo.findAll();
    }


    public void add(String name) {
        Profession profession = new Profession();
        profession.setName(name);
        professionRepo.save(profession);
    }


    public void delete(Profession profession) {
        if (profession != null)
            professionRepo.delete(profession);
    }
}
