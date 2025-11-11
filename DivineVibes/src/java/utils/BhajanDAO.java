package utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BhajanDAO {

    public static List<String[]> getAllBhajans() {
        List<String[]> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT id, title, youtube_url, description FROM bhajans ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] bhajan = new String[4];
                bhajan[0] = rs.getString("id");
                bhajan[1] = rs.getString("title");
                bhajan[2] = rs.getString("youtube_url");
                bhajan[3] = rs.getString("description");
                list.add(bhajan);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
