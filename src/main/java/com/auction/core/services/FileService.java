package com.auction.core.services;

import com.auction.data.model.FileEntity;
import com.auction.data.model.UserAccount;
import com.auction.data.repositories.FileRepository;
import com.auction.data.repositories.UserAccountRepository;
import com.auction.dto.FileDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Optional;
import java.util.Random;

import static org.springframework.security.core.context.SecurityContextHolder.getContext;

@Service
@Transactional
public class FileService {
    @Autowired
    private FileRepository fileRepository;
    @Autowired
    private UserAccountRepository userAccountRepository;

    private static String uploadFolder = "C:\\auction\\";

    public boolean saveFileToUser(FileDTO fileDTO) throws IOException {
        Random random = new Random();
        String fileDst = Integer.toHexString(random.nextInt(256))
                + "\\" + Integer.toHexString(random.nextInt(256)) + "\\";
        if (writeBytesToFile(fileDTO.getData(), uploadFolder + fileDst, fileDTO.getFileName())) {
            FileEntity file = new FileEntity();
            file.setFileType(fileDTO.getContentType());
            file.setPath(fileDst + fileDTO.getFileName());
            Optional<UserAccount> userOpt = userAccountRepository
                    .getOneByLogin(getContext().getAuthentication().getName());
            if (userOpt.isPresent()) {
                UserAccount user = userOpt.get();
              /* TODO wyrzucać potem te zdjęcia ?
              if (user.getAvatar()!=null) {
                    FileEntity fileToDelete = user.getAvatar();
                    removeFile(fileToDelete.getPath());
                    fileRepository.delete(fileToDelete);
                }*/
                fileRepository.save(file);
                user.setAvatar(file);
                userAccountRepository.save(user);
                return true;
            }
        }
        return false;
    }

    private boolean writeBytesToFile(byte[] byteData, String fileDst, String fileName) throws IOException {
        File dir = new File(fileDst);
        if (!dir.exists()) {
            if (!dir.mkdirs()) {
                return false;
            }
        }
        if (dir.exists()) {
            FileOutputStream fileOutputStream =
                    new FileOutputStream(dir.getAbsolutePath() + "\\" + fileName);
            fileOutputStream.write(byteData);
            return true;
        }
        return false;
    }

    public FileDTO getFileById(Long pictureId) {
        FileEntity fileEntity = fileRepository.getOne(pictureId);
        FileDTO fileDTO = new FileDTO();
        fileDTO.setContentType(fileEntity.getFileType());
        String[] split = fileEntity.getPath().split("/");
        if (split.length != 0)
            fileDTO.setFileName(split[split.length - 1]);
        else
            fileDTO.setFileName("");

        File file = new File(uploadFolder + fileEntity.getPath());
        byte[] bArray;
        if (file.exists()) {
            bArray = readFileToByteArray(file);
        } else {
            bArray = new byte[]{};
        }
        fileDTO.setData(bArray);
        return fileDTO;
    }



    private static byte[] readFileToByteArray(File file) {
        FileInputStream fis = null;
        // Creating a byte array using the length of the file
        // file.length returns long which is cast to int
        byte[] bArray = new byte[(int) file.length()];
        try {
            fis = new FileInputStream(file);
            fis.read(bArray);
            fis.close();

        } catch (IOException ioExp) {
            ioExp.printStackTrace();
        }
        return bArray;
    }

}
