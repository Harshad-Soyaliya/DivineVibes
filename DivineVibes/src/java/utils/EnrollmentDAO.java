package utils;

import model.Enrollment;

import java.sql.*;
import java.time.LocalDate;

public class EnrollmentDAO {

    public boolean enrollUser(int userId, int roadmapId) throws SQLException {
        String sql = "INSERT INTO enrollments (user_id, roadmap_id) VALUES (?, ?)";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, roadmapId);
            return ps.executeUpdate() == 1;
        } catch (SQLIntegrityConstraintViolationException e) {
            // already enrolled
            return false;
        }
    }

    public Enrollment getEnrollment(int userId, int roadmapId) throws SQLException {
        String sql = "SELECT * FROM enrollments WHERE user_id = ? AND roadmap_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, roadmapId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Enrollment e = new Enrollment();
                    e.setEnrollmentId(rs.getInt("enrollment_id"));
                    e.setUserId(rs.getInt("user_id"));
                    e.setRoadmapId(rs.getInt("roadmap_id"));
                    e.setEnrolledAt(rs.getTimestamp("enrolled_at"));
                    e.setCurrentDay(rs.getInt("current_day"));
                    e.setStreak(rs.getInt("streak"));
                    e.setBestStreak(rs.getInt("best_streak"));
                    e.setKarmaPoints(rs.getInt("karma_points"));
                    e.setLastActivityDate(rs.getDate("last_activity_date"));
                    return e;
                }
            }
        }
        return null;
    }

    public java.util.List<Enrollment> getUserEnrollments(int userId) throws SQLException {
        String sql = "SELECT * FROM enrollments WHERE user_id = ? ORDER BY enrolled_at DESC";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                java.util.List<Enrollment> list = new java.util.ArrayList<>();
                while (rs.next()) {
                    Enrollment e = new Enrollment();
                    e.setEnrollmentId(rs.getInt("enrollment_id"));
                    e.setUserId(rs.getInt("user_id"));
                    e.setRoadmapId(rs.getInt("roadmap_id"));
                    e.setEnrolledAt(rs.getTimestamp("enrolled_at"));
                    e.setCurrentDay(rs.getInt("current_day"));
                    e.setStreak(rs.getInt("streak"));
                    e.setBestStreak(rs.getInt("best_streak"));
                    e.setKarmaPoints(rs.getInt("karma_points"));
                    e.setLastActivityDate(rs.getDate("last_activity_date"));
                    list.add(e);
                }
                return list;
            }
        }
    }

    /**
     * Update enrollment after a completion: increments current day, updates streak, best_streak, karma and last_activity_date
     */
    public void markCompletedAndUpdate(int enrollmentId, int userId, int roadmapId, LocalDate completedOn, int karmaGained) throws SQLException {
        try (Connection c = DBConnection.getConnection()) {
            c.setAutoCommit(false);
            try {
                String sel = "SELECT current_day, streak, best_streak, last_activity_date, karma_points FROM enrollments WHERE enrollment_id = ? FOR UPDATE";
                try (PreparedStatement ps = c.prepareStatement(sel)) {
                    ps.setInt(1, enrollmentId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (!rs.next()) throw new SQLException("Enrollment not found");
                        int currentDay = rs.getInt("current_day");
                        int streak = rs.getInt("streak");
                        int best = rs.getInt("best_streak");
                        Date lastDate = rs.getDate("last_activity_date");
                        int karma = rs.getInt("karma_points");

                        java.time.LocalDate last = (lastDate == null) ? null : lastDate.toLocalDate();
                        java.time.LocalDate today = completedOn;

                        if (last != null && last.plusDays(1).equals(today)) {
                            streak = streak + 1;
                        } else {
                            streak = 1;
                        }
                        if (streak > best) best = streak;
                        currentDay = currentDay + 1;
                        karma = karma + karmaGained;

                        String upd = "UPDATE enrollments SET current_day = ?, streak = ?, best_streak = ?, karma_points = ?, last_activity_date = ? WHERE enrollment_id = ?";
                        try (PreparedStatement ups = c.prepareStatement(upd)) {
                            ups.setInt(1, currentDay);
                            ups.setInt(2, streak);
                            ups.setInt(3, best);
                            ups.setInt(4, karma);
                            ups.setDate(5, Date.valueOf(today));
                            ups.setInt(6, enrollmentId);
                            ups.executeUpdate();
                        }
                    }
                }
                c.commit();
            } catch (Exception ex) {
                c.rollback();
                throw ex;
            } finally {
                c.setAutoCommit(true);
            }
        }
    }
}
