<%@ page import="java.util.*" %>
<%@ page session="true" %>
<jsp:include page="header.jsp" />

<%
    List<String[]> stories = (List<String[]>) request.getAttribute("stories");
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
        background: linear-gradient(135deg, #FCFCF7 0%, #F5F5F0 100%);
        font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #2C2C2C;
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
    .stories-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    .stories-header {
        text-align: center;
        margin-bottom: 50px;
    }
    .stories-header h2 {
        color: #BF932A;
        font-size: 3rem;
        font-weight: 700;
        margin-bottom: 10px;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    .stories-header p {
        color: #666;
        font-size: 1.2rem;
        max-width: 600px;
        margin: 0 auto;
    }
    .story-card {
        background: #FFFFFF;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(191, 147, 42, 0.1);
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        margin-bottom: 30px;
        border: 1px solid #E8E8E8;
    }
    .story-card:hover {
        transform: translateY(-10px);
        box-shadow: 0 15px 40px rgba(191, 147, 42, 0.2);
    }
    .card-body {
        padding: 25px;
    }
    .card-title {
        color: #BF932A;
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 15px;
    }
    .card-text {
        color: #555;
        font-size: 1rem;
        line-height: 1.7;
        margin-bottom: 15px;
    }
    .card-author {
        color: #888;
        font-size: 0.9rem;
        margin-bottom: 20px;
    }
    .btn-read-more {
        background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%);
        border: none;
        color: #FCFCF7;
        padding: 10px 20px;
        border-radius: 8px;
        font-weight: 600;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
    }
    .btn-read-more:hover {
        background: linear-gradient(135deg, #D4A574 0%, #BF932A 100%);
        transform: scale(1.05);
        color: #FCFCF7;
    }
    .alert {
        border-radius: 10px;
        font-weight: 500;
    }
    .inspirational-section {
        background: linear-gradient(135deg, #FCFCF7 0%, #F5F5F0 100%);
        padding: 60px 0;
        margin-top: 60px;
        position: relative;
    }
    .inspirational-section::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="40" fill="rgba(191, 147, 42, 0.05)"/></svg>') no-repeat center;
        background-size: cover;
        opacity: 0.5;
        z-index: 0;
    }
    .inspirational-container {
        position: relative;
        z-index: 1;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px;
    }
    .section-title {
        text-align: center;
        color: #BF932A;
        font-size: 2.5rem;
        font-weight: 700;
        margin-bottom: 20px;
        text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
    }
    .section-subtitle {
        text-align: center;
        color: #666;
        font-size: 1.2rem;
        margin-bottom: 50px;
        max-width: 600px;
        margin-left: auto;
        margin-right: auto;
    }
    .growth-story {
        background: #FFFFFF;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(191, 147, 42, 0.1);
        overflow: hidden;
        margin-bottom: 30px;
        border: 1px solid #E8E8E8;
    }
    .story-header {
        background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%);
        color: #FCFCF7;
        padding: 20px;
        text-align: center;
    }
    .story-header h5 {
        font-size: 1.5rem;
        font-weight: 600;
        margin: 0;
    }
    .story-body {
        padding: 25px;
        color: #333;
        line-height: 1.7;
    }
    .story-quote {
        font-style: italic;
        color: #BF932A;
        font-size: 1.1rem;
        margin-bottom: 15px;
        border-left: 4px solid #BF932A;
        padding-left: 15px;
    }
    .story-content {
        font-size: 1rem;
        margin-bottom: 15px;
    }
    .story-tips {
        background: #F8F9FA;
        padding: 15px;
        border-radius: 10px;
        border-left: 4px solid #BF932A;
    }
    .story-tips h6 {
        color: #BF932A;
        font-weight: 600;
        margin-bottom: 10px;
    }
    .story-tips ul {
        margin: 0;
        padding-left: 20px;
    }
    .story-tips li {
        margin-bottom: 5px;
    }
    .share-story-btn {
        background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%);
        border: none;
        color: #FCFCF7;
        padding: 12px 25px;
        border-radius: 8px;
        font-weight: 600;
        transition: all 0.3s ease;
        text-decoration: none;
        display: inline-block;
        margin-top: 20px;
    }
    .share-story-btn:hover {
        background: linear-gradient(135deg, #D4A574 0%, #BF932A 100%);
        transform: scale(1.05);
        color: #FCFCF7;
    }
    .extra-features {
        margin-top: 50px;
        text-align: center;
    }
    .feature-card {
        background: #FFFFFF;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 5px 15px rgba(191, 147, 42, 0.1);
        margin: 10px;
        transition: transform 0.3s ease;
        display: inline-block;
        width: calc(33.333% - 20px);
    }
    .feature-card:hover {
        transform: translateY(-5px);
    }
    .feature-icon {
        font-size: 3rem;
        color: #BF932A;
        margin-bottom: 15px;
    }
    .feature-title {
        color: #BF932A;
        font-weight: 600;
        margin-bottom: 10px;
    }
    .feature-desc {
        color: #666;
        font-size: 0.9rem;
    }
    @media (max-width: 768px) {
        .stories-container {
            padding: 10px;
        }
        .stories-header h2 {
            font-size: 2.2rem;
        }
        .stories-header p {
            font-size: 1rem;
        }
        .story-card {
            margin-bottom: 20px;
        }
        .card-body {
            padding: 20px;
        }
        .section-title {
            font-size: 2rem;
        }
        .section-subtitle {
            font-size: 1rem;
        }
        .growth-story {
            margin-bottom: 20px;
        }
        .story-body {
            padding: 20px;
        }
        .feature-card {
            width: calc(50% - 20px);
        }
    }
    @media (max-width: 480px) {
        .feature-card {
            width: calc(100% - 20px);
        }
    }
    
    
    
        .carousel-control-prev, .carousel-control-next {
        width: 5%;
        opacity: 0.8;
        background: none; /* Remove default background */
        border: none;
    }
    .carousel-control-prev:hover, .carousel-control-next:hover {
        opacity: 1;
    }
    .carousel-control-prev-icon-custom, .carousel-control-next-icon-custom {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        background-color: #BF932A; /* Visible background color */
        color: #FCFCF7; /* Icon color */
        border-radius: 50%;
        font-size: 1.2rem;
        transition: all 0.3s ease;
    }
    .carousel-control-prev:hover .carousel-control-prev-icon-custom,
    .carousel-control-next:hover .carousel-control-next-icon-custom {
        background-color: #D4A574; /* Hover color */
        transform: scale(1.1);
    }
    .carousel-indicators button {
        background-color: #BF932A;
        border: none;
        width: 12px;
        height: 12px;
        border-radius: 50%;
        margin: 0 5px;
    }
    .carousel-indicators .active {
        background-color: #D4A574;
    }
    .story-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 40px rgba(191, 147, 42, 0.2);
    }
    /* Ensure colors are visible on story cards */
    .card-title {
        color: #BF932A !important;
    }
    .btn-read-more {
        background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%) !important;
        color: #FCFCF7 !important;
    }
    /* Responsive Adjustments */
    @media (max-width: 768px) {
        #storiesCarousel {
            padding: 0 20px;
        }
        .carousel-control-prev, .carousel-control-next {
            width: 10%;
        }
        .carousel-control-prev-icon-custom, .carousel-control-next-icon-custom {
            width: 35px;
            height: 35px;
            font-size: 1rem;
        }
    }

</style>

<div class="hero-section">
    <div class="container">
        <h1>Divine Stories</h1>
        <p>Explore inspiring tales shared by our community members, filled with wisdom, growth, and transformation.</p>
    </div>
</div>

<br><br>
<!-- Assuming this is inside your JSP page, after any necessary imports/headers -->
<!-- Assuming this is inside your JSP page, after any necessary imports/headers -->

<% if (stories == null || stories.isEmpty()) { %>
<div class="alert alert-warning text-center" style="border-radius: 15px; font-weight: 500; border: none; box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1); padding: 20px; font-size: 1.1rem;">
    <i class="fas fa-info-circle"></i> No stories available at the moment. Check back soon for new inspirations!
</div>
<% } else { %>
<!-- Stories Carousel -->
<div id="storiesCarousel" class="carousel slide" data-bs-ride="carousel" style="padding: 0 40px;">
    <div class="carousel-inner">
        <%
            int itemsPerSlide = 3; // Number of stories per slide (adjust for responsiveness)
            int totalSlides = (int) Math.ceil((double) stories.size() / itemsPerSlide);
            int storyIndex = 0;
            for (int slideIndex = 0; slideIndex < totalSlides; slideIndex++) {
                boolean isActive = (slideIndex == 0) ? true : false;
        %>
        <div class="carousel-item <%= isActive ? "active" : "" %>">
            <div class="row">
                <%
                    int endIndex = Math.min(storyIndex + itemsPerSlide, stories.size());
                    for (int i = storyIndex; i < endIndex; i++) {
                        String[] s = stories.get(i);
                %>
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="story-card" style="background: #FFFFFF; border-radius: 15px; box-shadow: 0 10px 30px rgba(191, 147, 42, 0.1); overflow: hidden; transition: transform 0.3s ease, box-shadow 0.3s ease; border: 1px solid #E8E8E8; position: relative;">
                        <div class="card-body" style="padding: 25px;">
                            <h5 class="card-title" style="color: #BF932A; font-size: 1.5rem; font-weight: 600; margin-bottom: 15px;"><%= s[1] %></h5>
                            <p class="card-text" style="color: #555; font-size: 1rem; line-height: 1.7; margin-bottom: 15px;"><%= s[2].length() > 150 ? s[2].substring(0, 150) + "..." : s[2] %></p>
                            <p class="card-author" style="color: #888; font-size: 0.9rem; margin-bottom: 20px;"><strong>Shared by:</strong> <%= s[3] %></p>
                            <a href="StoryServlet?id=<%= s[0] %>" class="btn-read-more" style="background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%); border: none; color: #FCFCF7; padding: 10px 20px; border-radius: 8px; font-weight: 600; transition: all 0.3s ease; text-decoration: none; display: inline-block;">
                                <i class="fas fa-book-open"></i> Read Full Story
                            </a>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <% storyIndex += itemsPerSlide; %>
        <% } %>
    </div>
    <!-- Carousel Controls (Arrows) with Custom Font Awesome Icons for Visibility -->
    <button class="carousel-control-prev" type="button" data-bs-target="#storiesCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon-custom" aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#storiesCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon-custom" aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
        <span class="visually-hidden">Next</span>
    </button>
    <!-- Optional: Indicators (Dots) for better navigation -->
    <div class="carousel-indicators" style="bottom: -50px;">
        <% for (int i = 0; i < totalSlides; i++) { %>
        <button type="button" data-bs-target="#storiesCarousel" data-bs-slide-to="<%= i %>" class="<%= i == 0 ? "active" : "" %>" aria-current="<%= i == 0 ? "true" : "false" %>" aria-label="Slide <%= i + 1 %>"></button>
        <% } %>
    </div>
</div>
<% } %>

<!-- Additional CSS for Professional Styling and Visible Controls (Add to your <style> section) -->


<!-- Ensure Bootstrap JS and Font Awesome are included for carousel and icons -->

<!-- Ensure Bootstrap JS is included for carousel functionality -->
</div>


<div class="inspirational-section">
    <div class="inspirational-container">
        <div class="section-title">Personal Growth & Success Stories</div>
        <div class="section-subtitle">
            Discover how our community members have transformed their lives through DivineVibes. From overcoming negativity to achieving personal growth, these stories inspire and guide.
        </div>

        <div class="row">
            <div class="col-lg-6">
                <div class="growth-story">
                    <div class="story-header">
                        <h5>From Darkness to Light: Sarah's Journey</h5>
                    </div>
                    <div class="story-body">
                        <div class="story-quote">
                            "DivineVibes helped me see the light within myself when I was lost in negativity."
                        </div>
                        <div class="story-content">
                            Sarah, a long-time user, shares how daily activities and bhajans on our platform shifted her mindset. Struggling with self-doubt and negative thoughts, she started with simple meditation sessions. Over time, she learned to replace negativity with positive affirmations, leading to a fulfilling career change and stronger relationships.
                        </div>
                        <div class="story-tips">
                            <h6>Key Lessons from Sarah:</h6>
                            <ul>
                                <li>Consistency in daily practices builds resilience.</li>
                                <li>Sharing stories with the community fosters connection.</li>
                                <li>Focus on gratitude to overcome negativity.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="growth-story">
                    <div class="story-header">
                        <h5>Rising Above Challenges: Michael's Success</h5>
                    </div>
                    <div class="story-body">
                        <div class="story-quote">
                            "This platform taught me that growth comes from within, and negativity is just a temporary cloud."
                        </div>
                        <div class="story-content">
                            Michael faced professional setbacks and personal losses that filled him with negativity. Through our stories section and chatbot guidance, he discovered coping strategies and inspirational content. He now runs a successful wellness blog, attributing his transformation to the supportive community and transformative activities on DivineVibes.
                        </div>
                        <div class="story-tips">
                            <h6>Michael's Tips for Growth:</h6>
                            <ul>
                                <li>Engage with the chatbot for personalized advice.</li>
                                <li>Participate in activities to build positive habits.</li>
                                <li>Use bhajans as a tool for emotional healing.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center">
            <a href="/DivineVibes_Final/user/share-story.jsp" class="share-story-btn">
                <i class="fas fa-pen"></i> Share Your Own Story
            </a>
        </div>

        <div class="extra-features">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-seedling"></i>
                </div>
                <div class="feature-title">Personal Growth Tools</div>
                <div class="feature-desc">
                    Access guided activities, meditations, and journals to foster self-improvement and overcome obstacles.
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-sun"></i>
                </div>
                <div class="feature-title">Negativity Buster</div>
                <div class="feature-desc">
                    Learn techniques to identify, challenge, and replace negative thoughts with positive affirmations.
                </div>
            </div>
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-trophy"></i>
                </div>
                <div class="feature-title">Success Stories Hub</div>
                <div class="feature-desc">
                    Read real-life success stories from users who have transformed their lives through our platform.
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />