package Admin_Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import utils.DBConnection;

public class AdminRoadmapServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            listRoadmaps(request, response);
        } else if (action.equals("add")) {
            addRoadmap(request, response);
        } else if (action.equals("edit")) {
            loadSingleRoadmap(request, response);
        } else if (action.equals("delete")) {
            deleteRoadmap(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addRoadmap(request, response);
        } else if ("update".equals(action)) {
            updateRoadmap(request, response);
        }
    }

    // =========================== LIST ROADMAPS ===========================
    private void listRoadmaps(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, String>> roadmaps = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM roadmaps ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> r = new HashMap<>();
                r.put("roadmap_id", rs.getString("roadmap_id"));
                r.put("title", rs.getString("title"));
                r.put("short_desc", rs.getString("short_desc"));
                r.put("full_desc", rs.getString("full_desc"));
                r.put("total_days", rs.getString("total_days"));
                roadmaps.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("roadmaps", roadmaps);
        request.getRequestDispatcher("/admin/manageRoadmaps.jsp").forward(request, response);
    }

    // =========================== ADD ROADMAP ===========================
    private void addRoadmap(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!"POST".equalsIgnoreCase(request.getMethod())) {
            request.getRequestDispatcher("/admin/addRoadmaps.jsp").forward(request, response);
            return;
        }

        String title = request.getParameter("title");
        String short_desc = request.getParameter("short_desc");
        String full_desc = request.getParameter("full_desc");
        String total_days = request.getParameter("total_days");

        boolean hasError = false;

        String titleError = "";
        String shortDescError = "";
        String fullDescError = "";
        String totalDaysError = "";

        if (title == null || title.trim().length() < 3) {
            titleError = "Title must be at least 3 characters!";
            hasError = true;
        }

        if (short_desc == null || short_desc.trim().isEmpty()) {
            shortDescError = "Short description is required!";
            hasError = true;
        }

        if (full_desc == null || full_desc.trim().isEmpty()) {
            fullDescError = "Full description cannot be empty!";
            hasError = true;
        }

        int days = 0;
        try {
            days = Integer.parseInt(total_days);
            if (days < 1) {
                totalDaysError = "Total days must be at least 1!";
                hasError = true;
            }
        } catch (Exception e) {
            totalDaysError = "Enter a valid number!";
            hasError = true;
        }

        if (hasError) {
            request.setAttribute("title", title);
            request.setAttribute("short_desc", short_desc);
            request.setAttribute("full_desc", full_desc);
            request.setAttribute("total_days", total_days);

            request.setAttribute("titleError", titleError);
            request.setAttribute("shortDescError", shortDescError);
            request.setAttribute("fullDescError", fullDescError);
            request.setAttribute("totalDaysError", totalDaysError);

            request.getRequestDispatcher("/admin/addRoadmaps.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO roadmaps (title, short_desc, full_desc, total_days) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, short_desc);
            ps.setString(3, full_desc);
            ps.setInt(4, days);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "Roadmap added successfully!");
        response.sendRedirect(request.getContextPath() + "/AdminManageRoadmapServlet?action=list");
    }

    // =========================== DELETE ROADMAP ===========================
    private void deleteRoadmap(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("roadmap_id");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM roadmaps WHERE roadmap_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "Roadmap deleted successfully!");
        response.sendRedirect(request.getContextPath() + "/AdminManageRoadmapServlet?action=list");
    }

    // =========================== LOAD SINGLE ROADMAP ===========================
    private void loadSingleRoadmap(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("roadmap_id");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM roadmaps WHERE roadmap_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("roadmap_id", rs.getString("roadmap_id"));
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("short_desc", rs.getString("short_desc"));
                request.setAttribute("full_desc", rs.getString("full_desc"));
                request.setAttribute("total_days", rs.getString("total_days"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/admin/editRoadmaps.jsp").forward(request, response);
    }

    // =========================== UPDATE ROADMAP ===========================
    private void updateRoadmap(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("roadmap_id");
        String title = request.getParameter("title");
        String short_desc = request.getParameter("short_desc");
        String full_desc = request.getParameter("full_desc");
        String total_days = request.getParameter("total_days");

        boolean hasError = false;

        String titleError = "";
        String shortDescError = "";
        String fullDescError = "";
        String totalDaysError = "";

        if (title == null || title.trim().length() < 3) {
            titleError = "Title must be at least 3 characters!";
            hasError = true;
        }

        if (short_desc == null || short_desc.trim().isEmpty()) {
            shortDescError = "Short description is required!";
            hasError = true;
        }

        if (full_desc == null || full_desc.trim().isEmpty()) {
            fullDescError = "Full description cannot be empty!";
            hasError = true;
        }

        int days = 0;
        try {
            days = Integer.parseInt(total_days);
            if (days < 1) {
                totalDaysError = "Total days must be at least 1!";
                hasError = true;
            }
        } catch (Exception e) {
            totalDaysError = "Enter a valid number!";
            hasError = true;
        }

        if (hasError) {

            request.setAttribute("roadmap_id", id);
            request.setAttribute("title", title);
            request.setAttribute("short_desc", short_desc);
            request.setAttribute("full_desc", full_desc);
            request.setAttribute("total_days", total_days);

            request.setAttribute("titleError", titleError);
            request.setAttribute("shortDescError", shortDescError);
            request.setAttribute("fullDescError", fullDescError);
            request.setAttribute("totalDaysError", totalDaysError);

            request.getRequestDispatcher("/admin/editRoadmaps.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE roadmaps SET title=?, short_desc=?, full_desc=?, total_days=? WHERE roadmap_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, short_desc);
            ps.setString(3, full_desc);
            ps.setInt(4, days);
            ps.setString(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "Roadmap updated successfully!");
        response.sendRedirect(request.getContextPath() + "/AdminManageRoadmapServlet?action=list");
    }
}
