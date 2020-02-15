package com.auction.data.repositories;

import com.auction.data.model.UserAccount;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserAccountRepository extends JpaRepository<UserAccount, Long> {
    List<UserAccount> findAllByLogin(String login);
    List<UserAccount> findAllById(Long id);

    List<UserAccount> findAllByUsername(String userName);
    // UserAccount findAllByLogin(String login);
}
