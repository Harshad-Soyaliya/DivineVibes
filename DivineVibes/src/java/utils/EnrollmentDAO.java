package utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import models.Enrollment;
import models.Roadmap;
import utils.DBConnection;

public class EnrollmentDAO {

    // ---------------------------------------
    // ENROLL USER INTO A ROADMAP
    // ---------------------------------------
    public boolean enrollUser(int userId, int roadmapId) {

        String query = "INSERT INTO enrollments (user_id, roadmap_id) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, roadmapId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLIntegrityConstraintViolationException e) {
            System.out.println("User already enrolled.");
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ---------------------------------------
    // GET ALL ENROLLED ROADMAPS BY USER
    // ---------------------------------------
    public List<Enrollment> getUserEnrollments(int userId) {

        List<Enrollment> list = new ArrayList<>();

        String query =
                "SELECT e.id, e.user_id, e.roadmap_id, e.progress_percent, e.streak_days, e.last_active, e.status, " +
                "r.title, r.short_description, r.duration_days " +
                "FROM enrollments e " +
                "JOIN roadmaps r ON e.roadmap_id = r.id " +
                "WHERE e.user_id = ? " +
                "ORDER BY e.enrolled_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Enrollment en = new Enrollment(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("roadmap_id"),
                        rs.getInt("progress_percent"),
                        rs.getInt("streak_days"),
                        rs.getDate("last_active"),
                        rs.getString("status"),
                        rs.getString("title"),
                        rs.getString("short_description"),
                        rs.getInt("duration_days")
                );

                list.add(en);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ---------------------------------------
    // GET SINGLE ENROLLMENT DETAILS
    // ---------------------------------------
    public Enrollment getEnrollment(int userId, int roadmapId) {
        String query =
                "SELECT e.id, e.user_id, e.roadmap_id, e.progress_percent, e.streak_days, e.last_active, e.status, " +
                "r.title, r.full_description, r.duration_days " +
                "FROM enrollments e " +
                "JOIN roadmaps r ON e.roadmap_id = r.id " +
                "WHERE e.user_id = ? AND e.roadmap_id = ? LIMIT 1";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, roadmapId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                return new Enrollment(
                        rs.getInt("id"),
                        rs.getInt("user_id"),
                        rs.getInt("roadmap_id"),
                        rs.getInt("progress_percent"),
                        rs.getInt("streak_days"),
                        rs.getDate("last_active"),
                        rs.getString("status"),
                        rs.getString("title"),
                        rs.getString("full_description"),
                        rs.getInt("duration_days")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    // ---------------------------------------
    // UPDATE PROGRESS (0-100%)
    // ---------------------------------------
    public void updateProgress(int userId, int roadmapId, int progressPercent) {

        String query = "UPDATE enrollments SET progress_percent = ? WHERE user_id = ? AND roadmap_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, progressPercent);
            ps.setInt(2, userId);
            ps.setInt(3, roadmapId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ---------------------------------------
    // UPDATE STREAK + LAST ACTIVE DATE
    // ---------------------------------------
    public void updateStreak(int userId, int roadmapId, int newStreak, Date newLastActive) {

        String query = "UPDATE enrollments SET streak_days = ?, last_active = ? WHERE user_id = ? AND roadmap_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, newStreak);
            ps.setDate(2, newLastActive);
            ps.setInt(3, userId);
            ps.setInt(4, roadmapId);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ---------------------------------------
    // CHECK IF USER ALREADY ENROLLED
    // ---------------------------------------
    public boolean isAlreadyEnrolled(int userId, int roadmapId) {

        String query = "SELECT id FROM enrollments WHERE user_id = ? AND roadmap_id = ? LIMIT 1";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, roadmapId);

            ResultSet rs = ps.executeQuery();

            return rs.next(); // true if exists

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
