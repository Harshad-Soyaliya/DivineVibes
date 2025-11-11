<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Integer karma = (Integer) session.getAttribute("karmaPoints");

    if (karma == null)
        karma = 0;
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
        background: linear-gradient(135deg, var(--primary-color), #8B6F2A);
        color: var(--secondary-color);
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 10px 30px var(--shadow);
        transition: var(--transition);
        position: relative;
        overflow: hidden;
    }

    .karma-card::before {
        content: '✨';
        position: absolute;
        top: -20px;
        right: -20px;
        font-size: 4rem;
        opacity: 0.3;
        transform: rotate(15deg);
    }

    .karma-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 20px 40px var(--shadow);
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
        border: 2px solid var(--primary-color);
        border-radius: 50px;
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
        border-radius: 50px;

        background: linear-gradient(90deg, transparent, rgba(191, 147, 42, 0.1), transparent);
        transition: left 0.5s;
    }

    .quick-card:hover::before {
        left: 100%;
        border-radius: 50px;

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
        border-radius: 50px;
        position: relative;
        z-index: 1;
    }

    .streak-section {
        background: var(--secondary-color);
        border-radius: 20px;
        padding: 40px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
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
        background: linear-gradient(135deg, var(--secondary-color), #f8f9fa);
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
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

        .about-section, .inspiration-section {
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
        <h1>Welcome back, <%= userName%> 🌟</h1>
        <p>Continue your spiritual journey with DivineVibes and earn more karma points!</p>
    </div>
</div>

<!-- ✅ About Section -->
<section class="container mt-5">
    <div class="about-section text-center">
        <h2 class="section-title">What is DivineVibes?</h2>
        <p>
            DivineVibes is your companion for spiritual growth. Engage in daily positive activities like reading inspirational stories, listening to soothing bhajans, practicing meditation, and mindful reflection. Track your progress, build streaks, and accumulate karma points to deepen your spiritual connection.
        </p>
        <div class="progress-bar" style="width: <%= Math.min((karma != null ? karma : 0) / 10.0 * 100, 100)%>%"></div>
        <div class="progress-text">Your spiritual progress: <%= Math.min((karma != null ? karma : 0) / 10.0, 10)%>% complete</div>
    </div>
</section>

<!-- ✅ Karma Tracker -->
<div class="container mt-5">
    <div class="karma-card text-center">
        <h3>Your Karma Points</h3>
        <h1 class="display-3 fw-bold"><%= karma%> ✨</h1>
        <p class="mb-0">Keep up the great work! Every action counts towards your spiritual enlightenment.</p>
    </div>
</div>

<!-- ✅ Quick Actions -->
<section class="container mt-5">
    <h2 class="section-title">Quick Actions</h2>
    <div class="row mt-4 g-4 justify-content-center">
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card quick-card" onclick="window.location.href = '<%= request.getContextPath()%>/user/ActivityServlet'">
                <h5>Complete Activity ✅</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card quick-card" onclick="window.location.href = '<%= request.getContextPath()%>/user/BhajanServlet'">
                <h5>Listen to Bhajans 🎵</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card quick-card" onclick="window.location.href = '<%= request.getContextPath()%>/user/StoryServlet'">
                <h5>Read a Story 📖</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card quick-card" onclick="window.location.href = 'chatbot.jsp'">
                <h5>Talk to Divine Chatbot 💬</h5>
            </div>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card quick-card" onclick="window.location.href = '<%= request.getContextPath()%>/user/MeditationServlet'">
                <h5>Meditation Mode 🧘</h5>
            </div>
        </div>
        <!-- Extra: Daily Affirmations -->
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class="card quick-card" onclick="window.location.href = '<%= request.getContextPath()%>/user/AffirmationServlet'">
                <h5>Daily Affirmations 🌅</h5>
            </div>
        </div>
    </div>
</section>

<!-- ✅ Daily Streak -->
<section class="container mt-5 mb-5">
    <div class="streak-section">
        <h2 class="section-title">Daily Streak 🔥</h2>
        <p class="text-center text-muted">Track your consistency and stay motivated on your spiritual path</p>
        <div class="d-flex justify-content-center flex-wrap mt-4">
            <%
                java.util.Calendar cal = java.util.Calendar.getInstance();
                int today = cal.get(java.util.Calendar.DATE);
                int currentMonth = cal.get(java.util.Calendar.MONTH);
                int currentYear = cal.get(java.util.Calendar.YEAR);
                cal.set(java.util.Calendar.DAY_OF_MONTH, 1);
                int daysInMonth = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
                for (int i = 1; i <= daysInMonth; i++) {
                    boolean isCompleted = false; // You can replace this with actual logic to check if the day was completed
%>
            <div class="streak-day <%= (i == today ? "highlight" : (isCompleted ? "completed" : ""))%>"><%= i%></div>
            <% }%>
        </div>
        <p class="text-center mt-3">
            <small class="text-muted">Completed days are marked. Keep the streak alive!</small>
        </p>
    </div>
</section>

<!-- Extra: Daily Inspiration -->
<section class="container mt-5 mb-5">
    <div class="inspiration-section">
        <h3 class="section-title">Daily Inspiration</h3>
        <blockquote class="blockquote">
            <p>"The journey of a thousand miles begins with a single step. Your spiritual growth starts here."</p>
            <!--            <footer class="blockquote-footer">DivineVibes Wisdom</footer>-->
        </blockquote>
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

    document.querySelectorAll('.quick-card, .karma-card, .about-section, .streak-section, .inspiration-section').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<%@ include file="footer.jsp" %>