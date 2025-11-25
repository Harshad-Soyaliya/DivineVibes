package utils;

import java.sql.*;
import java.util.HashMap;
import java.util.Map;

public class AdminDAO {

    public static Map<String, Object> authenticateAdmin(String email, String password) {
        Map<String, Object> adminData = null;

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            
            con = DBConnection.getConnection();

            String sql = "SELECT id, name, role FROM admins WHERE email=? AND password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();

            if (rs.next()) {
                adminData = new HashMap<>();
                adminData.put("id", rs.getInt("id"));
                adminData.put("name", rs.getString("name"));
                adminData.put("role", rs.getString("role"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        return adminData; 
    }
}
