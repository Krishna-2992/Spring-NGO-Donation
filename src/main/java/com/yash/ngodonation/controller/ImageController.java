package com.yash.ngodonation.controller;

import com.yash.ngodonation.domain.Image;
import com.yash.ngodonation.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.sql.rowset.serial.SerialBlob;
import java.io.IOException;
import java.sql.SQLException;

@Controller
public class ImageController {

    @Autowired
    private ImageService imageService;

    @PostMapping("/uploadImage")
    public String handleImageUpload(@RequestParam("file") MultipartFile file) {
        try {
            Image image = new Image();
            image.setName(file.getOriginalFilename());
            image.setContentType(file.getContentType());
            image.setData(new SerialBlob(file.getBytes()));

            imageService.saveImage(image);

            return "redirect:/success";
        } catch (IOException | SQLException e) {
            e.printStackTrace();
            return "redirect:/error";
        }
    }
}
