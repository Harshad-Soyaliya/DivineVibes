package User_Servlets;

import utils.DBConnection;
import utils.UserActivityDAO;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.*;
import java.time.*;
import java.util.concurrent.*;

@WebListener
public class DailyJobScheduler implements ServletContextListener {

    private ScheduledExecutorService scheduler;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newSingleThreadScheduledExecutor();

        ZoneId zone = ZoneId.of("Asia/Kolkata");
        ZonedDateTime now = ZonedDateTime.now(zone);
        ZonedDateTime nextRun = now.withHour(0).withMinute(5).withSecond(0).withNano(0);
        if (!nextRun.isAfter(now)) {
            nextRun = nextRun.plusDays(1);
        }

        long initialDelay = Duration.between(now, nextRun).toMillis();
        long period = Duration.ofDays(1).toMillis();

        scheduler.scheduleAtFixedRate(() -> {
            try {
                runDailyTasks();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }, initialDelay, period, TimeUnit.MILLISECONDS);
    }

    private void runDailyTasks() throws SQLException {
        LocalDate today = LocalDate.now(ZoneId.of("Asia/Kolkata"));

        UserActivityDAO uaDao = new UserActivityDAO();
        // 1) mark yesterday/past pending as missed
        uaDao.markMissedIfPastDue(today);

        // 2) create next-day activities for each enrollment
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement("SELECT enrollment_id, user_id, roadmap_id, current_day FROM enrollments")) {
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int enrollId = rs.getInt("enrollment_id");
                    int userId = rs.getInt("user_id");
                    int roadmapId = rs.getInt("roadmap_id");
                    int currentDay = rs.getInt("current_day");
                    int nextDay = currentDay + 1;

                    // check roadmap total days
                    try (PreparedStatement p2 = c.prepareStatement("SELECT total_days FROM roadmaps WHERE roadmap_id = ?")) {
                        p2.setInt(1, roadmapId);
                        try (ResultSet r2 = p2.executeQuery()) {
                            if (r2.next()) {
                                int totalDays = r2.getInt("total_days");
                                if (nextDay <= totalDays) {
                                    LocalDate scheduled = today.plusDays(1);
                                    uaDao.createActivity(enrollId, userId, roadmapId, nextDay, scheduled);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (scheduler != null) {
            scheduler.shutdownNow();
        }
    }
}
