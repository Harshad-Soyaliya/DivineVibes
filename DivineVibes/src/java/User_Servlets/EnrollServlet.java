package User_Servlets;

import utils.EnrollmentDAO;
import utils.UserActivityDAO;
import model.Enrollment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;

@WebServlet("/roadmap/enroll")
public class EnrollServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        if (userId == null) {
            // redirect to login - adapt path to your app
            resp.sendRedirect(req.getContextPath() + "/user/login.jsp");
            return;
        }
        String roadmapIdStr = req.getParameter("roadmapId");
        if (roadmapIdStr == null) {
            resp.sendRedirect(req.getContextPath() + "/roadmaps");
            return;
        }
        try {
            int roadmapId = Integer.parseInt(roadmapIdStr);
            EnrollmentDAO ed = new EnrollmentDAO();
            boolean ok = ed.enrollUser(userId, roadmapId);

            Enrollment e = ed.getEnrollment(userId, roadmapId);
            if (e != null && e.getCurrentDay() == 0) {
                // Create day 1 activity scheduled today
                UserActivityDAO ua = new UserActivityDAO();
                ua.createActivity(e.getEnrollmentId(), userId, roadmapId, 1, LocalDate.now(ZoneId.of("Asia/Kolkata")));
            }
            resp.sendRedirect(req.getContextPath() + "/myroadmaps");
        } catch (NumberFormatException | SQLException ex) {
            throw new ServletException(ex);
        }
    }
}
