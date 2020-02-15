package com.auction.core.services;

import com.auction.data.model.Auction;
import com.auction.data.model.Category;
import com.auction.data.model.Purchase;
import com.auction.data.model.UserAccount;
import com.auction.data.repositories.AuctionRepository;
import com.auction.data.repositories.CategoryRepository;
import com.auction.data.repositories.PurchaseRepository;
import com.auction.data.repositories.UserAccountRepository;
import com.auction.dto.AuctionDTO;
import com.auction.dto.LoggedUserDTO;
import com.auction.utils.enums.AuctionStatus;
import org.dozer.DozerBeanMapper;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Service
@Transactional
public class AuctionService {

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


    public List<AuctionDTO> findAllById(String auctionId) {
        List<AuctionDTO> auctionDTOList = new ArrayList<>();
        auctionRepository.findAllById(Long.valueOf(auctionId)).forEach(a -> {
            AuctionDTO auctionDTO = mapper.map(a, AuctionDTO.class);
            auctionDTO.setCategoryId(a.getCategory().getId());
            auctionDTO.setSellerId(a.getSeller().getId());
            auctionDTO.setCategoryName(a.getCategory().getName());
            auctionDTOList.add(auctionDTO);
        });

        return auctionDTOList;
    }

    public Long addAuction(AuctionDTO auctionDTO) {
        Auction auction = mapper.map(auctionDTO, Auction.class);
        auction.setStatus(AuctionStatus.PENDING);
        List<UserAccount> allUsersById = userAccountRepository.findAllById(auctionDTO.getSellerId());
        if (allUsersById.size() == 1) {
            auction.setSeller(allUsersById.get(0));
        } else {
            auction.setSeller(new UserAccount());
        }
        List<Category> allCategoryById = categoryRepository.findAllById(auctionDTO.getCategoryId());
        if (allCategoryById.size() == 1) {
            auction.setCategory(allCategoryById.get(0));
        } else {
            auction.setCategory(new Category());
        }
        return auctionRepository.save(auction).getId();
    }

    public void buyAuctionByUser(String auctionId) {
        List<Auction> allById = auctionRepository.findAllById(Long.valueOf(auctionId));
        if (allById.size()==1) {
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
}
