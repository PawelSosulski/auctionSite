package com.auction.core.services;

import com.auction.data.model.Auction;
import com.auction.data.model.UserAccount;
import com.auction.data.repositories.AuctionRepository;
import com.auction.data.repositories.UserAccountRepository;
import com.auction.dto.*;

import com.auction.utils.enums.AccountType;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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

    public boolean editUser(LoggedUserDTO loggedUserDTO) {
        Optional<UserAccount> oneByLogin = userAccountRepository.getOneByLogin(getContext().getAuthentication().getName());
        if (oneByLogin.isPresent()) {
            UserAccount userAccount = oneByLogin.get();
            userAccount.setName(loggedUserDTO.getName());
            userAccount.setLastName(loggedUserDTO.getLastName());
            userAccount.setStreet(loggedUserDTO.getStreet());
            userAccount.setStreetNumber(loggedUserDTO.getStreetNumber());
            userAccount.setCity(loggedUserDTO.getCity());
            userAccount.setZipCode(loggedUserDTO.getZipCode());
            userAccount.setProvince(loggedUserDTO.getProvince());
            userAccount.setEmail(loggedUserDTO.getEmail());
            userAccountRepository.save(userAccount);
            return true;
        }
        return false;
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

    public LoggedUserDTO getUserByUsername(String login) {
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
            if (user.getAvatar()!=null) {
                return user.getAvatar().getId();
            }
        }
        return 0L;
    }

    public Long getAvatarIdByLogin(String login) {
        Optional<UserAccount> oneByLogin = userAccountRepository.getOneByLogin(login);
        if (oneByLogin.isPresent()) {
            UserAccount user = oneByLogin.get();
            if (user.getAvatar()!=null) {
                return user.getAvatar().getId();
            }
        }
        return 0L;
    }

    public List<String> getAllLogins() {
        return userAccountRepository.findAll().stream().map(UserAccount::getLogin).collect(Collectors.toList());
    }

    public Boolean isUserPromo() {
        String login = getContext().getAuthentication().getName();
        Optional<UserAccount> oneByLogin = userAccountRepository.getOneByLogin(login);
        if (oneByLogin.isPresent()) {
            UserAccount userAccount = oneByLogin.get();
            return userAccount.getType()== AccountType.PREMIUM;
        }
        return false;
    }

    public void premiumUser() {
        String login = getContext().getAuthentication().getName();
        Optional<UserAccount> oneByLogin = userAccountRepository.getOneByLogin(login);
        oneByLogin.ifPresent(user -> {
            user.setType(AccountType.PREMIUM);
            userAccountRepository.save(user);
        });
    }

    public List<String> getAllEmails() {
        return userAccountRepository.findAll().stream().map(UserAccount::getEmail).collect(Collectors.toList());
    }

    public Boolean isUserAuction(Long auctionId) {
        String login = getContext().getAuthentication().getName();
        if (login != null) {
            Optional<Auction> oneById = auctionRepository.getOneById(auctionId);
            if (oneById.isPresent()) {
                return oneById.get().getSeller().getLogin().equalsIgnoreCase(login);
            }
        }
        return false;
    }
}
