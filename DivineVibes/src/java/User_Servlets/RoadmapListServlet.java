package User_Servlets;

import utils.RoadmapDAO;
import model.Roadmap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/roadmaps")
public class RoadmapListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            RoadmapDAO dao = new RoadmapDAO();
            List<Roadmap> list = dao.listAll();
            req.setAttribute("roadmaps", list);
            req.getRequestDispatcher("/user/roadmaps.jsp").forward(req, resp);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}
