package User_Servlets;

import utils.RoadmapDAO;
import model.Roadmap;
import model.RoadmapTemplateItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/roadmap/details")
public class RoadmapDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr == null) {
            resp.sendRedirect(req.getContextPath() + "/roadmaps");
            return;
        }
        try {
            int id = Integer.parseInt(idStr);
            RoadmapDAO dao = new RoadmapDAO();
            Roadmap r = dao.getById(id);
            if (r == null) {
                resp.sendRedirect(req.getContextPath() + "/roadmaps");
                return;
            }
            List<RoadmapTemplateItem> template = dao.getTemplate(id);
            req.setAttribute("roadmap", r);
            req.setAttribute("template", template);
            req.getRequestDispatcher("/user/roadmap_details.jsp").forward(req, resp);
        } catch (SQLException | NumberFormatException e) {
            throw new ServletException(e);
        }
    }
}
