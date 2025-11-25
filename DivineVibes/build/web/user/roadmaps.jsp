<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="model.Roadmap" %>
<%
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
        background-color: var(--secondary-color);
        color: var(--text-dark);
        line-height: 1.6;
    }

    .hero-section {
        background: linear-gradient(rgba(191, 147, 42, 0.8), rgba(191, 147, 42, 0.6)),
            url("../assets/roadmaps-hero.jpg") center/cover no-repeat;
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

    .title {
        font-size: 2.5rem;
        font-weight: 700;
        color: var(--primary-color);
        text-align: center;
        margin-bottom: 40px;
    }

    .grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
        gap: 30px;
    }

    .card {
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        overflow: hidden;
        transition: var(--transition);
        border: 1px solid #eee;
        position: relative;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px var(--shadow);
    }

    .card img {
        width: 100%;
        height: auto;   /* Natural height */
        object-fit: contain;
    }


    .card h3 {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary-color);
        margin: 20px 20px 10px;
    }

    .short {
        font-size: 1rem;
        color: var(--text-light);
        margin: 0 20px 20px;
        line-height: 1.5;
    }

    .card-actions {
        padding: 20px;
        background-color: var(--secondary-color);
        border-top: 1px solid #eee;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .btn {
        padding: 10px 20px;
        border-radius: 25px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;

        border: none;
        cursor: pointer;
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



    .view-btn {
        background-color: var(--primary-color);
        color: var(--secondary-color);
    }

    .view-btn:hover {
        background-color: #a0852a;
        color: #fff;
    }

    .enroll-btn {
        background-color: var(--secondary-color);
        color: var(--primary-color);
        border: 2px solid var(--primary-color);
    }

    .enroll-btn:hover {
        background-color: var(--primary-color);
        color: var(--secondary-color);
    }

    .empty {
        text-align: center;
        font-size: 1.2rem;
        color: var(--text-light);
        grid-column: 1 / -1;
        padding: 50px;
    }

    .about-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
        text-align: center;
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

        .title {
            font-size: 2rem;
        }

        .grid {
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .card h3 {
            font-size: 1.3rem;
        }

        .short {
            font-size: 0.95rem;
        }

        .card-actions {
            flex-direction: column;
            gap: 10px;
        }

        .about-section {
            padding: 40px 20px;
        }
    }

    @media (max-width: 576px) {
        .hero-section h1 {
            font-size: 1.8rem;
        }
    }
</style>

<div class="hero-section">
    <div class="container">
        <h1>Explore Our Spiritual Roadmaps ?</h1>
        <p>Choose your path to enlightenment with personalized roadmaps inspired by ancient wisdom.</p>
    </div>
</div>

<!-- About Roadmaps Section -->
<section class="container mt-5">
    <div class="about-section">
        <h2 class="section-title">What Are Roadmaps?</h2>
        <p>
            Our spiritual roadmaps are structured journeys designed to guide you through stages of self-discovery. From building discipline to overcoming negativity, each roadmap includes daily activities, stories, and practices to help you grow spiritually and earn karma points.
        </p>
    </div>
</section>

<hr style="height:3px; border:none; background:#BF932A; width:500px; margin:25px auto; display:block;">

<!-- Roadmaps Grid -->
<div class="container">
    <h2 class="title">Available Roadmaps</h2>
    <div class="grid">
        <% if (roadmaps == null || roadmaps.isEmpty()) { %>
        <div class="empty">No roadmaps found.</div>
        <% } else { %>
        <% for (Roadmap r : roadmaps) {%>
        <div class="card">
            <img src="${pageContext.request.contextPath}/user/Images/roadmap.png" alt="roadmap">
            <h3><%= r.getTitle()%></h3>
            <p class="short"><%= r.getShortDesc()%></p>
            <div class="card-actions">
                <a class="my-btn view-btn" href="${pageContext.request.contextPath}/roadmap/details?id=<%= r.getRoadmapId()%>">View Details</a>
                <form method="post" action="${pageContext.request.contextPath}/roadmap/enroll" style="display:inline;">
                    <input type="hidden" name="roadmapId" value="<%= r.getRoadmapId()%>" />
                    <button class="my-btn enroll-btn" type="submit">Enroll</button>
                </form>
            </div>
        </div>
        <% } %>
        <% }%>
    </div>
</div>

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

    document.querySelectorAll('.card, .about-section').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<%@ include file="footer.jsp" %>