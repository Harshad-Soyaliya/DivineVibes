<%@ page language="java" %>
<%@ page import="model.Roadmap" %>
<%@ page import="model.RoadmapTemplateItem" %>
<%@ page import="java.util.List" %>
<%
    Roadmap roadmap = (Roadmap) request.getAttribute("roadmap");
    List<RoadmapTemplateItem> template = (List<RoadmapTemplateItem>) request.getAttribute("template");
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
            url("../assets/roadmap-detail-hero.jpg") center/cover no-repeat;
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
        background-color: #fff;
        border-radius: 20px;
        padding: 40px;
        margin: 40px 0;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        transition: var(--transition);
    }

    .section:hover {
        box-shadow: 0 8px 25px var(--shadow);
    }

    .full {
        font-size: 1.1rem;
        color: var(--text-light);
        line-height: 1.7;
        margin-bottom: 30px;
    }

    .template-list {
        list-style: none;
        padding: 0;
    }

    .template-list li {
        background-color: var(--secondary-color);
        border-left: 5px solid var(--primary-color);
        padding: 20px;
        margin-bottom: 15px;
        border-radius: 10px;
        transition: var(--transition);
    }

    .template-list li:hover {
        transform: translateX(5px);
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    .template-list li strong {
        color: var(--primary-color);
        font-weight: 600;
    }

    .btn {
        padding: 12px 25px;
        border-radius: 25px;
        font-weight: 600;
        text-decoration: none;
        display: inline-block;
        transition: var(--transition);
        border: none;
        cursor: pointer;
        margin-right: 10px;
    }

    .enroll-btn {
        background-color: var(--primary-color);
        color: var(--secondary-color);
    }

    .enroll-btn:hover {
        background-color: #a0852a;
        color: #fff;
    }

    .back-btn {
        background-color: var(--secondary-color);
        color: var(--primary-color);
        border: 2px solid var(--primary-color);
    }

    .back-btn:hover {
        background-color: var(--primary-color);
        color: var(--secondary-color);
    }

    .section-title {
        color: var(--primary-color);
        font-weight: 700;
        margin-bottom: 1.5rem;
        position: relative;
    }

    .section-title::after {
        content: '';
        display: block;
        width: 60px;
        height: 4px;
        background: var(--primary-color);
        margin-top: 10px;
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

        .template-list li {
            padding: 15px;
        }

        .btn {
            display: block;
            width: 100%;
            margin-bottom: 10px;
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
        <h1><%= roadmap.getTitle()%> ?</h1>
        <p>Discover the path to spiritual growth with this detailed roadmap.</p>
    </div>
</div>

<!-- Roadmap Description Section -->
<section class="container">
    <div class="section">
        <h2 class="section-title">About This Roadmap</h2>
        <p class="full"><%= roadmap.getFullDesc()%></p>
    </div>
</section>

<hr style="height:3px; border:none; background:#BF932A; width:500px; margin:25px auto; display:block;">

<!-- Daily Plan Section -->
<section class="container">
    <div class="section">
        <h2 class="section-title">Daily Plan (Sample)</h2>
        <ul class="template-list">
            <%
                int count = 0;
                for (RoadmapTemplateItem t : template) {
                    if (count == 5) {
                        break;  // stop after 5 items
                    }%>
            <li>
                <strong>Day <%= t.getDayNumber()%>:</strong> 
                <%= t.getTitle()%> ? <%= t.getDescription()%> 
                (<%= t.getDurationMinutes()%> min)
            </li>
            <%
                    count++;
                }
            %>
        </ul>

    </div>
</section>

<!-- Action Buttons -->
<section class="container text-center">
    <form method="post" action="${pageContext.request.contextPath}/roadmap/enroll" style="display:inline;">
        <input type="hidden" name="roadmapId" value="<%= roadmap.getRoadmapId()%>" />
        <button class="my-btn enroll-btn">Enroll Now</button>
    </form>
    <a class="my-btn back-btn" href="${pageContext.request.contextPath}/roadmaps">Back to Roadmaps</a>
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

    document.querySelectorAll('.section').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<%@ include file="footer.jsp" %>