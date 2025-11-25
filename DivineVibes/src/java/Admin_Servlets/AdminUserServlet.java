package Admin_Servlets;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import utils.DBConnection;

public class AdminUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null || action.equals("list")) {
            listUsers(request, response);
        } else if (action.equals("edit")) {
            loadSingleUser(request, response);
        } else if (action.equals("delete")) {
            deleteUser(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("update".equals(action)) {
            updateUser(request, response);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Map<String, String>> users = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT id, name, email FROM users";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> user = new HashMap<>();
                user.put("id", rs.getString("id"));
                user.put("name", rs.getString("name"));
                user.put("email", rs.getString("email"));
                users.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("users", users);
        request.getRequestDispatcher("/admin/manageUsers.jsp").forward(request, response);
    }

    private void loadSingleUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT id, name, email FROM users WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("userId", rs.getString("id"));
                request.setAttribute("fullName", rs.getString("name"));
                request.setAttribute("email", rs.getString("email"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("/admin/editUsers.jsp").forward(request, response);
    }

    // ---------------- UPDATE WITH VALIDATION ----------------
    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String id = request.getParameter("userId");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");

        boolean hasError = false;

        String fullNameError = "";
        String emailError = "";
        String karmaError = "";

        if (fullName == null || fullName.trim().length() < 3) {
            fullNameError = "Full name must be at least 3 characters!";
            hasError = true;
        }

        if (email == null || email.trim().isEmpty()) {
            emailError = "Email is required!";
            hasError = true;
        } else {
            String pattern = "^[A-Za-z0-9._-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,4}$";
            if (!email.matches(pattern)) {
                emailError = "Invalid email format!";
                hasError = true;
            }
        }

        if (hasError) {
            request.setAttribute("userId", id);
            request.setAttribute("fullName", fullName);
            request.setAttribute("email", email);

            request.setAttribute("fullNameError", fullNameError);
            request.setAttribute("emailError", emailError);

            request.getRequestDispatcher("/admin/editUsers.jsp").forward(request, response);
            return;
        }

        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE users SET name=?, email=?, karma_points=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "Info Edited successfully!");

        response.sendRedirect(request.getContextPath() + "/AdminManageUserServlet?action=list");
    }

    // ---------------- DELETE USER ----------------
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String id = request.getParameter("id");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "DELETE FROM users WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession();
        session.setAttribute("success", "User deleted successfully!");

        response.sendRedirect(request.getContextPath() + "/AdminManageUserServlet?action=list");

    }
}
