<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>DivineVibes – Mental Wellness Platform</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7f8fa;
        }

        .navbar {
            background-color: #0d6efd;
        }
        .navbar-brand, .nav-link {
            color: white !important;
            font-weight: 500;
        }

        /* Hero */
        .hero-section {
            height: 85vh;
            background: linear-gradient(to right, #0d6efd, #4dabff);
            color: white;
            display: flex;
            align-items: center;
        }

        .hero-section h1 {
            font-size: 3.2rem;
            font-weight: 700;
        }

        .hero-section p {
            font-size: 1.1rem;
            margin-top: 10px;
        }

        /* Cards */
        .feature-card {
            border: none;
            border-radius: 20px;
            padding: 25px;
            transition: 0.3s;
        }
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }

        /* Footer */
        footer {
            background: #0d6efd;
            color: white;
            padding: 20px 0;
        }
    </style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">DivineVibes</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07">
            <span class="navbar-toggler-icon bg-light p-1 rounded"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                <li class="nav-item"><a class="nav-link" href="habits.jsp">Habits</a></li>
                <li class="nav-item"><a class="nav-link" href="booking.jsp">Book Session</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="col-md-7">
            <h1>Welcome to DivineVibes</h1>
            <p>Your personal space for mental wellness, stress relief, habit building, meditation & growth.</p>

            <a href="register.jsp" class="btn btn-light btn-lg mt-3 rounded-3">
                <i class="bi bi-person-plus"></i> Get Started
            </a>
            <a href="login.jsp" class="btn btn-outline-light btn-lg mt-3 ms-2 rounded-3">
                <i class="bi bi-box-arrow-in-right"></i> Login
            </a>
        </div>
    </div>
</section>

<!-- Features Section -->
<div class="container my-5">
    <h2 class="text-center mb-4 fw-bold">Our Wellness Features</h2>

    <div class="row g-4">

        <!-- Card 1 -->
        <div class="col-md-4">
            <div class="feature-card shadow-sm text-center">
                <i class="bi bi-sunrise fs-1 text-primary"></i>
                <h4 class="mt-3 fw-bold">Daily Habit Building</h4>
                <p>Create healthy habits & track your daily routine to improve lifestyle.</p>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="col-md-4">
            <div class="feature-card shadow-sm text-center">
                <i class="bi bi-heart-pulse fs-1 text-danger"></i>
                <h4 class="mt-3 fw-bold">Mental Wellness</h4>
                <p>Relax with guided meditation, breathing exercises & stress-relief tips.</p>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="col-md-4">
            <div class="feature-card shadow-sm text-center">
                <i class="bi bi-calendar-check fs-1 text-success"></i>
                <h4 class="mt-3 fw-bold">Book Therapist</h4>
                <p>Connect with trained professionals for personal counselling sessions.</p>
            </div>
        </div>

    </div>
</div>

<!-- Footer -->
<footer class="text-center">
    <p class="mb-0">© 2025 DivineVibes – Mental Wellness Platform</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
