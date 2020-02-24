package com.auction.mvc.controllers.my;

import com.auction.core.services.FileService;
import com.auction.core.services.UserService;
import com.auction.data.model.UserAccount;
import com.auction.dto.FileDTO;
import com.auction.dto.LoggedUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import javax.validation.Valid;
import java.io.IOException;

@Controller
@RequestMapping("/my-account")
public class MyAccountPageController {

    private UserService userService;
    private FileService fileService;

    @Autowired
    public MyAccountPageController(UserService userService, FileService fileService) {
        this.userService = userService;
        this.fileService = fileService;
    }

    @GetMapping
    public String myAccountPageInit(Model model) {
        String myUsername = SecurityContextHolder.getContext().getAuthentication().getName();
        LoggedUserDTO loggedUserDTO = userService.getUserByLogin(myUsername);
        model.addAttribute("myAccount", loggedUserDTO);
        model.addAttribute("avatarId", userService.getAvatarId());
        return "my-account";
    }

    @PostMapping(params = {"uploadData"})
    public String editAccount(@Valid @ModelAttribute("myAccount") LoggedUserDTO loggedUserDTO) {
        userService.editUser(loggedUserDTO);
        return "redirect:/my-account";
    }

    @PostMapping(params = {"uploadPhoto"})
    public RedirectView uploadProfileFile(@RequestParam MultipartFile file, RedirectAttributes redir) throws IOException {
        RedirectView redirectView = new RedirectView("/my-account", true);
        FileDTO fileDTO = new FileDTO();
        fileDTO.setContentType(file.getContentType());
        fileDTO.setFileName(file.getOriginalFilename());
        fileDTO.setData(file.getBytes());
        try {
            if (!fileService.saveFileToUser(fileDTO)) {
                redir.addFlashAttribute("error", "Dont add");
            }
        } catch (IOException e) {
            e.printStackTrace();
            redir.addFlashAttribute("error", "Dont work");
        }
        return redirectView;
    }


    @RequestMapping(value = "/img/{pictureId}",method = RequestMethod.GET)
    private ResponseEntity<Resource> buildResponseImage(@PathVariable("pictureId") Long pictureId) {
        FileDTO fileDTO = fileService.getFileById(pictureId);
        ByteArrayResource data = getProfileFileData(fileDTO);

        return ResponseEntity
                .ok()
                .contentType(MediaType.valueOf(fileDTO.getContentType()))
                .header("Content-Disposition", String.format("filename=%s", fileDTO.getFileName()))
                .body(data);
    }

    private ByteArrayResource getProfileFileData(FileDTO fileDTO) {
        return new ByteArrayResource(fileDTO.getData());
    }

}
