package com.auction.core.services;

import com.auction.data.model.Auction;
import com.auction.data.model.UserAccount;
import com.auction.data.repositories.AuctionRepository;
import com.auction.data.repositories.UserAccountRepository;
import com.auction.dto.*;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import static org.springframework.security.core.context.SecurityContextHolder.getContext;

@Service
@Transactional
public class UserService {


    private static String uploadFolder = "D:\\auction\\";

    @Autowired
    private AuctionRepository auctionRepository;
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

    public void editUser(LoggedUserDTO loggedUserDTO) {
        UserAccount currentUser = userAccountRepository.findAllByLogin(loggedUserDTO.getLogin()).get(0);
        if (loggedUserDTO.getName() != null) {
            currentUser.setName(loggedUserDTO.getName());
            currentUser.setLastName(loggedUserDTO.getLastName());
            currentUser.setStreet(loggedUserDTO.getStreet());
            currentUser.setStreetNumber(loggedUserDTO.getStreetNumber());
            currentUser.setCity(loggedUserDTO.getCity());
            currentUser.setZipCode(loggedUserDTO.getZipCode());
            currentUser.setProvince(loggedUserDTO.getProvince());
        } else {
            currentUser.setType((loggedUserDTO.getType()));
        }
        userAccountRepository.save(currentUser);
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

    public TransactionUserDTO getUserDTOById(Long sellerId) {
        List<UserAccount> allById = userAccountRepository.findAllById(sellerId);
        if (allById.size() == 1) {
            return mapper.map(allById.get(0), TransactionUserDTO.class);
        } else {
            return new TransactionUserDTO();
        }
    }

    public void removeOrAddObserveAuction(ObserveDTO observe) {
        String name = getContext().getAuthentication().getName();
        List<UserAccount> allByUsername = userAccountRepository.findAllByLogin(name);
        if (allByUsername.size() == 1) {
            UserAccount user = allByUsername.get(0);
            Optional<Auction> auction = auctionRepository.findById(observe.getAuctionId());
            if (observe.getIsObserved()) {
                auction.ifPresent(value -> user.getObserveAuctions().remove(value));
                System.out.println("\n\n USUWAM");
            } else {
                auction.ifPresent(value -> user.getObserveAuctions().add(value));
                System.out.println("\n\n DODAJE");
            }
        }
    }


    public Boolean checkIfAuctionObserve(Long auctionId) {
        String login = getContext().getAuthentication().getName();
        List<UserAccount> allByUsername = userAccountRepository.findAllByLogin(login);
        if (allByUsername.size() == 1) {
            UserAccount user = allByUsername.get(0);
            List<Long> collect = user.getObserveAuctions().stream()
                    .map(Auction::getId)
                    .collect(Collectors.toList());
            return collect.contains(auctionId);
        }
        return false;
    }

    public Long getAvatarId() {
        String login = getContext().getAuthentication().getName();
        Optional<UserAccount> oneByLogin = userAccountRepository.getOneByLogin(login);
        if (oneByLogin.isPresent()) {
            UserAccount user = oneByLogin.get();
            return user.getAvatar().getId();
        }
        return 0L;
    }
}
