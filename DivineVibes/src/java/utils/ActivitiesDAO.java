package utils;

import utils.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Activity;

public class ActivitiesDAO {

    // Get all activities by roadmap_id
    public List<Activity> getActivitiesByRoadmapId(int roadmapId) {
        List<Activity> list = new ArrayList<>();

        String sql = "SELECT * FROM activities WHERE roadmap_id = ? ORDER BY sequence_no ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, roadmapId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Activity a = new Activity(
                        rs.getInt("id"),
                        rs.getInt("roadmap_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("sequence_no")
                );
                list.add(a);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // Add activity
    public boolean addActivity(Activity a) {
        String sql = "INSERT INTO activities (roadmap_id, title, description, sequence_no) VALUES (?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, a.getRoadmapId());
            ps.setString(2, a.getTitle());
            ps.setString(3, a.getDescription());
            ps.setInt(4, a.getSequenceNo());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
