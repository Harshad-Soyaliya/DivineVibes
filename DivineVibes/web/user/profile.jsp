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
        display: none; /* Initially hidden, shown via JS */
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
    .btn-edit {
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
        margin-bottom: 20px;
    }
    .btn-edit:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(191, 147, 42, 0.4);
    }
    .btn-edit:active {
        transform: translateY(0);
    }
    .btn-save {
        background: linear-gradient(135deg, #28A745 0%, #20C997 100%);
        border: none;
        border-radius: 12px;
        padding: 15px 30px;
        font-size: 1.2rem;
        font-weight: 600;
        color: #FCFCF7;
        width: 100%;
        transition: all 0.3s ease;
        box-shadow: 0 6px 15px rgba(40, 167, 69, 0.3);
        display: none; /* Initially hidden */
    }
    .btn-save:hover {
        transform: translateY(-3px);
        box-shadow: 0 10px 25px rgba(40, 167, 69, 0.4);
    }
    .btn-save:active {
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
        .btn-edit, .btn-save {
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
    }
</style>

<div class="profile-wrapper">
    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-icon">
                <i class="fas fa-user-circle"></i>
            </div>
            <h2>Your Profile</h2>
            <p>Manage your details and track your progress</p>
        </div>

        <% String errorMsg = (String) request.getAttribute("errorMessage"); %>
        <% String successMsg = (String) request.getAttribute("successMessage"); %>

        <div id="errorAlert" class="alert alert-danger" role="alert">
            <i class="fas fa-exclamation-triangle me-2"></i><%= errorMsg != null ? errorMsg : "" %>
        </div>

        <div id="successAlert" class="alert alert-success" role="alert">
            <i class="fas fa-check-circle me-2"></i><%= successMsg != null ? successMsg : "" %>
        </div>

        <div class="profile-content">
            <button type="button" id="editBtn" class="btn-edit">
                <i class="fas fa-edit me-2"></i>Edit Profile
            </button>

            <form id="profileForm" action="ProfileServlet" method="post">
                <div class="form-section">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" id="nameField" class="form-control" 
                           value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>"
                           placeholder="Enter your full name" disabled>
                </div>

                <div class="form-section">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" id="emailField" class="form-control" 
                           value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>"
                           placeholder="Enter your email address" disabled>
                </div>

                <button type="submit" id="saveBtn" class="btn-save">
                    <i class="fas fa-save me-2"></i>Save Changes
                </button>
            </form>

            <div class="extra-section">
                <h5><i class="fas fa-lightbulb me-2"></i>Profile Insights</h5>
                <p>Keep your profile updated for a better experience. Participate actively to unlock exclusive features!</p>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const editBtn = document.getElementById('editBtn');
        const saveBtn = document.getElementById('saveBtn');
        const nameField = document.getElementById('nameField');
        const emailField = document.getElementById('emailField');
        const errorAlert = document.getElementById('errorAlert');
        const successAlert = document.getElementById('successAlert');

        // Show alerts if messages exist
        if (errorAlert.textContent.trim() !== '<i class="fas fa-exclamation-triangle me-2"></i>') {
            errorAlert.style.display = 'block';
            setTimeout(() => {
                errorAlert.style.display = 'none';
            }, 2000);
        }
        if (successAlert.textContent.trim() !== '<i class="fas fa-check-circle me-2"></i>') {
            successAlert.style.display = 'block';
            setTimeout(() => {
                successAlert.style.display = 'none';
            }, 2000);
        }

        editBtn.addEventListener('click', function() {
            nameField.disabled = false;
            emailField.disabled = false;
            editBtn.style.display = 'none';
            saveBtn.style.display = 'block';
        });
    });
</script>

<jsp:include page="footer.jsp" />