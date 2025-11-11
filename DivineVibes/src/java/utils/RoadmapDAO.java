package utils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.Roadmap;
import models.Activity;
import utils.DBConnection;

public class RoadmapDAO {

    // -------------------------
    // GET ALL ROADMAPS
    // -------------------------
    public List<Roadmap> getAllRoadmaps() {
        List<Roadmap> list = new ArrayList<>();

        String query = "SELECT * FROM roadmaps ORDER BY created_at DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Roadmap r = new Roadmap(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("short_description"),
                    rs.getString("full_description"),
                    rs.getInt("duration_days"),
                    rs.getTimestamp("created_at")
                );
                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // -------------------------
    // GET ROADMAP BY ID
    // -------------------------
    public Roadmap getRoadmapById(int id) {
        Roadmap r = null;

        String query = "SELECT * FROM roadmaps WHERE id = ? LIMIT 1";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = new Roadmap(
                    rs.getInt("id"),
                    rs.getString("title"),
                    rs.getString("short_description"),
                    rs.getString("full_description"),
                    rs.getInt("duration_days"),
                    rs.getTimestamp("created_at")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    // -------------------------
    // GET ACTIVITIES FOR ROADMAP
    // -------------------------
    public List<Activity> getActivitiesByRoadmap(int roadmapId) {
        List<Activity> list = new ArrayList<>();

        String query = "SELECT * FROM activities WHERE roadmap_id = ? ORDER BY day_number ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, roadmapId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Activity a = new Activity(
                    rs.getInt("id"),
                    rs.getInt("roadmap_id"),
                    rs.getInt("day_number"),
                    rs.getString("title"),
                    rs.getString("description"),
                    rs.getInt("duration_minutes"),
                    rs.getTimestamp("created_at")
                );
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // -------------------------
    // CHECK IF USER IS ENROLLED
    // -------------------------
    public boolean isUserEnrolled(int userId, int roadmapId) {
        String query = "SELECT id FROM enrollments WHERE user_id = ? AND roadmap_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, userId);
            ps.setInt(2, roadmapId);

            ResultSet rs = ps.executeQuery();

            return rs.next(); // true if enrolled

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
