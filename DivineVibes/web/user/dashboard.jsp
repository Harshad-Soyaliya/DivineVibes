<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in using the session attribute set by LoginServlet (e.g., "userId")
    Object userId = session.getAttribute("userId");
    if (userId == null) {
        // User not logged in: Redirect to login page (matching LogoutServlet's redirect)
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return;
    }
%>

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
    </div>
</section>

<hr style="height:3px; border:none; background:#BF932A; width:500px; margin:25px auto; display:block;">

<!-- ✅ Quick Actions -->
<section class="container mt-5">
    <h2 class="section-title">Quick Actions</h2>
    <div class="row mt-4 g-4 justify-content-center">
        
        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class=" quick-card" 
                 onclick="window.location.href = '<%= request.getContextPath()%>/myroadmaps' ">
                <i class="fa-solid fa-check-circle"></i>
                <h5>Enrolled Roadmap...</h5>
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class=" quick-card" 
                 onclick="window.location.href = '<%= request.getContextPath()%>/user/BhajanServlet'">
                <i class="fa-solid fa-music"></i>
                <h5>Listen to spiritual...</h5>
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class=" quick-card" 
                 onclick="window.location.href = '<%= request.getContextPath()%>/user/StoryServlet'">
                <i class="fa-solid fa-book-open"></i>
                <h5>Share yout story...</h5>
            </div>
        </div>

        <div class="col-lg-3 col-md-4 col-sm-6">
            <div class=" quick-card" onclick="window.location.href = 'chatbot.jsp'">
                <i class="fa-solid fa-comments"></i>
                <h5>Talk to Divine Chatbot</h5>
            </div>
        </div>

    </div>
</section>

<!-- Extra: Daily Inspiration -->
<section class="container mt-5 mb-5">
    <div class="inspiration-section">
        <h3 class="section-title">Daily Inspiration</h3>
        <blockquote class="blockquote">
            <p>"The journey of a thousand miles begins with a single step. Your spiritual growth starts here."</p>
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