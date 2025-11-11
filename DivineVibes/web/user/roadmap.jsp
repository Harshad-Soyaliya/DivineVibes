<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Check login session
    String userName = (String) session.getAttribute("name");

    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Spiritual Roadmap – DivineVibes</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f0f4f8;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            background: #fff;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .stage-card {
            border-radius: 20px;
            padding: 30px;
            background: #ffffff;
            box-shadow: 0 5px 25px rgba(0,0,0,0.1);
            transition: 0.25s;
            cursor: pointer;
            height: 100%;
        }

        .stage-card:hover {
            transform: translateY(-6px);
        }

        .stage-icon {
            font-size: 45px;
            margin-bottom: 15px;
        }

        .stage-title {
            font-weight: 700;
            font-size: 1.4rem;
            margin-bottom: 10px;
        }

        .line {
            height: 4px;
            width: 70px;
            background: #0d6efd;
            border-radius: 3px;
            margin: 15px 0;
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg px-4 py-3">
    <a class="navbar-brand fw-bold fs-4 text-primary" href="dashboard.jsp">DivineVibes</a>

    <div class="ms-auto">
        <span class="me-3 fw-semibold text-dark">Hi, <%= userName %>!</span>
        <a href="dashboard.jsp" class="btn btn-outline-primary btn-sm me-2">Dashboard</a>
        <a href="LogoutServlet" class="btn btn-outline-danger btn-sm">Logout</a>
    </div>
</nav>


<!-- MAIN SECTION -->
<div class="container mt-5">

    <h2 class="fw-bold text-center mb-4">🌟 Your Spiritual Growth Roadmap</h2>
    <p class="text-center text-muted mb-5">Follow each stage step-by-step to improve your inner peace, focus and mindset.</p>

    <div class="row g-4">

        <!-- Stage 1 -->
        <div class="col-md-6 col-lg-3">
            <div class="stage-card text-center">
                <div class="stage-icon text-primary">🧘‍♂️</div>
                <h5 class="stage-title">1. Brahmachari Stage</h5>
                <div class="line"></div>
                <p class="text-muted">
                    Foundation of discipline, purity and mindset control.<br>
                    Start your spiritual journey with simple, daily rituals.
                </p>
                <ul class="text-muted text-start small">
                    <li>Wake up early</li>
                    <li>10-min meditation</li>
                    <li>Simple positive habits</li>
                    <li>Reduce distractions</li>
                </ul>
            </div>
        </div>

        <!-- Stage 2 -->
        <div class="col-md-6 col-lg-3">
            <div class="stage-card text-center">
                <div class="stage-icon text-success">🧹</div>
                <h5 class="stage-title">2. Overcoming Negativity</h5>
                <div class="line"></div>
                <p class="text-muted">
                    Remove the mental noise that blocks clarity.<br>
                    Build positive patterns.
                </p>
                <ul class="text-muted text-start small">
                    <li>Gratitude journaling</li>
                    <li>Positive self-talk</li>
                    <li>Reduce toxic environment</li>
                    <li>Consume good content</li>
                </ul>
            </div>
        </div>

        <!-- Stage 3 -->
        <div class="col-md-6 col-lg-3">
            <div class="stage-card text-center">
                <div class="stage-icon text-warning">🧠</div>
                <h5 class="stage-title">3. Control Overthinking</h5>
                <div class="line"></div>
                <p class="text-muted">
                    Calm racing thoughts, develop focus & presence of mind.
                </p>
                <ul class="text-muted text-start small">
                    <li>Breathing exercises</li>
                    <li>Mindfulness practice</li>
                    <li>Reduce digital noise</li>
                    <li>Gita-based thinking</li>
                </ul>
            </div>
        </div>

        <!-- Stage 4 -->
        <div class="col-md-6 col-lg-3">
            <div class="stage-card text-center">
                <div class="stage-icon text-danger">🎯</div>
                <h5 class="stage-title">4. Focus Enhancement</h5>
                <div class="line"></div>
                <p class="text-muted">
                    Strengthen attention, productivity and clarity of direction.
                </p>
                <ul class="text-muted text-start small">
                    <li>Deep work sessions</li>
                    <li>Goal alignment</li>
                    <li>Focus music</li>
                    <li>Daily small wins</li>
                </ul>
            </div>
        </div>

    </div>

    <!-- Motivational Box -->
    <div class="card p-4 mt-5 text-center shadow-sm border-0" style="border-radius:20px;">
        <h5 class="text-primary fw-bold">✨ Remember:</h5>
        <p class="text-muted mb-0">
            "Small improvements every day lead to big transformations over time."
        </p>
    </div>

</div>

</body>
</html>
