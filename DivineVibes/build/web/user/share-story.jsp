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
            url("../assets/share-story-hero.jpg") center/cover no-repeat; /* Replace with your image path */
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

    .share-form-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
        max-width: 800px;
        margin-left: auto;
        margin-right: auto;
    }

    .share-form-section h2 {
        color: var(--primary-color);
        font-weight: 700;
        text-align: center;
        margin-bottom: 2rem;
    }

    .form-group {
        margin-bottom: 2rem;
    }

    .form-label {
        color: var(--text-dark);
        font-weight: 600;
        margin-bottom: 0.5rem;
        display: block;
    }

    .form-control {
        border: 2px solid #e9ecef;
        border-radius: 10px;
        padding: 12px;
        font-size: 1rem;
        transition: var(--transition);
        width: 100%;
    }

    .form-control:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.2rem rgba(191, 147, 42, 0.25);
    }

    .form-control[rows] {
        resize: vertical;
        min-height: 120px;
    }

    .btn-submit {
        background: var(--primary-color);
        color: var(--secondary-color);
        border: none;
        padding: 12px 30px;
        border-radius: 25px;
        font-weight: 600;
        transition: var(--transition);
        width: 100%;
        font-size: 1.1rem;
    }

    .btn-submit:hover {
        background: #a67c00;
        transform: scale(1.05);
    }

    .guidelines-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
        text-align: center;
    }

    .guidelines-section h2 {
        color: var(--primary-color);
        font-weight: 700;
        margin-bottom: 2rem;
    }

    .guidelines-list {
        list-style: none;
        padding: 0;
        max-width: 600px;
        margin: 0 auto;
    }

    .guidelines-list li {
        background: var(--secondary-color);
        border-radius: 10px;
        padding: 15px;
        margin-bottom: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        border-left: 5px solid var(--primary-color);
        text-align: left;
    }

    .guidelines-list li i {
        color: var(--primary-color);
        margin-right: 10px;
    }

    @media (max-width: 768px) {
        .hero-section {
            padding: 100px 20px;
        }

        .hero-section h1 {
            font-size: 2rem;
        }

        .share-form-section, .guidelines-section {
            padding: 40px 20px;
        }

        .guidelines-list li {
            padding: 12px;
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
        <h1>Share Your Story</h1>
        <p>Inspire others by sharing your journey of spiritual growth and transformation with the DivineVibes community.</p>
    </div>
</div>

<!-- Share Form Section -->
<section class="container mt-5">
    <div class="share-form-section">
        <h2 class="section-title">Tell Your Story</h2>
        <form action="<%= request.getContextPath() %>/ShareStoryServlet" method="post">
            <div class="form-group">
                <label for="title" class="form-label">Story Title</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="Enter a compelling title for your story" required>
            </div>
            <div class="form-group">
                <label for="author" class="form-label">Your Name</label>
                <input type="text" class="form-control" id="author" name="author" placeholder="Enter your name or preferred display name" required>
            </div>
            <div class="form-group">
                <label for="content" class="form-label">Your Story</label>
                <textarea class="form-control" id="content" name="content" rows="8" placeholder="Share your personal journey, challenges overcome, lessons learned, and how DivineVibes helped you..." required></textarea>
            </div>
            <button type="submit" class="btn-submit">Share My Story</button>
        </form>
    </div>
</section>

<hr style="height:3px; border:none; background:#BF932A; width:500px; margin:25px auto; display:block;">

<!-- Guidelines Section -->
<section class="container mt-5 mb-5">
    <div class="guidelines-section">
        <h2 class="section-title">Sharing Guidelines</h2>
        <ul class="guidelines-list">
            <li><i class="fas fa-heart"></i> <strong>Be Authentic:</strong> Share genuine experiences to inspire and connect with others.</li>
            <li><i class="fas fa-lightbulb"></i> <strong>Focus on Growth:</strong> Highlight lessons learned, challenges overcome, and positive transformations.</li>
            <li><i class="fas fa-users"></i> <strong>Respect Privacy:</strong> Avoid sharing sensitive personal details or information about others.</li>
            <li><i class="fas fa-balance-scale"></i> <strong>Be Positive:</strong> Emphasize uplifting aspects while acknowledging difficulties constructively.</li>
            <li><i class="fas fa-edit"></i> <strong>Keep it Concise:</strong> Aim for stories that are engaging and not overly long?focus on key insights.</li>
        </ul>
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

    document.querySelectorAll('.share-form-section, .guidelines-section').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<%@ include file="footer.jsp" %>