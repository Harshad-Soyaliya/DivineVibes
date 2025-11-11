package User_Servlets;

import utils.UserDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pwd = request.getParameter("password");

        // ===== SERVER-SIDE VALIDATION =====
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email is required.");
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
            return;
        }

        if (pwd == null || pwd.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Password is required.");
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
            return;
        }

        // ✅ authenticateUser now returns full user data (id, name, karma_points)
        Map<String, Object> userData = UserDAO.authenticateUser(email, pwd);

        if (userData != null) {
            HttpSession session = request.getSession();

            session.setAttribute("userId", userData.get("id"));
            session.setAttribute("name", userData.get("name"));        // ✅ required in header.jsp
            session.setAttribute("karmaPoints", userData.get("karma_points"));

            // redirect to dashboard
            response.sendRedirect(request.getContextPath() + "/user/dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid Credentials. Try again.");
            request.getRequestDispatcher("/user/login.jsp").forward(request, response);
        }
    }
}
