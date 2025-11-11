package User_Servlets;

import utils.UserDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class SignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pwd = request.getParameter("password");

        // ===== SERVER SIDE VALIDATION =====
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Name is required.");
            request.getRequestDispatcher("/user/signup.jsp").forward(request, response);
            return;
        }

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email is required.");
            request.getRequestDispatcher("/user/signup.jsp").forward(request, response);
            return;
        }

        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {
            request.setAttribute("errorMessage", "Invalid email format.");
            request.getRequestDispatcher("/user/signup.jsp").forward(request, response);
            return;
        }

        if (pwd == null || pwd.length() < 6) {
            request.setAttribute("errorMessage", "Password must be at least 6 characters.");
            request.getRequestDispatcher("/user/signup.jsp").forward(request, response);
            return;
        }

        // ===== CHECK EMAIL EXISTS =====
        if (UserDAO.checkEmailExists(email)) {
            request.setAttribute("errorMessage", "Email already exists, try login.");
            request.getRequestDispatcher("/user/signup.jsp").forward(request, response);
            return;
        }

        // ===== REGISTER USER =====
        boolean isRegistered = UserDAO.registerUser(name, email, pwd);

        if (isRegistered) {
            request.setAttribute("successMessage", "Account created successfully! Redirecting to Login...");
            request.getRequestDispatcher("/user/signup.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Something went wrong, try again.");
            request.getRequestDispatcher("/user/signup.jsp").forward(request, response);
        }
    }
}
