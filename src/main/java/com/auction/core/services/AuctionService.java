package com.auction.core.services;

import com.auction.data.model.*;
import com.auction.data.repositories.*;
import com.auction.dto.AuctionDTO;
import com.auction.dto.LoggedUserDTO;
import com.auction.utils.enums.AuctionStatus;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import javax.xml.crypto.Data;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.Principal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.springframework.security.core.context.SecurityContextHolder.*;

@Service
@Transactional
public class AuctionService {
    @Autowired
    private BiddingRepository biddingRepository;
    private UserAccountRepository userAccountRepository;
    private AuctionRepository auctionRepository;
    private CategoryRepository categoryRepository;
    private Mapper mapper;
    private PurchaseRepository purchaseRepository;

    @Autowired
    public AuctionService(UserAccountRepository userAccountRepository, AuctionRepository auctionRepository, CategoryRepository categoryRepository, Mapper mapper, PurchaseRepository purchaseRepository) {
        this.userAccountRepository = userAccountRepository;
        this.auctionRepository = auctionRepository;
        this.categoryRepository = categoryRepository;
        this.mapper = mapper;
        this.purchaseRepository = purchaseRepository;
    }

    public List<AuctionDTO> findAllAuctionsWithCategory() {

        List<AuctionDTO> auctionDTOList = new ArrayList<>();

        auctionRepository.findAll().forEach(a -> {
            AuctionDTO auctionDTO = mapper.map(a, AuctionDTO.class);
            auctionDTO.setCategoryId(a.getCategory().getId());
            auctionDTO.setSellerId(a.getSeller().getId());
            auctionDTO.setCategoryName(a.getCategory().getName());
            auctionDTOList.add(auctionDTO);
        });

        return auctionDTOList;
    }

    public List<AuctionDTO> findAllByStatusWithCategory(AuctionStatus status) {

        List<AuctionDTO> auctionDTOList = new ArrayList<>();

        auctionRepository.findAllByStatus(status).forEach(a -> {
            AuctionDTO auctionDTO = mapper.map(a, AuctionDTO.class);
            auctionDTO.setCategoryId(a.getCategory().getId());
            auctionDTO.setSellerId(a.getSeller().getId());
            auctionDTO.setCategoryName(a.getCategory().getName());
            auctionDTOList.add(auctionDTO);
        });

        return auctionDTOList;
    }


    public List<AuctionDTO> findAllById(String auctionId) {
        List<AuctionDTO> auctionDTOList = new ArrayList<>();
        auctionRepository.findAllById(Long.valueOf(auctionId)).forEach(a -> {
            AuctionDTO auctionDTO = mapper.map(a, AuctionDTO.class);
            auctionDTO.setCategoryId(a.getCategory().getId());
            auctionDTO.setSellerId(a.getSeller().getId());
            auctionDTO.setCategoryName(a.getCategory().getName());

            List<BigInteger> biggestValue = biddingRepository.findBiggestValue(a.getId());
            if (biggestValue.size()>0) {
                auctionDTO.setActualPrice(biggestValue.get(0));
                System.out.println("\n\n\nvalue: "+biggestValue.get(0));
            }
            auctionDTOList.add(auctionDTO);
        });

        return auctionDTOList;
    }


    public List<AuctionDTO> findAllBySellerId(Long id) {
        List<AuctionDTO> myAuctions = new ArrayList<>();
        auctionRepository.findAllBySellerId(id).forEach(a -> {
            AuctionDTO auctionDTO = mapper.map(a, AuctionDTO.class);
            auctionDTO.setCategoryId(a.getCategory().getId());
            auctionDTO.setCategoryName(a.getCategory().getName());
            myAuctions.add(auctionDTO);
        });

        return myAuctions;
    }

    public String addAuction(AuctionDTO auctionDTO) {


        LocalDateTime dateNow = LocalDateTime.now();
        Integer auctionDays = auctionDTO.getDays();
        Auction auction = mapper.map(auctionDTO, Auction.class);
        auction.setStatus(AuctionStatus.PENDING);
        auction.setDateCreated(dateNow);
        auction.setDateEnded(dateNow.plusDays(auctionDays));

        String sellerLogin =
                getContext().getAuthentication().getName();

        List<Category> allCategoryById = categoryRepository.findAllById(auctionDTO.getCategoryId());
        if (allCategoryById.size() == 1) {
            auction.setCategory(allCategoryById.get(0));
        }



        List<UserAccount> allUsersByUsername = userAccountRepository.findAllByLogin(sellerLogin);
        UserAccount user;
        if (allUsersByUsername.size() == 1) {
            user = allUsersByUsername.get(0);

            auction.setSeller(user);
            return String.valueOf(auctionRepository.save(auction).getId());

        }
        return "";
    }

    public void buyAuctionByUser(String auctionId) {
        List<Auction> allById = auctionRepository.findAllById(Long.valueOf(auctionId));
        if (allById.size() == 1) {
            Auction auction = allById.get(0);
            auction.setStatus(AuctionStatus.SOLD);
            UserAccount user = userAccountRepository.getOne(1L);
            Purchase purchase = new Purchase();
            purchase.setAuction(auction);
            purchase.setBuyerUser(user);
            purchase.setAmount(auction.getBuyNowPrice());
            user.getPurchases().add(purchase);
            userAccountRepository.save(user);
            purchaseRepository.save(purchase);
            auctionRepository.save(auction);
        }

    }

    public boolean makeBid(String auctionId, String value) {
        String name = getContext().getAuthentication().getName();

        List<UserAccount> allUsersByLogin = userAccountRepository
                .findAllByLogin(name);
        UserAccount user = allUsersByLogin.get(0);

        Optional<Auction> auctionOptional = auctionRepository.findById(Long.valueOf(auctionId));
        if (auctionOptional.isPresent()) {
            Auction auction = auctionOptional.get();
            Bidding bid = new Bidding();
            bid.setAmount(BigDecimal.valueOf(Long.valueOf(value)));
            bid.setBiddingUser(user);
            bid.setAuction(auction);
            biddingRepository.save(bid);
            return true;
        }
        return false;
    }
}
