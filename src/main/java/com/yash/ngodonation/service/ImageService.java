package com.yash.ngodonation.service;

import com.yash.ngodonation.dao.ImageDao;
import com.yash.ngodonation.domain.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ImageService {

    @Autowired
    private ImageDao imageDao;

    public void saveImage(Image image) {
        imageDao.saveImage(image);
    }

    public Image getImage(Long id) {
        return imageDao.getImage(id);
    }
}