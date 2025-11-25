package Admin_Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import utils.DBConnection;
import java.util.regex.Pattern;

public class AdminBhajanServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null || action.equals("list")) {
            listBhajans(request, response);
        } else if (action.equals("edit")) {
            loadSingleBhajan(request, response);
        } else if (action.equals("delete")) {
            deleteBhajan(request, response);
        } else if (action.equals("add")) {
            addBhajan(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("add".equals(action)) {
            addBhajan(request, response);
        } else if ("update".equals(action)) {
            updateBhajan(request, response);
        }
    }

    private void listBhajans(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, String>> bhajans = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM bhajans ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> b = new HashMap<>();
                b.put("id", rs.getString("id"));
                b.put("title", rs.getString("title"));
                b.put("youtube_url", rs.getString("youtube_url"));
                b.put("description", rs.getString("description"));
                bhajans.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("bhajans", bhajans);
        request.getRequestDispatcher("/admin/manageBhajans.jsp").forward(request, response);
    }

    private void addBhajan(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String youtube_url = request.getParameter("youtube_url");
        String description = request.getParameter("description");

        boolean hasError = false;

        String titleError = "";
        String youtubeError = "";
        String descriptionError = "";

        if (title == null || title.trim().length() < 3) {
            titleError = "Title must be at least 3 characters!";
            hasError = true;
        }
        if (youtube_url == null || youtube_url.trim().isEmpty()) {
            youtubeError = "YouTube URL is required!";
            hasError = true;
        } else {
            String pattern = "^(https?://)?(www\\.)?(youtube\\.com|youtu\\.be).*$";
            Pattern compiledPattern = Pattern.compile(pattern, Pattern.CASE_INSENSITIVE);
            if (!compiledPattern.matcher(youtube_url.trim()).matches()) {
                youtubeError = "Invalid YouTube URL!";
                hasError = true;
            }
        }

        // Fixed: Check for null or empty description
        if (description == null || description.trim().isEmpty()) {
            descriptionError = "Please Enter Description";
            hasError = true;
        }

        if (hasError) {
            request.setAttribute("title", title);
            request.setAttribute("youtube_url", youtube_url);
            request.setAttribute("description", description);
            request.setAttribute("titleError", titleError);
            request.setAttribute("youtubeError", youtubeError);
            request.setAttribute("descriptionError", descriptionError);
            request.getRequestDispatcher("/admin/addBhajans.jsp").forward(request, response);
            return;
        }

        // Insert into DB if no errors
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO bhajans (title, youtube_url, description) VALUES (?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, youtube_url);
            ps.setString(3, description);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "Bhajan added successfully!");
        response.sendRedirect(request.getContextPath() + "/AdminManageBhajanServlet?action=list");
    }

    private void deleteBhajan(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");
        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM bhajans WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "Bhajan deleted successfully!");
        response.sendRedirect(request.getContextPath() + "/AdminManageBhajanServlet?action=list");
    }

    private void loadSingleBhajan(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM bhajans WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("bhajanId", rs.getString("id"));
                request.setAttribute("title", rs.getString("title"));
                request.setAttribute("youtube_url", rs.getString("youtube_url"));
                request.setAttribute("description", rs.getString("description"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("/admin/editBhajans.jsp").forward(request, response);
    }

    private void updateBhajan(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("bhajanId");
        String title = request.getParameter("title");
        String youtube_url = request.getParameter("youtube_url");
        String description = request.getParameter("description");

        boolean hasError = false;

        String titleError = "";
        String youtubeError = "";
        String descriptionError = "";

        // ---- Title Validation ----
        if (title == null || title.trim().length() < 3) {
            titleError = "Title must be at least 3 characters!";
            hasError = true;
        }

        // ---- YouTube URL Validation ----
        if (youtube_url == null || youtube_url.trim().isEmpty()) {
            youtubeError = "YouTube URL is required!";
            hasError = true;
        } else {
            String pattern = "^(https?://)?(www\\.)?(youtube\\.com|youtu\\.be).*$";
            Pattern compiledPattern = Pattern.compile(pattern, Pattern.CASE_INSENSITIVE);
            if (!compiledPattern.matcher(youtube_url.trim()).matches()) {
                youtubeError = "Invalid YouTube URL!";
                hasError = true;
            }
        }

        // ---- Description Validation ----
        if (description == null || description.trim().isEmpty()) {
            descriptionError = "Please enter description!";
            hasError = true;
        }

        // ---- If validation fails, return back to edit page ----
        if (hasError) {

            request.setAttribute("bhajanId", id);
            request.setAttribute("title", title);
            request.setAttribute("youtube_url", youtube_url);
            request.setAttribute("description", description);

            request.setAttribute("titleError", titleError);
            request.setAttribute("youtubeError", youtubeError);
            request.setAttribute("descriptionError", descriptionError);

            request.getRequestDispatcher("/admin/editBhajans.jsp").forward(request, response);
            return;
        }

        // ---- If no error → Update in DB ----
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE bhajans SET title=?, youtube_url=?, description=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, youtube_url);
            ps.setString(3, description);
            ps.setString(4, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "Bhajan updated successfully!");
        response.sendRedirect(request.getContextPath() + "/AdminManageBhajanServlet?action=list");
    }
}  

