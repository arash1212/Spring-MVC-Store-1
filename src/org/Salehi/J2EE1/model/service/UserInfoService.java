package org.Salehi.J2EE1.model.service;

import org.Salehi.J2EE1.model.entity.UserInfo;
import org.Salehi.J2EE1.model.repository.JpaRepository;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class UserInfoService {
    @Inject
    private JpaRepository<UserInfo, Long> repository;

    public void save(UserInfo userInfo) {
        repository.save(userInfo);
    }

    public void update(UserInfo userInfo) {
        repository.update(userInfo);
    }

    public UserInfo findOneByID(long id) {
        return repository.findOneByID(UserInfo.class, id);
    }

}
