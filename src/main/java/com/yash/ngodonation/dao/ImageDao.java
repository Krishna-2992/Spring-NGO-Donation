package com.yash.ngodonation.dao;

import com.yash.ngodonation.domain.Image;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Blob;

@Repository
public class ImageDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public void saveImage(Image image) {
        String sql = "INSERT INTO images (name, content_type, data) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, image.getName(), image.getContentType(), image.getData());
    }

    public Image getImage(Long id) {
        String sql = "SELECT * FROM images WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, (rs, rowNum) -> {
            Image image = new Image();
            image.setId(rs.getLong("id"));
            image.setName(rs.getString("name"));
            image.setContentType(rs.getString("content_type"));
            image.setData(rs.getBlob("data"));
            return image;
        });
    }
}
