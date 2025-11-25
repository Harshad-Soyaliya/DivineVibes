package utils;

import model.Roadmap;
import model.RoadmapTemplateItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoadmapDAO {

    public List<Roadmap> listAll() throws SQLException {
        String sql = "SELECT roadmap_id, title, short_desc, total_days FROM roadmaps ORDER BY created_at DESC";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            List<Roadmap> list = new ArrayList<>();
            while (rs.next()) {
                Roadmap r = new Roadmap();
                r.setRoadmapId(rs.getInt("roadmap_id"));
                r.setTitle(rs.getString("title"));
                r.setShortDesc(rs.getString("short_desc"));
                r.setTotalDays(rs.getInt("total_days"));
                list.add(r);
            }
            return list;
        }
    }

    public Roadmap getById(int id) throws SQLException {
        String sql = "SELECT * FROM roadmaps WHERE roadmap_id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Roadmap r = new Roadmap();
                    r.setRoadmapId(rs.getInt("roadmap_id"));
                    r.setTitle(rs.getString("title"));
                    r.setShortDesc(rs.getString("short_desc"));
                    r.setFullDesc(rs.getString("full_desc"));
                    r.setTotalDays(rs.getInt("total_days"));
                    return r;
                }
            }
        }
        return null;
    }

    public List<RoadmapTemplateItem> getTemplate(int roadmapId) throws SQLException {
        String sql = "SELECT template_id, roadmap_id, day_number, title, description, duration_minutes FROM roadmap_activities_template WHERE roadmap_id = ? ORDER BY day_number";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, roadmapId);
            try (ResultSet rs = ps.executeQuery()) {
                List<RoadmapTemplateItem> list = new ArrayList<>();
                while (rs.next()) {
                    RoadmapTemplateItem t = new RoadmapTemplateItem();
                    t.setTemplateId(rs.getInt("template_id"));
                    t.setRoadmapId(rs.getInt("roadmap_id"));
                    t.setDayNumber(rs.getInt("day_number"));
                    t.setTitle(rs.getString("title"));
                    t.setDescription(rs.getString("description"));
                    t.setDurationMinutes(rs.getInt("duration_minutes"));
                    list.add(t);
                }
                return list;
            }
        }
    }
}
