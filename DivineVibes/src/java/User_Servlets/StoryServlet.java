package User_Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.DBConnection;

public class StoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String storyId = request.getParameter("id");
        String myStories = request.getParameter("my");

        // Logged-in user ID (should be stored in session after login)
        Integer userId = (Integer) request.getSession().getAttribute("userId");

        // ----------------------------------------------------------------
        // 1️⃣  SHOW SINGLE STORY IF "id" IS PRESENT
        // ----------------------------------------------------------------
        if (storyId != null) {
            try (Connection con = DBConnection.getConnection()) {
                String query = "SELECT id, title, content, author, created_at FROM stories WHERE id=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, storyId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    request.setAttribute("storyId", rs.getString("id"));
                    request.setAttribute("title", rs.getString("title"));
                    request.setAttribute("content", rs.getString("content"));
                    request.setAttribute("author", rs.getString("author"));
                    request.setAttribute("created_at", rs.getString("created_at"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            RequestDispatcher rd = request.getRequestDispatcher("/user/story-view.jsp");
            rd.forward(request, response);
            return;  // Important
        }

        // ----------------------------------------------------------------
        // 2️⃣  SHOW ONLY MY STORIES IF "?my=1"
        // ----------------------------------------------------------------
        if ("1".equals(myStories) && userId != null) {

            List<String[]> stories = new ArrayList<>();

            try (Connection con = DBConnection.getConnection()) {
                String query = "SELECT id, title, content, author, created_at FROM stories WHERE user_id=? ORDER BY created_at DESC";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String[] story = new String[5];
                    story[0] = rs.getString("id");
                    story[1] = rs.getString("title");
                    story[2] = rs.getString("content");
                    story[3] = rs.getString("author");
                    story[4] = rs.getString("created_at");
                    stories.add(story);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

            request.setAttribute("stories", stories);
            RequestDispatcher rd = request.getRequestDispatcher("/user/my-stories.jsp");
            rd.forward(request, response);
            return;
        }

        // ----------------------------------------------------------------
        // 3️⃣  DEFAULT → SHOW ALL STORIES
        // ----------------------------------------------------------------
        List<String[]> stories = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String query = "SELECT id, title, content, author, created_at FROM stories ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] story = new String[5];
                story[0] = rs.getString("id");
                story[1] = rs.getString("title");
                story[2] = rs.getString("content");
                story[3] = rs.getString("author");
                story[4] = rs.getString("created_at");
                stories.add(story);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("stories", stories);
        RequestDispatcher rd = request.getRequestDispatcher("/user/stories.jsp");
        rd.forward(request, response);
    }
}
