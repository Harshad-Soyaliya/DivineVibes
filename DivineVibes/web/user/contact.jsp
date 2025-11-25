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
            url("../assets/contact-hero.jpg") center/cover no-repeat; /* Replace with your image path */
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

    .contact-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
    }

    .contact-section h2 {
        color: var(--primary-color);
        font-weight: 700;
        margin-bottom: 1.5rem;
        text-align: center;
    }

    .contact-form {
        max-width: 600px;
        margin: 0 auto;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-control {
        border: 2px solid #e9ecef;
        border-radius: 10px;
        padding: 12px;
        font-size: 1rem;
        transition: var(--transition);
    }

    .form-control:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 0.2rem rgba(191, 147, 42, 0.25);
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
    }

    .btn-submit:hover {
        background: #a67c00;
        transform: scale(1.05);
    }

    .contact-details {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
    }

    .contact-details h2 {
        color: var(--primary-color);
        font-weight: 700;
        text-align: center;
        margin-bottom: 2rem;
    }

    .contact-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
    }

    .contact-item {
        text-align: center;
        padding: 20px;
        background: var(--secondary-color);
        border-radius: 15px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        transition: var(--transition);
    }

    .contact-item:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(191, 147, 42, 0.3);
    }

    .contact-item i {
        font-size: 2rem;
        color: var(--primary-color);
        margin-bottom: 1rem;
    }

    .contact-item h4 {
        color: var(--text-dark);
        font-weight: 600;
        margin-bottom: 0.5rem;
    }

    .contact-item p {
        color: var(--text-light);
        font-size: 0.9rem;
    }

    .contact-item a {
        color: var(--primary-color);
        text-decoration: none;
        transition: var(--transition);
    }

    .contact-item a:hover {
        color: #a67c00;
    }

    .map-section {
        border-radius: 20px;
        padding: 60px 40px;
        margin: 40px 0;
        text-align: center;
    }

    .map-section h2 {
        color: var(--primary-color);
        font-weight: 700;
        margin-bottom: 2rem;
    }

    .map-container {
        max-width: 800px;
        margin: 0 auto;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
    }

    .map-container iframe {
        width: 100%;
        height: 400px;
        border: none;
    }

    @media (max-width: 768px) {
        .hero-section {
            padding: 100px 20px;
        }

        .hero-section h1 {
            font-size: 2rem;
        }

        .contact-section, .contact-details, .map-section {
            padding: 40px 20px;
        }

        .contact-grid {
            grid-template-columns: 1fr;
        }

        .map-container iframe {
            height: 300px;
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
        <h1>Contact DivineVibes</h1>
        <p>We're here to help. Reach out with your questions, feedback, or support needs.</p>
    </div>
</div>

<!-- Contact Form Section -->
<section class="container mt-5">
    <div class="contact-section">
        <h2 class="section-title">Send Us a Message</h2>
        <form class="contact-form" action="<%= request.getContextPath()%>/contact" method="post"> <!-- Replace with your servlet endpoint -->
            <div class="form-group">
                <input type="text" class="form-control" name="name" placeholder="Your Name" required>
            </div>
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Your Email" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="subject" placeholder="Subject" required>
            </div>
            <div class="form-group">
                <textarea class="form-control" name="message" rows="5" placeholder="Your Message" required></textarea>
            </div>
            <button type="submit" class="btn-submit">Send Message</button>
        </form>
    </div>
</section>

<hr style="height:3px; border:none; background:#BF932A; width:500px; margin:25px auto; display:block;">


<!-- Contact Details Section -->
<section class="container mt-5">
    <div class="contact-details">
        <h2 class="section-title">Get in Touch</h2>
        <div class="contact-grid">
            <div class="contact-item">
                <i class="fas fa-phone"></i>
                <h4>Phone</h4>
                <p><a href="tel:+11234567890">+1 (123) 456-7890</a></p>
            </div>
            <div class="contact-item">
                <i class="fas fa-envelope"></i>
                <h4>Email</h4>
                <p><a href="mailto:info@divinevibes.com">info@divinevibes.com</a></p>
            </div>
            <div class="contact-item">
                <i class="fas fa-map-marker-alt"></i>
                <h4>Address</h4>
                <p>123 Spiritual Lane<br>Peace City, PC 12345<br>India</p>
            </div>
            
        </div>
    </div>
</section>

<hr style="height:3px; border:none; background:#BF932A; width:500px; margin:25px auto; display:block;">


<!-- Map Section (Extra for Professional Structure) -->
<section class="container mt-5 mb-5">
    <div class="map-section">
        <h2 class="section-title" >Find Us</h2>
        <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509374!2d144.9537353153167!3d-37.816279742021504!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642af0f11fd81%3A0xf577d5b6e6b7b!2sMelbourne%20CBD%2C%20Victoria%2C%20Australia!5e0!3m2!1sen!2sus!4v1634567890123!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe> <!-- Replace with your actual location embed -->
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

    document.querySelectorAll('.contact-section, .contact-item, .map-section').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<%@ include file="footer.jsp" %>