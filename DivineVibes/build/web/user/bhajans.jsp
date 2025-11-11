<%@ page import="java.util.*" %>
<%@ page session="true" %>
<jsp:include page="header.jsp" />

<%
    List<String[]> bhajans = (List<String[]>) request.getAttribute("bhajans");
%>

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
            url("../assets/bhajans-hero.jpg") center/cover no-repeat;
        color: var(--secondary-color);
        padding: 120px 0;
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

    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(30px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .bhajan-card {
        background: var(--secondary-color);
        border: 2px solid var(--primary-color);
        border-radius: 20px;
        padding: 20px;
        transition: var(--transition);
        box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        position: relative;
        overflow: hidden;
        height: 100%;
    }

    .bhajan-card::before {
        content: '';
        position: absolute;
        top: 0;
        left: -100%;
        width: 100%;
        height: 100%;
        background: linear-gradient(90deg, transparent, rgba(191, 147, 42, 0.1), transparent);
        transition: left 0.5s;
    }

    .bhajan-card:hover::before {
        left: 100%;
    }

    .bhajan-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 30px rgba(191, 147, 42, 0.3);
        border-color: #8B6F2A;
    }

    .bhajan-card .card-title {
        color: var(--primary-color);
        font-weight: 600;
        margin-bottom: 1rem;
    }

    .bhajan-card .card-text {
        color: var(--text-light);
        margin-bottom: 1.5rem;
    }

    .bhajan-card .btn {
        background: var(--primary-color);
        border: none;
        color: var(--secondary-color);
        font-weight: 600;
        transition: var(--transition);
    }

    .bhajan-card .btn:hover {
        background: #8B6F2A;
        transform: scale(1.05);
    }

    .filter-section {
        background: var(--secondary-color);
        border-radius: 20px;
        padding: 30px;
        margin-bottom: 40px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .filter-input {
        border: 2px solid var(--primary-color);
        border-radius: 10px;
        padding: 10px 15px;
        font-size: 1rem;
        transition: var(--transition);
    }

    .filter-input:focus {
        outline: none;
        box-shadow: 0 0 10px rgba(191, 147, 42, 0.5);
        border-color: #8B6F2A;
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

    .no-bhajans {
        background: linear-gradient(135deg, var(--secondary-color), #f8f9fa);
        border-radius: 20px;
        padding: 60px 40px;
        text-align: center;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .no-bhajans .alert {
        background: transparent;
        border: 2px solid var(--primary-color);
        color: var(--primary-color);
        font-weight: 600;
    }

    @media (max-width: 768px) {
        .hero-section {
            padding: 80px 20px;
        }

        .hero-section h1 {
            font-size: 2rem;
        }

        .bhajan-card {
            margin-bottom: 20px;
        }

        .filter-section {
            padding: 20px;
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
        <h1>Divine Bhajans ?</h1>
        <p>Immerse yourself in soothing bhajans for spiritual upliftment and peace</p>
    </div>
</div>

<div class="container mt-5">
    <!-- Filter Section -->
    <div class="filter-section">
        <h3 class="section-title">Find Your Bhajan</h3>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <input type="text" id="bhajanSearch" class="form-control filter-input" placeholder="Search bhajans by title...">
            </div>
        </div>
        <p class="text-center mt-3 text-muted">Filter and discover bhajans that resonate with your soul</p>
    </div>

    <!-- Bhajans List -->
    <h2 class="section-title">Explore Bhajans</h2>

    <% if (bhajans == null || bhajans.isEmpty()) { %>
        <div class="no-bhajans">
            <div class="alert alert-warning">
                No bhajans available at the moment. Please check back later.
            </div>
        </div>
    <% } else { %>
        <div class="row g-4" id="bhajanContainer">
            <% for (String[] b : bhajans) { %>
                <div class="col-lg-4 col-md-6 bhajan-item">
                    <div class="card bhajan-card">
                        <div class="card-body d-flex flex-column">
                            <h5 class="card-title"><%= b[1] %></h5>
                            <p class="card-text flex-grow-1"><%= b[3] %></p>
                            <a href="<%= b[2] %>" target="_blank" class="btn w-100">
                                <i class="fa-solid fa-play me-2"></i>Listen Now
                            </a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    <% } %>
</div>

<script>
    // Simple search filter functionality
    document.getElementById('bhajanSearch').addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase();
        const bhajanItems = document.querySelectorAll('.bhajan-item');

        bhajanItems.forEach(item => {
            const title = item.querySelector('.card-title').textContent.toLowerCase();
            if (title.includes(searchTerm)) {
                item.style.display = 'block';
            } else {
                item.style.display = 'none';
            }
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

    document.querySelectorAll('.bhajan-card, .filter-section, .no-bhajans').forEach(el => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
        observer.observe(el);
    });
</script>

<jsp:include page="footer.jsp" />