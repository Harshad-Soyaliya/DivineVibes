<%@ page session="true" %>
<jsp:include page="header.jsp" />

<style>
    /* Custom styles for modern, professional, and clean look */
    body {
        background-color: #FCFCF7; /* Off-white background for a clean feel */
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Modern font for readability */
        color: #333; /* Dark text for contrast */
        line-height: 1.7; /* Improved line height for readability */
    }

    .story-container {
        max-width: 900px; /* Limit width for better readability on large screens */
        margin: 0 auto; /* Center the container */
        padding: 20px;
    }

    .story-card {
        background: #FCFCF7; /* Off-white card background */
        border: none; /* Remove default border */
        border-radius: 16px; /* Softer, more modern radius */
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
        transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth hover effects */
        overflow: hidden; /* Ensure content doesn't overflow */
    }

    .story-card:hover {
        transform: translateY(-5px); /* Lift effect on hover */
        box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15); /* Enhanced shadow on hover */
    }

    .story-title {
        color: #BF932A; /* Golden color for title */
        font-size: 2.5rem; /* Larger, prominent title */
        font-weight: 700; /* Bold for emphasis */
        margin-bottom: 1rem;
        text-align: center;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Subtle text shadow */
    }

    .story-meta {
        color: #666; /* Muted color for meta info */
        font-size: 1rem;
        text-align: center;
        margin-bottom: 2rem;
        font-style: italic;
    }

    .story-content {
        font-size: 1.1rem; /* Slightly larger for readability */
        color: #444; /* Darker text for content */
        text-align: justify; /* Justified text for professional look */
        margin-bottom: 2rem;
    }

    .story-content p {
        margin-bottom: 1.5rem; /* Space between paragraphs */
    }

    .back-btn {
        background-color: #BF932A; /* Golden button */
        color: #FCFCF7; /* Off-white text */
        border: none;
        border-radius: 8px;
        padding: 12px 24px;
        font-size: 1rem;
        font-weight: 600;
        text-decoration: none;
        transition: background-color 0.3s ease, transform 0.3s ease;
        display: inline-block;
    }

    .back-btn:hover {
        background-color: #A67C00; /* Darker golden on hover */
        transform: scale(1.05); /* Slight scale on hover */
        color: #FCFCF7;
    }

    /* Extra enhancements for better UX */
    .story-header {
        border-bottom: 2px solid #BF932A; /* Golden underline for header */
        padding-bottom: 1rem;
        margin-bottom: 2rem;
    }

    .share-section {
        text-align: center;
        margin-top: 2rem;
        padding-top: 1rem;
        border-top: 1px solid #E0E0E0; /* Subtle separator */
    }

    .share-btn {
        background: #BF932A;
        color: #FCFCF7;
        border: none;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        margin: 0 5px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
        transition: background-color 0.3s ease, transform 0.3s ease;
        text-decoration: none;
    }

    .share-btn:hover {
        background: #A67C00;
        transform: scale(1.1);
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .story-container {
            padding: 10px;
        }
        .story-title {
            font-size: 2rem; /* Smaller title on mobile */
        }
        .story-content {
            font-size: 1rem; /* Adjust content size */
        }
        .back-btn {
            width: 100%; /* Full-width button on mobile */
            padding: 15px;
        }
    }

    @media (max-width: 480px) {
        .story-title {
            font-size: 1.8rem;
        }
        .story-meta {
            font-size: 0.9rem;
        }
    }
</style>

<div class="story-container">
    <%
        String title = (String) request.getAttribute("title");
        String content = (String) request.getAttribute("content");
        String author = (String) request.getAttribute("author");
        String createdAt = (String) request.getAttribute("created_at");
    %>

    <div class="story-card p-5">
        <div class="story-header">
            <h2 class="story-title"><%= title %></h2>
            <p class="story-meta">By <strong><%= author %></strong> | Posted on <%= createdAt %></p>
        </div>
        <div class="story-content">
            <%= content %>
        </div>
        <div class="text-center">
            <a href="StoryServlet" class="back-btn">Back to Stories</a>
        </div>
        <!-- Extra: Social share buttons for better engagement -->
        <div class="share-section">
            <p class="mb-2" style="color: #666; font-size: 0.9rem;">Share this story:</p>
            <a href="#" class="share-btn" title="Share on Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="#" class="share-btn" title="Share on Twitter"><i class="fab fa-twitter"></i></a>
            <a href="#" class="share-btn" title="Share on LinkedIn"><i class="fab fa-linkedin-in"></i></a>
            <a href="#" class="share-btn" title="Share via Email"><i class="fas fa-envelope"></i></a>
        </div>
    </div>
</div>

<!-- Add Font Awesome for icons (if not already included) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<jsp:include page="footer.jsp" />