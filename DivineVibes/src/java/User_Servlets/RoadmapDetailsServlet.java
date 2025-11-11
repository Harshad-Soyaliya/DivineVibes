package User_Servlets;

import utils.RoadmapDAO;
import utils.ActivitiesDAO;
import models.Roadmap;
import models.Activity;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class RoadmapDetailsServlet extends HttpServlet {

    RoadmapDAO roadmapDAO = new RoadmapDAO();
    ActivitiesDAO activitiesDAO = new ActivitiesDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int roadmapId = Integer.parseInt(req.getParameter("id"));

        Roadmap roadmap = roadmapDAO.getRoadmapById(roadmapId);
        List<Activity> activities = activitiesDAO.getActivitiesByRoadmapId(roadmapId);

        req.setAttribute("roadmap", roadmap);
        req.setAttribute("activities", activities);

        RequestDispatcher rd = req.getRequestDispatcher("roadmap_details.jsp");
        rd.forward(req, resp);
    }
}
