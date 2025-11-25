<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="DivineVibes - Your Personalized Journey to Spiritual Wellness. Explore personalized roadmaps, earn karma points, and find inner peace through ancient wisdom and modern tools.">
    <meta name="keywords" content="spiritual wellness, mindfulness, Indian spirituality, personal growth, karma points, roadmaps, AI chatbot">
    <title>Welcome to DivineVibes - Spiritual Wellness Platform</title>

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
            margin: 0;
            padding: 0;
            overflow-x: hidden;
        }

        /* Navbar */
       
        /* Hero Section */
        .hero-section {
            background: linear-gradient(rgba(191, 147, 42, 0.8), rgba(191, 147, 42, 0.6)),
                url("https://via.placeholder.com/1920x1080/FCFCF7/BF932A?text=Spiritual+Welcome") center/cover no-repeat;
            color: var(--secondary-color);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
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

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 800px;
            padding: 20px;
        }

        .hero-section h1 {
            font-size: 4rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
            animation: fadeInUp 1s ease-out;
        }

        .hero-section p {
            font-size: 1.3rem;
            opacity: 0.9;
            margin-bottom: 2rem;
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
            padding: 15px 40px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            text-decoration: none;
            display: inline-block;
            margin: 10px;
            transition: var(--transition);
            border: 2px solid var(--secondary-color);
            cursor: pointer;
            background-color: var(--secondary-color);
            color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-user {
            background-color: var(--primary-color);
            color: var(--secondary-color);
        }

        .btn-custom:hover {
            background-color: var(--primary-color);
            transform: translateY(-3px);
            color: white;
            box-shadow: 0 8px 20px var(--shadow);
        }

        .btn-admin {
            background-color: var(--secondary-color);
            color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-admin:hover {
            background-color: var(--primary-color);
            color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 8px 20px var(--shadow);
        }

       
        /* Media Queries */
        @media (max-width: 768px) {
            .hero-section h1 {
                font-size: 2.5rem;
            }

            .hero-section p {
                font-size: 1.1rem;
            }

            .btn-custom {
                padding: 12px 30px;
                font-size: 1rem;
                display: block;
                width: 200px;
                margin: 10px auto;
            }

           
        }

        @media (max-width: 576px) {
            .hero-section h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-content">
        <h1>Welcome to DivineVibes</h1>
        <p>Embark on a transformative spiritual journey with personalized roadmaps, ancient wisdom, and modern tools for inner peace and growth. Discover your path to mindfulness, discipline, and self-transformation.</p>
        <a href="user/index.jsp" class="btn-custom">
            <i class="bi bi-person"></i> Enter as User
        </a>
        <a href="/DivineVibes_Final/admin/login.jsp" class="btn-custom">
            <i class="bi bi-shield-lock"></i> Enter as Admin
        </a>
    </div>
</section>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Smooth scrolling for navbar links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Add fade-in animation on scroll for features and testimonials
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

    document.querySelectorAll('.feature-item, .testimonial-item').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>
</body>
</html>