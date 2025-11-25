<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.UserActivity" %>
<%@ page import="model.RoadmapTemplateItem" %>
<%@ page import="model.Roadmap" %>
<%
    UserActivity act = (UserActivity) request.getAttribute("activity");
    RoadmapTemplateItem tmpl = (RoadmapTemplateItem) request.getAttribute("todayTemplate");
    Roadmap roadmap = (Roadmap) request.getAttribute("roadmap");
    Integer karma = (Integer) session.getAttribute("karmaPoints");
    if (karma == null) karma = 0;
%>

<%@ include file="header.jsp" %>

<style>
    :root {
        --primary-color: #BF932A;
        --secondary-color: #FCFCF7;
        --text-dark: #333;
        --text-light: #666;
        --shadow: rgba(191, 147, 42, 0.2);
        --transition: all 0.3s ease;
    }

    body {
        font-family: 'Poppins', sans-serif;
        background-color: var(--secondary-color);
        color: var(--text-dark);
        line-height: 1.6;
    }

    .hero-section {
        background: linear-gradient(rgba(191, 147, 42, 0.8), rgba(191, 147, 42, 0.6)),
            url("../assets/dashboard-hero.jpg") center/cover no-repeat;
        color: var(--secondary-color);
        padding: 150px 0;
        text-align: center;
        position: relative;
        overflow: hidden;
    }

    .hero-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="2" fill="rgba(255,255,255,0.1)"/></svg>') repeat;
        animation: float 20s infinite linear;
    }

    @keyframes float {
        0% {
            transform: translateY(0);
        }
        100% {
            transform: translateY(-100px);
        }
    }

    .hero-section h1 {
        font-size: 3rem;
        font-weight: 700;
        margin-bottom: 1rem;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
        animation: fadeInUp 1s ease-out;
    }

    .hero-section p {
        font-size: 1.2rem;
        opacity: 0.9;
        animation: fadeInUp 1s ease-out 0.2s both;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    .karma-card {
        color: var(--primary-color);
        border-radius: 20px;
        padding: 40px;
        transition: var(--transition);
        position: relative;
        overflow: hidden;
    }

    .karma-card h3 {
        font-weight: 600;
        margin-bottom: 1rem;
    }

    .karma-card .display-3 {
        font-size: 4rem;
        font-weight: 800;
        text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
    }

    .quick-card {
        background: var(--secondary-color);
        border-radius: 25px;
        padding: 30px 20px;
        transition: var(--transition);
        cursor: pointer;
        text-align: center;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        position: relative;
        overflow: hidden;
    }

    .quick-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(191, 147, 42, 0.1), transparent);
        transition: left 0.5s;
    }

    .quick-card:hover::before {
        left: 100%;
    }

    .quick-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 15px 30px rgba(191, 147, 42, 0.3);
        border-color: #8B6F2A;
        border-radius: 50px;
    }

    .quick-card h5 {
        color: var(--text-dark);
        font-weight: 600;
        margin: 0;
        border-radius: 25px;
        position: relative;
        z-index: 1;
    }

    .streak-section {
        border-radius: 20px;
        padding: 40px;
    }

    .streak-day {
        width: 50px;
        height: 50px;
        border-radius: 15px;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 5px;
        background: #e9ecef;
        color: var(--text-dark);
        font-weight: 500;
        transition: var(--transition);
        cursor: pointer;
    }

    .streak-day:hover {
        background: var(--primary-color);
        color: var(--secondary-color);
        transform: scale(1.1);
    }

    .highlight {
        background: var(--primary-color) !important;
        color: var(--secondary-color);
        font-weight: bold;
        box-shadow: 0 0 20px rgba(191, 147, 42, 0.5);
        animation: pulse 2s infinite;
    }

    @keyframes pulse {
        0% {
            box-shadow: 0 0 20px rgba(191, 147, 42, 0.5);
        }
        50% {
            box-shadow: 0 0 30px rgba(191, 147, 42, 0.8);
        }
        100% {
            box-shadow: 0 0 20px rgba(191, 147, 42, 0.5);
        }
    }

    .about-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
    }

    .about-section h2 {
        color: var(--primary-color);
        font-weight: 700;
        margin-bottom: 1.5rem;
    }

    .about-section p {
        font-size: 1.1rem;
        color: var(--text-light);
        max-width: 800px;
        margin: 0 auto;
    }

    .progress-bar {
        background: linear-gradient(90deg, var(--primary-color), #8B6F2A);
        height: 10px;
        border-radius: 5px;
        margin-top: 20px;
    }

    .progress-text {
        font-weight: bold;
        color: var(--primary-color);
        font-size: 1.1rem;
        margin-top: 10px;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
    }

    .section-title {
        color: var(--primary-color);
        font-weight: 700;
        text-align: center;
        margin-bottom: 2rem;
        position: relative;
    }

    .section-title::after {
        content: '';
        display: block;
        width: 60px;
        height: 4px;
        background: var(--primary-color);
        margin: 10px auto;
        border-radius: 2px;
    }

    .inspiration-section {
        background: linear-gradient(135deg, var(--secondary-color), #f8f9fa);
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        text-align: center;
    }

    .inspiration-section .blockquote {
        font-style: italic;
        font-size: 1.2rem;
        color: var(--text-dark);
        border-left: 5px solid var(--primary-color);
        padding-left: 20px;
        margin: 0;
    }

    .inspiration-section .blockquote-footer {
        color: var(--text-light);
        font-size: 0.9rem;
        margin-top: 10px;
    }

    .activity-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
        background: var(--secondary-color);
        box-shadow: 0 10px 30px var(--shadow);
    }

    .activity-card {
        background: var(--secondary-color);
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        margin-bottom: 30px;
        transition: var(--transition);
    }

    .activity-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(191, 147, 42, 0.3);
    }

    .activity-card h3 {
        color: var(--primary-color);
        font-weight: 600;
        margin-bottom: 20px;
    }

    .activity-card p {
        color: var(--text-light);
        margin-bottom: 15px;
    }

    .activity-card .status {
        font-weight: bold;
        color: var(--primary-color);
    }

    .btn {
        border-radius: 25px;
        padding: 12px 30px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        margin: 10px 5px;
        transition: var(--transition);
        border: none;
        cursor: pointer;
    }

    .btn-primary {
        background-color: var(--primary-color);
        color: var(--secondary-color);
    }

    .btn-primary:hover {
        background-color: #a0852a;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px var(--shadow);
    }

    .btn-secondary {
        background-color: #6c757d;
        color: var(--secondary-color);
    }

    .btn-secondary:hover {
        background-color: #5a6268;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
    }

    .alert {
        background-color: #fff3cd;
        color: #856404;
        border: 1px solid #ffeaa7;
        border-radius: 15px;
        padding: 20px;
        text-align: center;
        margin-bottom: 30px;
    }

    @media (max-width: 768px) {
        .hero-section {
            padding: 100px 20px;
        }

        .hero-section h1 {
            font-size: 2rem;
        }

        .karma-card {
            padding: 30px 20px;
        }

        .karma-card .display-3 {
            font-size: 3rem;
        }

        .quick-card {
            margin-bottom: 20px;
            margin: 0 5px;
        }

        .streak-day {
            width: 40px;
            height: 40px;
            margin: 3px;
        }

        .about-section, .inspiration-section, .activity-section {
            padding: 40px 20px;
        }
    }

    @media (max-width: 576px) {
        .hero-section h1 {
            font-size: 1.8rem;
        }

        .streak-day {
            width: 35px;
            height: 35px;
        }
    }
</style>

<div class="hero-section">
    <div class="container">
        <h1>Today's Activity 🌟</h1>
        <p>Engage in your daily spiritual practice and track your progress.</p>
    </div>
</div>

<!-- Activity Section -->
<section class="container mt-5">
    <div class="activity-section text-center">
        <h2 class="section-title"><%= roadmap != null ? roadmap.getTitle() : "Roadmap Activity" %></h2>
        <% if (act == null) { %>
            <div class="alert">
                <i class="bi bi-info-circle"></i> No activity scheduled for today. Come back tomorrow to continue your journey.
            </div>
            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/my/roadmaps">
                <i class="bi bi-arrow-left"></i> Back to My Roadmaps
            </a>
        <% } else { %>
            <div class="activity-card">
                <h3><i class="bi bi-calendar-day"></i> Day <%= act.getDayNumber() %> — <%= tmpl != null ? tmpl.getTitle() : "" %></h3>
                <p><%= tmpl != null ? tmpl.getDescription() : "Activity details not available." %></p>
                <p>Status: <span class="status"><%= act.getStatus() %></span></p>

                <form method="post" action="${pageContext.request.contextPath}/roadmap/activity" class="text-center">
                    <input type="hidden" name="userActivityId" value="<%= act.getUserActivityId() %>"/>
                    <input type="hidden" name="enrollmentId" value="<%= act.getEnrollmentId() %>"/>
                    <input type="hidden" name="roadmapId" value="<%= act.getRoadmapId() %>"/>
                    <button class="btn btn-primary" type="submit">
                        <i class="bi bi-check-circle"></i> Mark as Completed
                    </button>
                </form>

                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/myroadmaps">
                    <i class="bi bi-arrow-left"></i> Back to Roadmaps
                </a>
            </div>
        <% } %>
    </div>
</section>



<%@ include file="footer.jsp" %>