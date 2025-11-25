<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.Math" %>
<%@ page import="model.Roadmap" %>  <!-- Replace 'your.package' with the actual package -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="DivineVibes - Your Personalized Journey to Spiritual Wellness. Discover inner peace through roadmaps, karma points, AI guidance, and ancient wisdom.">
        <meta name="keywords" content="spiritual wellness, mindfulness, Indian spirituality, roadmaps, karma points, AI chatbot, meditation">
        <title>DivineVibes – Spiritual Wellness Platform</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

        <style>
            :root {
                --primary-color: #BF932A;
                --secondary-color: #FCFCF7;
                --accent-color: #a0852a;
                --text-dark: #333;
                --text-light: #666;
                --shadow: rgba(191, 147, 42, 0.1);
                --transition: all 0.3s ease;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--secondary-color);
                color: var(--text-dark);
                line-height: 1.6;
                margin: 0;
                padding: 0;
                overflow-x: hidden;
            }

            /* Navbar */
            .navbar {
                background-color: var(--primary-color);
                box-shadow: 0 2px 10px var(--shadow);
                backdrop-filter: blur(10px);
            }
            .navbar-brand, .nav-link {
                color: var(--secondary-color) !important;
                font-weight: 500;
            }
            .navbar-brand:hover, .nav-link:hover {
                color: #fff !important;
                transform: translateY(-1px);
            }

            /* Hero Section */
            .hero-section {
                min-height: 90vh;
                background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
                color: var(--text-dark);
                display: flex;
                align-items: center;
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
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="1" fill="rgba(191,147,42,0.05)"/></svg>') repeat;
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
            .hero-content {
                position: relative;
                z-index: 2;
            }
            .hero-section h1 {
                font-size: 3.5rem;
                font-weight: 700;
                margin-bottom: 20px;
                text-shadow: 1px 1px 3px rgba(0,0,0,0.1);
                animation: fadeInUp 1s ease-out;
            }
            .hero-section p {
                font-size: 1.3rem;
                margin-bottom: 30px;
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
            .btn-custom {
                border-radius: 25px;
                padding: 12px 30px;
                font-weight: 600;
                transition: var(--transition);
                border: none;
                cursor: pointer;
            }
            .btn-primary-custom {
                background-color: var(--primary-color);
                color: var(--secondary-color);
            }
            .btn-primary-custom:hover {
                background-color: var(--accent-color);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px var(--shadow);
            }
            .btn-outline-custom {
                background-color: transparent;
                color: var(--primary-color);
                border: 2px solid var(--primary-color);
            }
            .btn-outline-custom:hover {
                background-color: var(--primary-color);
                color: var(--secondary-color);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px var(--shadow);
            }


            .btn-outline-footer {
                background-color: white;
                color: var(--primary-color);
                border: 2px solid white;
            }
            .btn-outline-footer:hover {
                background-color: var(--primary-color);
                color: var(--secondary-color);
                transform: translateY(-2px);
                box-shadow: 0 5px 15px var(--shadow);
            }

            /* Sections */
            .section {
                padding: 80px 0;
                background-color: var(--secondary-color);
            }
            .section-alt {
                background-color: #f8f9fa;
            }
            .section-title {
                font-size: 2.5rem;
                font-weight: 700;
                color: var(--primary-color);
                margin-bottom: 20px;
                text-align: center;
                position: relative;
            }
            .section-title::after {
                content: '';
                display: block;
                width: 60px;
                height: 3px;
                background: var(--primary-color);
                margin: 10px auto;
                border-radius: 2px;
            }
            .section-subtitle {
                font-size: 1.1rem;
                color: var(--text-light);
                text-align: center;
                margin-bottom: 60px;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }

            /* Equal Width Layout for Features */
            .equal-width-row {
                display: flex;
                align-items: stretch;
                margin-bottom: 80px;
            }
            .equal-width-row .image-col, .equal-width-row .content-col {
                flex: 1;
                padding: 20px;
            }
            .equal-width-row img {
                width: 100%;
                height: 300px;
                border-radius: 15px;
                object-fit: cover;
                box-shadow: 0 10px 30px var(--shadow);
                transition: var(--transition);
            }
            .equal-width-row img:hover {
                transform: scale(1.02);
            }
            .equal-width-row .content h4 {
                font-size: 1.8rem;
                font-weight: 600;
                margin-bottom: 15px;
                color: var(--primary-color);
            }
            .equal-width-row .content p {
                font-size: 1.1rem;
                color: var(--text-light);
                margin-bottom: 20px;
            }
            .equal-width-row .content .btn {
                margin-top: 10px;
            }

            /* CTA Section */
            .cta-section {
                background-color: var(--primary-color);
                color: var(--secondary-color);
                padding-top: 80px;
                text-align: center;
                position: relative;
            }
            .cta-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="1" fill="rgba(255,255,255,0.1)"/></svg>') repeat;
            }
            .cta-content {
                position: relative;
                z-index: 2;
            }
            .cta-section h2 {
                font-size: 2.5rem;
                font-weight: 700;
                margin-bottom: 20px;
            }
            .cta-section p {
                font-size: 1.2rem;
                margin-bottom: 30px;
            }

            /* Footer */
            footer {
                background-color: var(--primary-color);
                color: var(--secondary-color);
                padding: 40px 0;
                text-align: center;
            }
            footer a {
                color: var(--secondary-color);
                text-decoration: none;
                transition: var(--transition);
            }
            footer a:hover {
                color: #fff;
                text-decoration: underline;
            }

            /* Responsive */
            @media (max-width: 768px) {
                .hero-section h1 {
                    font-size: 2.5rem;
                }
                .hero-section p {
                    font-size: 1.1rem;
                }
                .equal-width-row {
                    flex-direction: column;
                }
                .equal-width-row .image-col {
                    order: 1;
                }
                .equal-width-row .content-col {
                    order: 2;
                }
                .section-title {
                    font-size: 2rem;
                }
                .roadmaps-grid, .stories-grid {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>

    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand" href="#">DivineVibes</a>


            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 hero-content">
                        <h1>Embark on Your Spiritual Journey</h1>
                        <p>Discover inner peace through personalized roadmaps, ancient wisdom, daily activities, and AI-guided insights from the Bhagavad Gita. Earn Karma Points and build streaks for a transformative experience.</p>
                        <a href="signup.jsp" class="btn btn-custom btn-primary-custom btn-lg mt-3">
                            <i class="bi bi-person-plus"></i> Get Started
                        </a>
                        <a href="login.jsp" class="btn btn-custom btn-outline-custom btn-lg mt-3 ms-2">
                            <i class="bi bi-box-arrow-in-right"></i> Login
                        </a>
                    </div>
                    <div class="col-md-6 text-center">
                        <img src="Images/landing.png" alt="Spiritual Meditation" class="img-fluid rounded-3" style="max-width: 100%; height: auto;">
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="section">
            <div class="container">
                <h2 class="section-title">Our Wellness Features</h2>
                <p class="section-subtitle">Explore tools designed to nurture your mind, body, and spirit with modern technology and timeless wisdom.</p>

                <!-- Feature 1: Personalized Spiritual Roadmaps -->
                <div class="equal-width-row">
                    <div class="image-col">
                        <img src="Images/landing.png" alt="Personalized Spiritual Roadmaps">
                    </div>
                    <div class="content-col content">
                        <h4>Personalized Spiritual Roadmaps</h4>
                        <p>Guided spiritual journeys with daily tasks to build consistency. Enroll in roadmaps like Master Brahmacharya or Overcome Negativity, earn Karma Points, and track streaks for discipline.</p>
                        <a href="${pageContext.request.contextPath}/roadmaps" class="btn btn-custom btn-primary-custom">Explore Roadmaps</a>
                    </div>
                </div>



                <!-- Feature 4: Spiritual Content -->
                <div class="equal-width-row">
                    <div class="content-col content">
                        <h4>Spiritual Content</h4>
                        <p>Immerse in bhajans, lok dayro, devotional music, spiritual talks, and motivational audios/videos curated to promote peace and cultural connection.</p>
                        <a href="<%= request.getContextPath()%>/user/BhajanServlet"" class="btn btn-custom btn-primary-custom">Listen Now</a>
                    </div>
                    <div class="image-col">
                        <img src="Images/landing.png" alt="Spiritual Content">
                    </div>
                </div>

                <!-- Feature 5: Inspiring Stories & Experiences -->
                <div class="equal-width-row">
                    <div class="image-col">
                        <img src="Images/landing.png" alt="Inspiring Stories">
                    </div>
                    <div class="content-col content">
                        <h4>Inspiring Stories & Experiences</h4>
                        <p>Explore real-life transformation stories and share your journey. Build a supportive community and find motivation from others' spiritual growth.</p>
                        <a href="<%= request.getContextPath()%>/user/StoryServlet" class="btn btn-custom btn-primary-custom">Read Stories</a>
                    </div>
                </div>

                <!-- Feature 6: Interactive Activities -->
                <div class="equal-width-row">
                    <div class="content-col content">
                        <h4>Interactive Activities</h4>
                        <p>Engage in daily activities like meditation, breathing exercises, and self-reflection to foster mindfulness, discipline, and inner transformation.</p>
                        <a href="${pageContext.request.contextPath}/roadmaps" class="btn btn-custom btn-primary-custom">Start Activities</a>
                    </div>
                    <div class="image-col">
                        <img src="Images/landing.png" alt="Interactive Activities">
                    </div>
                </div>
            </div>
        </section>

        <!-- Roadmaps Preview Section -->
        <!-- Roadmaps Preview Section -->



        <!-- Call to Action -->
        <section class="cta-section">
            <div class="cta-content">
                <div class="container">
                    <h2>Ready to Start Your Journey?</h2>
                    <p>Join thousands in rediscovering inner peace and cultural wisdom.</p>
                    <a href="signup.jsp" class="btn btn-custom btn-primary-custom btn-lg" style="background-color: white; color: var(--primary-color);">Begin Now</a>
                </div>
            </div>
            <footer>
            <div class="container">
                <p class="mb-3">© 2025 DivineVibes – Spiritual Wellness Platform</p>
                <p>
                    <a href="about.jsp">About Us</a> | 
                    <a href="contact.jsp">Contact</a> | 
                    <a href="privacy.jsp">Privacy Policy</a>
                </p>
            </div>
        </footer>
        </section>

        <!-- Footer -->
        

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            let currentTestimonial = 0;
            const testimonials = document.querySelectorAll('.testimonial-item');

            function nextTestimonial() {
                testimonials[currentTestimonial].classList.remove('active');
                currentTestimonial = (currentTestimonial + 1) % testimonials.length;
                testimonials[currentTestimonial].classList.add('active');
            }

            // Smooth scroll for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });

            // Fade-in animation on scroll
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

            document.querySelectorAll('.equal-width-row, .roadmap-item, .story-item').forEach(el => {
                el.style.opacity = '0';
                el.style.transform = 'translateY(30px)';
                el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
                observer.observe(el);
            });
        </script>
    </body>
</html>
