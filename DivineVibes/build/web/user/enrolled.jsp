<%@ page language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Enrollment" %>
<%@ page import="model.Roadmap" %>
<%
    List<Enrollment> enrollments = (List<Enrollment>) request.getAttribute("enrollments");
    List<Roadmap> roadmaps = (List<Roadmap>) request.getAttribute("roadmaps");
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
        color: var(--text-dark);
        line-height: 1.6;
    }

    .hero-section {
        background: linear-gradient(rgba(191, 147, 42, 0.8), rgba(191, 147, 42, 0.6)),
            url("../assets/my-roadmaps-hero.jpg") center/cover no-repeat;
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

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    .section {
        padding: 40px;
        margin: 40px 0;
    }


    .enrolled-list {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
        gap: 30px;
    }

    .enroll-card {
        background-color: var(--secondary-color);
        border-radius: 15px;
        padding: 30px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        transition: var(--transition);
        border: 1px solid #eee;
        text-align: center;
    }

    .enroll-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px var(--shadow);
    }

    .enroll-card h3 {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-color);
        margin-bottom: 15px;
    }

    .enroll-card p {
        font-size: 1rem;
        color: var(--text-light);
        margin-bottom: 10px;
    }



    .start-btn {
        background-color: var(--primary-color);
        color: var(--secondary-color);
    }

    .start-btn:hover {
        background-color: #a0852a;
        color: #fff;
    }

    .empty {
        text-align: center;
        font-size: 1.2rem;
        color: var(--text-light);
        padding: 50px;
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    .empty a {
        color: var(--primary-color);
        font-weight: 600;
        text-decoration: none;
    }

    .empty a:hover {
        text-decoration: underline;
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

    @media (max-width: 768px) {
        .hero-section {
            padding: 100px 20px;
        }

        .hero-section h1 {
            font-size: 2rem;
        }

        .section {
            padding: 30px 20px;
        }

        .enrolled-list {
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .enroll-card {
            padding: 20px;
        }

        .enroll-card h3 {
            font-size: 1.3rem;
        }
    }

    @media (max-width: 576px) {
        .hero-section h1 {
            font-size: 1.8rem;
        }
    }
    
    
    .my-btn {
        padding: 10px 20px;
        border-radius: 25px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        transition: var(--transition);
        cursor: pointer;
        border: none;
    }
</style>

<div class="hero-section">
    <div class="container">
        <h1>My Spiritual Roadmaps ?</h1>
        <p>Track your progress and continue your journey towards enlightenment.</p>
    </div>
</div>

<!-- Enrolled Roadmaps Section -->
<section class="container">
    <div class="section">
        <h2 class="section-title">Your Enrolled Roadmaps</h2>
        <% if (enrollments == null || enrollments.isEmpty()) { %>
            <div class="empty">
                You haven't enrolled in any roadmap yet. Browse <a href="${pageContext.request.contextPath}/roadmaps">roadmaps</a> to start your journey.
            </div>
        <% } else { %>
            <div class="enrolled-list">
                <% for (int i = 0; i < enrollments.size(); i++) {
                    Enrollment e = enrollments.get(i);
                    Roadmap r = roadmaps.get(i);
                %>
                    <div class="enroll-card">
                        <h3><%= r != null ? r.getTitle() : ("Roadmap #" + e.getRoadmapId()) %></h3>
                        <p>Progress: Day <%= e.getCurrentDay() %> of <%= (r!=null? r.getTotalDays(): "N/A") %></p>
                        <p>Streak: <%= e.getStreak() %> (Best: <%= e.getBestStreak() %>) ? Karma: <%= e.getKarmaPoints() %></p>
                        <a class="my-btn start-btn" href="${pageContext.request.contextPath}/roadmap/activity?roadmapId=<%= e.getRoadmapId() %>"><%= e.getCurrentDay() == 0 ? "Start" : "Continue" %></a>
                    </div>
                <% } %>
            </div>
        <% } %>
    </div>
</section>

<script>
    // Smooth scroll for better UX
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Add fade-in animation on scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    document.querySelectorAll('.section, .enroll-card').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<%@ include file="footer.jsp" %>