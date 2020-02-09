package com.auction.core.services;

import com.auction.data.model.UserAccount;
import com.auction.data.repositories.UserAccountRepository;
import com.auction.dto.LoggedUserDTO;
import com.auction.dto.NewUserDTO;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {

    private UserAccountRepository userAccountRepository;
    private Mapper mapper;
    private PasswordEncoder passwordEncoder;

    @Autowired
    public UserService(UserAccountRepository userAccountRepository,
                       Mapper mapper, PasswordEncoder passwordEncoder) {
        this.userAccountRepository = userAccountRepository;
        this.mapper = mapper;
        this.passwordEncoder = passwordEncoder;
    }

    public Boolean addNewUser(NewUserDTO newUserDTO) {
        UserAccount newUser = mapper.map(newUserDTO, UserAccount.class);
        newUser.setPassword(passwordEncoder.encode(newUserDTO.getPassword()));
        userAccountRepository.save(newUser);
        return true;
    }

    public boolean checkIfAlreadyExists(NewUserDTO newUserDTO) {
        List<UserAccount> allByLogin = userAccountRepository.findAllByLogin(newUserDTO.getLogin());
        return allByLogin.size() > 0;

    }

    public LoggedUserDTO getUserByLogin(String login) {
        List<UserAccount> allByLogin = userAccountRepository.findAllByLogin(login);
        if (allByLogin.size() == 1)
            return mapper.map(allByLogin.get(0), LoggedUserDTO.class);
        else
            return new LoggedUserDTO();


    }
}
