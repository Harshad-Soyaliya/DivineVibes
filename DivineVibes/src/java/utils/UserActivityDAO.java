package utils;

import model.UserActivity;

import java.sql.*;
import java.time.LocalDate;

public class UserActivityDAO {

    public UserActivity getActivityForUserAndDate(int userId, int roadmapId, LocalDate date) throws SQLException {
        String sql = "SELECT ua.*, e.enrollment_id FROM user_activities ua JOIN enrollments e ON ua.enrollment_id = e.enrollment_id WHERE ua.user_id = ? AND ua.roadmap_id = ? AND ua.scheduled_date = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, roadmapId);
            ps.setDate(3, Date.valueOf(date));
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    UserActivity ua = new UserActivity();
                    ua.setUserActivityId(rs.getInt("user_activity_id"));
                    ua.setEnrollmentId(rs.getInt("enrollment_id"));
                    ua.setRoadmapId(rs.getInt("roadmap_id"));
                    ua.setUserId(rs.getInt("user_id"));
                    ua.setDayNumber(rs.getInt("day_number"));
                    ua.setStatus(rs.getString("status"));
                    ua.setScheduledDate(rs.getDate("scheduled_date").toLocalDate());
                    ua.setSubmittedAt(rs.getTimestamp("submitted_at"));
                    return ua;
                }
            }
        }
        return null;
    }

    public void createActivity(int enrollmentId, int userId, int roadmapId, int dayNumber, LocalDate scheduledDate) throws SQLException {
        String sql = "INSERT IGNORE INTO user_activities (enrollment_id, roadmap_id, user_id, day_number, scheduled_date, status) VALUES (?, ?, ?, ?, ?, 'pending')";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, enrollmentId);
            ps.setInt(2, roadmapId);
            ps.setInt(3, userId);
            ps.setInt(4, dayNumber);
            ps.setDate(5, Date.valueOf(scheduledDate));
            ps.executeUpdate();
        }
    }

    public void markCompleted(int userActivityId) throws SQLException {
        String sql = "UPDATE user_activities SET status = 'completed', submitted_at = NOW() WHERE user_activity_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userActivityId);
            ps.executeUpdate();
        }
    }

    public void markMissedIfPastDue(LocalDate today) throws SQLException {
        String sql = "UPDATE user_activities SET status='missed' WHERE scheduled_date < ? AND status IN ('pending','upcoming')";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setDate(1, Date.valueOf(today));
            ps.executeUpdate();
        }
    }
}
