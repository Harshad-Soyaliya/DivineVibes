package User_Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import utils.DBConnection;

public class BhajanServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("BhajanServlet called..."); // check servlet is called

        List<String[]> bhajans = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            if (con == null) {
                System.out.println("DB Connection is null!");
            } else {
                System.out.println("DB Connected successfully.");
            }

            String query = "SELECT id, title, youtube_url, description FROM bhajans ORDER BY created_at DESC";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String[] b = new String[4];
                b[0] = rs.getString("id");
                b[1] = rs.getString("title");
                b[2] = rs.getString("youtube_url");
                b[3] = rs.getString("description");
                bhajans.add(b);
                System.out.println("Fetched bhajan: " + b[1]);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Total bhajans fetched: " + bhajans.size());
        request.setAttribute("bhajans", bhajans);
        RequestDispatcher rd = request.getRequestDispatcher("/user/bhajans.jsp");
        rd.forward(request, response);
    }
}
