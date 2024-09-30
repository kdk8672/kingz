package com.yedam.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ImageDAO {
	
	private Connection connection;

    public ImageDAO(Connection connection) {
        this.connection = connection;
    }
	
	public List<String> getImagesByReviewId(int reviewId) {
        List<String> imageUrls = new ArrayList<>();
        String query = "SELECT imageUrl FROM ReviewImages WHERE reviewId = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, reviewId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                imageUrls.add(rs.getString("imageUrl"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return imageUrls;
    }

}
