package User_Servlets;

import utils.EnrollmentDAO;
import utils.RoadmapDAO;
import utils.UserActivityDAO;
import model.Enrollment;
import model.Roadmap;
import model.RoadmapTemplateItem;
import model.UserActivity;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@WebServlet("/roadmap/activity")
public class ActivityServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.jsp");
            return;
        }
        String roadmapIdStr = req.getParameter("roadmapId");
        if (roadmapIdStr == null) {
            resp.sendRedirect(req.getContextPath() + "/my/roadmaps");
            return;
        }
        try {
            int roadmapId = Integer.parseInt(roadmapIdStr);
            LocalDate today = LocalDate.now(ZoneId.of("Asia/Kolkata"));
            UserActivityDAO uaDao = new UserActivityDAO();
            UserActivity act = uaDao.getActivityForUserAndDate(userId, roadmapId, today);

            // Also fetch roadmap template item for this day to show details
            RoadmapDAO rd = new RoadmapDAO();
            Roadmap r = rd.getById(roadmapId);
            RoadmapTemplateItem todayTemplate = null;
            if (act != null) {
                List<RoadmapTemplateItem> template = rd.getTemplate(roadmapId);
                for (RoadmapTemplateItem t : template) {
                    if (t.getDayNumber() == act.getDayNumber()) {
                        todayTemplate = t;
                        break;
                    }
                }
            }

            req.setAttribute("activity", act);
            req.setAttribute("roadmap", r);
            req.setAttribute("todayTemplate", todayTemplate);
            req.getRequestDispatcher("/user/activity_page.jsp").forward(req, resp);
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException(e);
        }
    }

    // handle submission
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.jsp");
            return;
        }
        try {
            int userActivityId = Integer.parseInt(req.getParameter("userActivityId"));
            int enrollmentId = Integer.parseInt(req.getParameter("enrollmentId"));
            int roadmapId = Integer.parseInt(req.getParameter("roadmapId"));

            UserActivityDAO ua = new UserActivityDAO();
            ua.markCompleted(userActivityId);

            // Update enrollment with karma and streak
            EnrollmentDAO ed = new EnrollmentDAO();
            int karmaGained = 10; // adjustable rule
            ed.markCompletedAndUpdate(enrollmentId, userId, roadmapId, LocalDate.now(ZoneId.of("Asia/Kolkata")), karmaGained);

            resp.sendRedirect(req.getContextPath() + "/myroadmaps");
        } catch (NumberFormatException | SQLException e) {
            throw new ServletException(e);
        }
    }
}
