package User_Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ChatbotServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Forward to JSP
        RequestDispatcher rd = request.getRequestDispatcher("/user/chatbot.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/user/login.jsp");
            return;
        }

        String userMessage = request.getParameter("message");
        if (userMessage == null || userMessage.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Please enter a message.");
            RequestDispatcher rd = request.getRequestDispatcher("/user/chatbot.jsp");
            rd.forward(request, response);
            return;
        }

        String botResponse = generateBotResponse(userMessage);

        // Save to database
        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_divinevibes", "root", "");

            String insert = "INSERT INTO chatbot_log(user_id, message, response) VALUES (?, ?, ?)";
            ps = con.prepareStatement(insert);
            ps.setInt(1, userId);
            ps.setString(2, userMessage);
            ps.setString(3, botResponse);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception e) {}
            try { if (con != null) con.close(); } catch(Exception e) {}
        }

        request.setAttribute("userMessage", userMessage);
        request.setAttribute("botResponse", botResponse);

        RequestDispatcher rd = request.getRequestDispatcher("/user/chatbot.jsp");
        rd.forward(request, response);
    }

    private String generateBotResponse(String message) {
        // Simple demo responses
        message = message.toLowerCase();
        if (message.contains("hi") || message.contains("hello")) return "Hello! 🙏 How can I assist you today?";
        if (message.contains("bhajan")) return "You can listen to our beautiful Bhajans in the Bhajans section 🎵.";
        if (message.contains("story")) return "Stories are a great way to feel inspired. Check out the Stories section 📖.";
        if (message.contains("meditation")) return "Meditation helps you feel calm. Try our daily meditation guide 🧘‍♀.";
        return "I am here to guide you spiritually. ✨ Could you please rephrase?";
    }
}