<%-- 
    Document   : login 
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="UTF-8">
        <title>Admin Login</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">

        <!--custom css-->
        <style>
            
            body {
                background-color: #FCFCF7;
                display: flex;
                min-height: 100vh;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .main-container {
                max-width: 900px;
                margin: 40px auto;
                background: white;
                border-radius: 30px;
                overflow: hidden;
                box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
            }

            .form-control {
                border-radius: 15px;
            }

            .row-eq-height {
                display: flex;
                flex-wrap: nowrap;
                max-height: 600px;
            }

            .card-form {
                padding: 35px;
                background: white;
                padding-top: 50px;
                flex: 1;
            }

            .left-panel {
                flex: 1;
            }

            .left-panel img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .btn-primary {
                background-color: #BF932A;
                border-color: #BF932A;
                border-radius: 20px;
            }

            .btn-primary:hover {
                background-color: #a67c00;
            }

            .field-error {
                color: #dc3545;
                font-size: 0.875rem;
                margin-top: 0.25rem;
                display: flex;
                align-items: center;
            }

            .field-error i {
                margin-right: 0.5rem;
            }

            @media (max-width: 768px) {
                .row-eq-height {
                    flex-direction: column;
                    min-height: auto;
                }

                .left-panel img {
                    height: 240px;
                }

                .card-form, .left-panel {
                    flex: none;
                }
            }
            
        </style>
        
    </head>

    <body>

        <%
            String errorMsg = (String) request.getAttribute("errorMessage");
            String successMsg = (String) request.getAttribute("successMessage");
            String emailError = (String) request.getAttribute("emailError");
            String passwordError = (String) request.getAttribute("passwordError");
        %>

        <div class="main-container">

            <div class="row row-eq-height g-0">

                <div class="col-md-6 left-panel order-1 order-md-1">
                    <img src="<%= request.getContextPath()%>/admin/Images/login.png" alt="Admin Login Image">
                </div>

                <div class="col-md-6 card-form order-2 order-md-2">
                    <h2 class="text-center fw-bold mb-2" style="color:#BF932A;">Admin Login ✨</h2>
                    <p class="text-center text-muted mb-3">Login to continue</p>
                    
                    <% if (errorMsg != null && !errorMsg.isEmpty()) {%>
                    <div class="alert alert-danger py-2">
                        <i class="bi bi-exclamation-triangle-fill"></i> <%= errorMsg%>
                    </div>
                    <% } %>

                    <% if (successMsg != null && !successMsg.isEmpty()) {%>
                    <div class="alert alert-success py-2">
                        <i class="bi bi-check-circle-fill"></i> <%= successMsg%>
                    </div>
                    <% }%>

                    <form action="<%= request.getContextPath()%>/AdminLoginServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="text" name="email" class="form-control"
                                   value="<%= request.getParameter("email") != null ? request.getParameter("email") : ""%>">
                            <% if (emailError != null && !emailError.isEmpty()) {%>
                            <div class="field-error">
                                <i class="bi bi-exclamation-triangle-fill"></i> <%= emailError%>
                            </div>
                            <% } %>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control">
                            <% if (passwordError != null && !passwordError.isEmpty()) {%>
                            <div class="field-error">
                                <i class="bi bi-exclamation-triangle-fill"></i> <%= passwordError%>
                            </div>
                            <% }%>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 mt-2">LOGIN</button>
                    </form>

                </div>
                     
            </div>
                        
        </div>

    </body>
    
</html>

