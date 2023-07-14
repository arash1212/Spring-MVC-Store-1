package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.User_Roles;
import org.Salehi.J2EE1.model.entity.Users;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;

@Service
public class UserService {
    @Inject
    private JpaRepository<Users, Long> repository;

    public void save(Users users) {
        users.setUser_role(new User_Roles().setRole_name("user").setEmail(users.getEmail()));
        repository.save(users);
    }

    public void remove(Users users) {
        repository.remove(users);
    }

    public void update(Users users) {
        repository.update(users);
    }

    public Users findUserByEmail(String email) {
        return repository.findOneByFieldName(Users.class, "email", email);
    }

    public Users findUserByEmailWithUserRole(String email) {
        return repository.findOneByFieldName(Users.class, "email", email, "user_role");
    }

    public Users findOneByID(long id) {
        return repository.findOneByID(Users.class, id);
    }

    public List<Users> findAll() {
        return repository.findAll(Users.class);
    }

    public Users findOneUserByIDWithUserInfo(long id) {
        return repository.findOneByIdWithChild(Users.class, "userInfo", id);
    }
}
