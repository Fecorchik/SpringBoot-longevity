package com.longevity.web.service;

import com.longevity.web.domain.users.Client;
import com.longevity.web.repo.ClientRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientService {
    private ClientRepo clientRepo;

    public ClientService(ClientRepo clientRepo) {
        this.clientRepo = clientRepo;
    }

    public List<Client> getAllClient(){return clientRepo.findAll();}
}
