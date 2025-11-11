package User_Servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import utils.DBConnection;

public class ActivityServlet extends HttpServlet {

    // Display activities
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<String[]> availableActivities = new ArrayList<>();
        List<String[]> inProgressActivities = new ArrayList<>();
        List<String[]> completedActivities = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {

            // Fetch all activities of the user
            String query = "SELECT a.id AS activity_record_id, a.activity_id, a.status, a.start_date, a.last_update, a.progress_percentage, a.notes, " +
                           "m.activity_name, m.points, m.description, m.duration_days " +
                           "FROM activities a JOIN master_activities m ON a.activity_id = m.id WHERE a.user_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int activityId = rs.getInt("activity_id");
                String status = rs.getString("status");
                java.sql.Date startDate = rs.getDate("start_date");
                java.sql.Date lastUpdate = rs.getDate("last_update");
                int progress = rs.getInt("progress_percentage");
                int durationDays = rs.getInt("duration_days");

                String[] activityData = new String[11];
                activityData[0] = String.valueOf(activityId);
                activityData[1] = rs.getString("activity_name");
                activityData[2] = rs.getString("description");
                activityData[3] = String.valueOf(rs.getInt("points"));
                activityData[4] = status;
                activityData[5] = startDate != null ? startDate.toString() : "";
                activityData[6] = lastUpdate != null ? lastUpdate.toString() : "";
                activityData[7] = String.valueOf(progress);
                activityData[8] = String.valueOf(durationDays);
                activityData[9] = String.valueOf(rs.getInt("activity_record_id"));
                activityData[10] = rs.getString("notes") != null ? rs.getString("notes") : "";

                // Auto-update progress and completion
                if (status.equals("In Progress") && startDate != null) {
                    long daysElapsed = ChronoUnit.DAYS.between(startDate.toLocalDate(), LocalDate.now());
                    int calculatedProgress = (int) ((daysElapsed * 100) / durationDays);

                    if (calculatedProgress >= 100) {
                        // Complete activity
                        String update = "UPDATE activities SET status='Completed', completed_at=?, progress_percentage=100 WHERE id=?";
                        PreparedStatement psUpdate = con.prepareStatement(update);
                        psUpdate.setDate(1, java.sql.Date.valueOf(LocalDate.now()));
                        psUpdate.setInt(2, rs.getInt("activity_record_id"));
                        psUpdate.executeUpdate();

                        activityData[4] = "Completed";
                        activityData[7] = "100";
                        completedActivities.add(activityData);
                        continue;
                    } else {
                        // Update progress
                        String update = "UPDATE activities SET progress_percentage=?, last_update=? WHERE id=?";
                        PreparedStatement psUpdate = con.prepareStatement(update);
                        psUpdate.setInt(1, calculatedProgress);
                        psUpdate.setDate(2, java.sql.Date.valueOf(LocalDate.now()));
                        psUpdate.setInt(3, rs.getInt("activity_record_id"));
                        psUpdate.executeUpdate();
                        activityData[7] = String.valueOf(calculatedProgress);
                        inProgressActivities.add(activityData);
                        continue;
                    }
                }

                if (status.equals("Completed")) {
                    completedActivities.add(activityData);
                } else if (status.equals("In Progress")) {
                    inProgressActivities.add(activityData);
                }
            }

            // Activities not started by user
            String notStartedQuery = "SELECT id, activity_name, description, points, duration_days " +
                    "FROM master_activities WHERE id NOT IN (SELECT activity_id FROM activities WHERE user_id=?)";
            PreparedStatement ps2 = con.prepareStatement(notStartedQuery);
            ps2.setInt(1, userId);
            ResultSet rs2 = ps2.executeQuery();
            while (rs2.next()) {
                String[] activityData = new String[5];
                activityData[0] = String.valueOf(rs2.getInt("id"));
                activityData[1] = rs2.getString("activity_name");
                activityData[2] = rs2.getString("description");
                activityData[3] = String.valueOf(rs2.getInt("points"));
                activityData[4] = String.valueOf(rs2.getInt("duration_days"));
                availableActivities.add(activityData);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("availableActivities", availableActivities);
        request.setAttribute("inProgressActivities", inProgressActivities);
        request.setAttribute("completedActivities", completedActivities);

        RequestDispatcher rd = request.getRequestDispatcher("/user/activities.jsp");
        rd.forward(request, response);
    }

    // Handle Start / Complete / Save Notes actions
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        int activityId = Integer.parseInt(request.getParameter("activityId"));
        String notes = request.getParameter("notes");

        try (Connection con = DBConnection.getConnection()) {

            if ("start".equals(action)) {
                String insert = "INSERT INTO activities(user_id, activity_id, status, start_date, last_update, progress_percentage, notes) " +
                        "VALUES (?, ?, 'In Progress', ?, ?, 0, ?)";
                PreparedStatement ps = con.prepareStatement(insert);
                ps.setInt(1, userId);
                ps.setInt(2, activityId);
                java.sql.Date today = java.sql.Date.valueOf(LocalDate.now());
                ps.setDate(3, today);
                ps.setDate(4, today);
                ps.setString(5, notes != null ? notes : "");
                ps.executeUpdate();
            } else if ("complete".equals(action)) {
                String update = "UPDATE activities SET status='Completed', completed_at=?, progress_percentage=100, notes=? WHERE user_id=? AND activity_id=?";
                PreparedStatement ps = con.prepareStatement(update);
                ps.setDate(1, java.sql.Date.valueOf(LocalDate.now()));
                ps.setString(2, notes != null ? notes : "");
                ps.setInt(3, userId);
                ps.setInt(4, activityId);
                ps.executeUpdate();
            } else if ("saveNotes".equals(action)) {
                String update = "UPDATE activities SET notes=? WHERE user_id=? AND activity_id=?";
                PreparedStatement ps = con.prepareStatement(update);
                ps.setString(1, notes != null ? notes : "");
                ps.setInt(2, userId);
                ps.setInt(3, activityId);
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("ActivityServlet");
    }
}
