package Admin_Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import utils.DBConnection;

public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String adminName = (String) session.getAttribute("adminName");

        if (adminName == null) {
            resp.sendRedirect(req.getContextPath() + "/admin/login.jsp");
            return;
        }

        int totalUsers = 0;
        int totalStories = 0;
        int totalBhajans = 0;
        int completedActivities = 0;
        int totalAdmins = 0;

        try (Connection conn = DBConnection.getConnection()) {

            // TOTAL USERS
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM users");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalUsers = rs.getInt(1);
            }

            // TOTAL STORIES
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM stories");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalStories = rs.getInt(1);
            }

            // TOTAL BHAJANS
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM bhajans");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalBhajans = rs.getInt(1);
            }

            // COMPLETED ACTIVITIES
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM activities WHERE status='Completed'");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) completedActivities = rs.getInt(1);
            }

            // TOTAL ADMINS
            try (PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM admins");
                 ResultSet rs = ps.executeQuery()) {
                if (rs.next()) totalAdmins = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // SEND DATA TO JSP
        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("totalStories", totalStories);
        req.setAttribute("totalBhajans", totalBhajans);
        req.setAttribute("completedActivities", completedActivities);
        req.setAttribute("totalAdmins", totalAdmins);

        req.getRequestDispatcher("/admin/dashboard.jsp").forward(req, resp);
    }
}
