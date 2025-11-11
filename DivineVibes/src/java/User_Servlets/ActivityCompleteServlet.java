package User_Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import utils.DBConnection;

public class ActivityCompleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        String key = request.getParameter("key");

        if (userId == null || key == null) {
            response.sendRedirect("activities.jsp");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            // Check previous completion for streak
            String streakQuery = "SELECT completed_at, streak_count FROM activities " +
                    "WHERE user_id=? AND activity_key=? ORDER BY completed_at DESC LIMIT 1";
            PreparedStatement ps = con.prepareStatement(streakQuery);
            ps.setInt(1, userId);
            ps.setString(2, key);
            ResultSet rs = ps.executeQuery();

            int newStreak = 1;
            if (rs.next()) {
                Timestamp lastCompleted = rs.getTimestamp("completed_at");
                int prevStreak = rs.getInt("streak_count");

                if (lastCompleted != null) {
                    LocalDate lastDate = lastCompleted.toLocalDateTime().toLocalDate();
                    LocalDate today = LocalDate.now();

                    long daysDiff = ChronoUnit.DAYS.between(lastDate, today);
                    if (daysDiff == 1) {
                        newStreak = prevStreak + 1;
                    }
                }
            }

            // Insert or update activity as completed
            String insertQuery = "INSERT INTO activities(user_id, activity_key, activity_name, points, status, completed_at, streak_count) " +
                    "SELECT ?, activity_key, activity_name, points, 'completed', NOW(), ? FROM master_activities WHERE activity_key=? " +
                    "ON DUPLICATE KEY UPDATE status='completed', completed_at=NOW(), streak_count=?";
            PreparedStatement insertPs = con.prepareStatement(insertQuery);
            insertPs.setInt(1, userId);
            insertPs.setInt(2, newStreak);
            insertPs.setString(3, key);
            insertPs.setInt(4, newStreak);
            insertPs.executeUpdate();

            // Update karma points
            String updateKarma = "UPDATE users u JOIN master_activities m ON m.activity_key=? " +
                    "SET u.karma_points = u.karma_points + m.points WHERE u.id=?";
            PreparedStatement karmaPs = con.prepareStatement(updateKarma);
            karmaPs.setString(1, key);
            karmaPs.setInt(2, userId);
            karmaPs.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("activities.jsp");
    }
}
