package Admin_Servlets;

import utils.AdminDAO;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email is required.");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            return;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Password is required.");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
            return;
        }

        Map<String, Object> adminData = AdminDAO.authenticateAdmin(email, password);

        if (adminData != null) {
            HttpSession session = request.getSession();
            session.setAttribute("adminId", adminData.get("id"));
            session.setAttribute("adminName", adminData.get("name"));
            session.setAttribute("adminRole", "admin"); 
            response.sendRedirect(request.getContextPath() + "/AdminDashboardServlet");
        } else {
            request.setAttribute("errorMessage", "Invalid Credentials. Try again.");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
    }
    
}
