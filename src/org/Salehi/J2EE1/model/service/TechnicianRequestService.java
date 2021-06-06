package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.TechnicianRequests;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class TechnicianRequestService {
    @Inject
    private JpaRepository<TechnicianRequests, Long> repository;

    public void save(TechnicianRequests technicianRequests) {
        repository.save(technicianRequests);
    }

    public void remove(TechnicianRequests technicianRequests) {
        repository.remove(technicianRequests);
    }

    public void update(TechnicianRequests technicianRequests) {
        repository.update(technicianRequests);
    }

    public List<TechnicianRequests> getUserTechnicianRequests(long UserID) {
        return repository.findAllByChildId(TechnicianRequests.class, "users", UserID);
    }

    public List<TechnicianRequests> findAll() {
        return repository.findAll(TechnicianRequests.class);
    }
}
