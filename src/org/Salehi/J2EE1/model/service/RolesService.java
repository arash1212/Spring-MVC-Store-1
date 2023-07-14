package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.Roles;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class RolesService {

    @Inject
    private JpaRepository<Roles, Long> repository;

    public void save(Roles roles) {
        repository.save(roles);
    }

    public void remove(Roles roles) {
        repository.remove(roles);
    }

    public void update(Roles roles) {
        repository.update(roles);
    }

    public List<Roles> findAllByRoleName(String roleName) {
        return repository.findAllByFieldName(Roles.class, "role_name", roleName);
    }

    public List<Roles> findAll() {
        return repository.findAll(Roles.class);
    }
}
