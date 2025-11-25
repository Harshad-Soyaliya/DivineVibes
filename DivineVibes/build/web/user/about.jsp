<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

    .hero-section {
        background: linear-gradient(rgba(191, 147, 42, 0.8), rgba(191, 147, 42, 0.6)),
            url("../assets/about-hero.jpg") center/cover no-repeat; /* Replace with your image path */
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
        0% { transform: translateY(0); }
        100% { transform: translateY(-100px); }
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

    .about-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
    }

    .about-section h2 {
        color: var(--primary-color);
        font-weight: 700;
        margin-bottom: 1.5rem;
        text-align: center;
    }

    .about-section p {
        font-size: 1.1rem;
        color: var(--text-light);
        max-width: 800px;
        margin: 0 auto 2rem;
        text-align: center;
    }

    .mission-vision-values {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        margin-top: 40px;
    }

    .mv-card {
        background: var(--secondary-color);
        border-radius: 15px;
        padding: 30px;
        text-align: center;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: var(--transition);
        border: 2px solid transparent;
    }

    .mv-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(191, 147, 42, 0.3);
        border-color: var(--primary-color);
    }

    .mv-card h3 {
        color: var(--primary-color);
        font-weight: 600;
        margin-bottom: 1rem;
    }

    .mv-card p {
        color: var(--text-light);
        font-size: 1rem;
    }

    .features-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
    }

    .features-section h2 {
        color: var(--primary-color);
        font-weight: 700;
        text-align: center;
        margin-bottom: 2rem;
    }

    .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
    }

    .feature-item {
        text-align: center;
        padding: 20px;
        background: var(--secondary-color);
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: var(--transition);
    }

    .feature-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(191, 147, 42, 0.3);
    }

    .feature-item i {
        font-size: 2rem;
        color: var(--primary-color);
        margin-bottom: 1rem;
    }

    .feature-item h4 {
        color: var(--text-dark);
        font-weight: 600;
        margin-bottom: 0.5rem;
    }

    .feature-item p {
        color: var(--text-light);
        font-size: 0.9rem;
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

    .cta-section {
        background: var(--primary-color);
        color: var(--secondary-color);
        padding: 60px 40px;
        text-align: center;
        border-radius: 20px;
        margin: 40px 0;
    }

    .cta-section h2 {
        font-weight: 700;
        margin-bottom: 1rem;
    }

    .cta-section p {
        font-size: 1.1rem;
        opacity: 0.9;
        margin-bottom: 2rem;
    }

    .btn-cta {
        background: var(--secondary-color);
        color: var(--primary-color);
        border: none;
        padding: 12px 30px;
        border-radius: 25px;
        font-weight: 600;
        transition: var(--transition);
        text-decoration: none;
        display: inline-block;
    }

    .btn-cta:hover {
        background: #e9ecef;
        transform: scale(1.05);
    }

    @media (max-width: 768px) {
        .hero-section {
            padding: 100px 20px;
        }

        .hero-section h1 {
            font-size: 2rem;
        }

        .about-section, .features-section, .inspiration-section, .cta-section {
            padding: 40px 20px;
        }

        .mission-vision-values {
            grid-template-columns: 1fr;
        }

        .features-grid {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 576px) {
        .hero-section h1 {
            font-size: 1.8rem;
        }
    }
</style>

<!-- Hero Section -->
<div class="hero-section">
    <div class="container">
        <h1>About DivineVibes</h1>
        <p>Discover our mission to guide you on a personalized journey to spiritual wellness and inner transformation.</p>
    </div>
</div>

<!-- About Section -->
<section class="container mt-5">
    <div class="about-section">
        <h2 class="section-title">What is DivineVibes?</h2>
        <p>
            DivineVibes is a spiritual wellness web platform designed to help individuals reconnect with their inner self and explore spirituality in a structured, engaging, and meaningful way. It beautifully blends traditional Indian spiritual wisdom with modern, interactive web technologies, creating an accessible path for anyone seeking peace, clarity, discipline, mindfulness, or inner transformation. Through inspiring content, personalized guidance, and interactive tools, DivineVibes empowers users to build spiritual consistency and experience personal growth.
        </p>
        <p>
            Today, many people struggle with a lack of inner peace, disconnection from cultural roots, inconsistent personal growth, and the overwhelming noise of social media. DivineVibes solves these gaps by offering a platform that is structured, uplifting, culturally rooted, and fully interactive—guiding users step by step toward a better, more meaningful life.
        </p>
    </div>
</section>

<!-- Mission, Vision, Values -->
<section class="container mt-5">
    <div class="mission-vision-values">
        <div class="mv-card">
            <h3 class="section-title">Our Mission</h3>
            <p>To empower individuals with personalized spiritual tools and guidance, fostering inner peace, mindfulness, and consistent self-growth through culturally rooted wisdom and modern technology.</p>
        </div>
        <div class="mv-card">
            <h3 class="section-title">Our Vision</h3>
            <p>A world where everyone has access to spiritual wellness, building a global community of mindful, disciplined, and transformed individuals connected to their inner selves.</p>
        </div>
        <div class="mv-card">
            <h3 class="section-title">Our Values</h3>
            <p>Authenticity, Compassion, Discipline, Cultural Heritage, Inclusivity, and Continuous Growth. We believe in blending tradition with innovation to create meaningful spiritual experiences.</p>
        </div>
    </div>
</section>

<!-- Features Overview -->
<section class="container mt-5">
    <div class="features-section">
        <h2 class="section-title">What DivineVibes Offers</h2>
        <div class="features-grid">
            <div class="feature-item">
                <i class="fas fa-road"></i>
                <h4>Personalized Roadmaps</h4>
                <p>Structured spiritual journeys with daily tasks to build discipline and consistency.</p>
            </div>
            <div class="feature-item">
                <i class="fas fa-book"></i>
                <h4>Inspirational Stories</h4>
                <p>Real-life transformations and community sharing for motivation and connection.</p>
            </div>
            <div class="feature-item">
                <i class="fas fa-music"></i>
                <h4>Spiritual Content</h4>
                <p>Bhajans, music, and audios curated for peace and positivity.</p>
            </div>
           
           
        </div>
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

    document.querySelectorAll('.about-section, .mv-card, .feature-item, .inspiration-section, .cta-section').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<%@ include file="footer.jsp" %>