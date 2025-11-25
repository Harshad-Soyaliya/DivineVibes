package User_Servlets;

import utils.EnrollmentDAO;
import utils.RoadmapDAO;
import model.Enrollment;
import model.Roadmap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/myroadmaps")
public class MyRoadmapsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId = (Integer) req.getSession().getAttribute("userId");
        if (userId == null) {
            resp.sendRedirect(req.getContextPath() + "/user/login.jsp");
            return;
        }
        EnrollmentDAO ed = new EnrollmentDAO();
        RoadmapDAO rd = new RoadmapDAO();
        try {
            List<Enrollment> enrollments = ed.getUserEnrollments(userId);
            // We also want to show roadmap title for each; build a small list of pairs
            List<Roadmap> roadmapList = new ArrayList<>();
            for (Enrollment e : enrollments) {
                Roadmap r = rd.getById(e.getRoadmapId());
                roadmapList.add(r);
            }
            req.setAttribute("enrollments", enrollments);
            req.setAttribute("roadmaps", roadmapList);
            req.getRequestDispatcher("/user/enrolled.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
