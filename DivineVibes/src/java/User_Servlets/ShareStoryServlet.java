package User_Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import utils.DBConnection;

public class ShareStoryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String content = request.getParameter("content");

        // Fetch logged-in user ID from session
        Integer userId = (Integer) request.getSession().getAttribute("userId");

        try (Connection con = DBConnection.getConnection()) {

            String query = "INSERT INTO stories (title, content, author, user_id) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, author);
            ps.setInt(4, userId);

            ps.executeUpdate();

            response.sendRedirect("./user/StoryServlet");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error: " + e.getMessage());
        }
    }
}
