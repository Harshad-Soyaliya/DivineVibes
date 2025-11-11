<%@ page import="java.sql.*, java.util.*" %>
<%@ page session="true" %>
<jsp:include page="header.jsp" />

<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<style>
    body {
        background: linear-gradient(135deg, #FCFCF7 0%, #F5F5F0 100%);
        font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #2C2C2C;
        line-height: 1.6;
        margin: 0;
        padding: 0;
    }
    .profile-wrapper {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    .profile-container {
        width: 100%;
        max-width: 700px;
        background: #FFFFFF;
        border-radius: 20px;
        box-shadow: 0 15px 40px rgba(191, 147, 42, 0.1);
        overflow: hidden;
        border: 1px solid #E8E8E8;
    }
    .profile-header {
        background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%);
        color: #FCFCF7;
        padding: 40px 30px;
        text-align: center;
        position: relative;
    }
    .profile-header::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="40" fill="rgba(255,255,255,0.1)"/></svg>') no-repeat center;
        background-size: cover;
        opacity: 0.3;
    }
    .profile-header h2 {
        font-size: 2.8rem;
        font-weight: 700;
        margin: 0;
        position: relative;
        z-index: 1;
    }
    .profile-header p {
        font-size: 1.2rem;
        margin: 10px 0 0 0;
        opacity: 0.9;
        position: relative;
        z-index: 1;
    }
    .profile-icon {
        font-size: 4rem;
        margin-bottom: 15px;
        position: relative;
        z-index: 1;
    }
    .alert {
        margin: 20px 30px;
        border-radius: 10px;
        font-weight: 500;
        border: none;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .alert-danger {
        background: linear-gradient(135deg, #FF6B6B, #EE5A52);
        color: #FFFFFF;
    }
    .alert-success {
        background: linear-gradient(135deg, #51CF66, #40C057);
        color: #FFFFFF;
    }
    .profile-content {
        padding: 40px 30px;
    }
    .form-section {
        margin-bottom: 30px;
    }
    .form-label {
        font-weight: 600;
        color: #BF932A;
        margin-bottom: 10px;
        display: block;
        font-size: 1.1rem;
    }
    .form-control {
        border: 2px solid #E8E8E8;
        border-radius: 12px;
        padding: 15px 18px;
        font-size: 1rem;
        transition: all 0.3s ease;
        background: #FCFCF7;
    }
    .form-control:focus {
        border-color: #BF932A;
        box-shadow: 0 0 0 3px rgba(191, 147, 42, 0.15);
        outline: none;
        background: #FFFFFF;
    }
    .form-control:disabled {
        background: #F8F9FA;
        color: #6C757D;
        border-color: #DEE2E6;
        cursor: not-allowed;
    }
    .karma-display {
        background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%);
        color: #FCFCF7;
        border-radius: 15px;
        padding: 25px;
        text-align: center;
        margin-bottom: 30px;
        box-shadow: 0 8px 20px rgba(191, 147, 42, 0.2);
    }
    .karma-value {
        font-size: 3rem;
        font-weight: 800;
        margin: 0;
        display: block;
    }
    .karma-label {
        font-size: 1.2rem;
        margin-top: 5px;
        opacity: 0.9;
    }
    .btn-update {
        background: linear-gradient(135deg, #BF932A 0%, #D4A574 100%);
        border: none;
        border-radius: 12px;
        padding: 15px 30px;
        font-size: 1.2rem;
        font-weight: 600;
        color: #FCFCF7;
        width: 100%;
        transition: all 0.3s ease;
        box-shadow: 0 6px 15px rgba(191, 147, 42, 0.3);
    }
    .btn-update:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(191, 147, 42, 0.4);
    }
    .btn-update:active {
        transform: translateY(0);
    }
    .extra-section {
        background: #F8F9FA;
        border-radius: 15px;
        padding: 25px;
        margin-top: 30px;
        text-align: center;
        border: 1px solid #E8E8E8;
    }
    .extra-section h5 {
        color: #BF932A;
        font-weight: 600;
        margin-bottom: 15px;
        font-size: 1.3rem;
    }
    .extra-section p {
        color: #555;
        font-size: 1rem;
        margin: 0;
    }
    @media (max-width: 768px) {
        .profile-wrapper {
            padding: 10px;
        }
        .profile-container {
            max-width: 100%;
            border-radius: 15px;
        }
        .profile-header {
            padding: 30px 20px;
        }
        .profile-header h2 {
            font-size: 2.2rem;
        }
        .profile-header p {
            font-size: 1rem;
        }
        .profile-icon {
            font-size: 3rem;
        }
        .profile-content {
            padding: 30px 20px;
        }
        .karma-value {
            font-size: 2.5rem;
        }
        .btn-update {
            font-size: 1.1rem;
            padding: 12px 25px;
        }
    }
    @media (max-width: 480px) {
        .profile-header h2 {
            font-size: 1.8rem;
        }
        .profile-content {
            padding: 20px 15px;
        }
        .form-control {
            padding: 12px 15px;
        }
        .karma-display {
            padding: 20px;
        }
        .karma-value {
            font-size: 2rem;
        }
    }
</style>

<div class="profile-wrapper">
    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-icon">
                <i class="fas fa-user-circle"></i>
            </div>
            <h2>Your Profile</h2>
            <p>Manage your details and track your karma</p>
        </div>

        <% String errorMsg = (String) request.getAttribute("errorMessage"); %>
        <% String successMsg = (String) request.getAttribute("successMessage"); %>

        <% if (errorMsg != null) { %>
            <div class="alert alert-danger" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i><%= errorMsg %>
            </div>
        <% } %>

        <% if (successMsg != null) { %>
            <div class="alert alert-success" role="alert">
                <i class="fas fa-check-circle me-2"></i><%= successMsg %>
            </div>
        <% } %>

        <div class="profile-content">
            <form action="ProfileServlet" method="post">
                <div class="form-section">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" 
                           value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>"
                           placeholder="Enter your full name">
                </div>

                <div class="form-section">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" 
                           value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                           placeholder="Enter your email address">
                </div>

                <div class="karma-display">
                    <span class="karma-value"><%= request.getAttribute("karma") != null ? request.getAttribute("karma") : 0 %></span>
                    <div class="karma-label">Karma Points</div>
                </div>

                <button type="submit" class="btn-update">
                    <i class="fas fa-save me-2"></i>Update Profile
                </button>
            </form>

            <div class="extra-section">
                <h5><i class="fas fa-lightbulb me-2"></i>Profile Insights</h5>
                <p>Keep your profile updated for a better experience. Earn more karma by participating actively and unlocking exclusive features!</p>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />