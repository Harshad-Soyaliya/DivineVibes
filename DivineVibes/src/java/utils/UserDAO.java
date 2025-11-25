package utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

public class UserDAO {

    public static boolean registerUser(String name, String email, String password) {

        boolean isRegistered = false;

        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO users(name, email, password) VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, password); // ❗ temporarily storing raw. You can hash later.

            int rows = ps.executeUpdate();
            isRegistered = rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isRegistered;
    }

    public static boolean checkEmailExists(String email) {
        try (Connection con = DBConnection.getConnection()) {

            String query = "SELECT id FROM users WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            return rs.next(); // if exists return true

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    
    public static Map<String, Object> authenticateUser(String email, String password) {
    Map<String, Object> userData = null;

    try {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
                "SELECT id, name, karma_points FROM users WHERE email=? AND password=?"
        );
        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            userData = new HashMap<>();
            userData.put("id", rs.getInt("id"));
            userData.put("name", rs.getString("name"));
            userData.put("karma_points", rs.getInt("karma_points"));
        }

        con.close();

    } catch (Exception e) {
        e.printStackTrace();
    }

    return userData;
}


}
