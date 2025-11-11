<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Signup - DivineVibes</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">

        <style>
            body {
                background-color: #FCFCF7;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                display: flex;
                min-height: 100vh;
                justify-content: center;
                align-items: center;
                padding: 20px;
            }

            .main-container {
                max-width: 950px;
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
                height: 600px;
            }

            .card-form {
                padding: 35px;
                padding-top: 60px;
                background: white;
                flex: 0 0 420px;
                max-width: 420px;
            }

            .right-panel {
                flex: 1;
            }

            .right-panel img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Fill container nicely */
                background: #fff;
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

            /* RESPONSIVE - STACK IMAGE FIRST */
            @media (max-width: 768px) {
                .row-eq-height {
                    flex-direction: column; /* stack vertically */
                    height: auto; /* adjust height */
                }

                .right-panel {
                    order: 1; /* image first */
                }

                .card-form {
                    order: 2; /* form second */
                    flex: unset;
                    max-width: 100%;
                }

                .right-panel img {
                    height: 260px; /* smaller image for mobile */
                }
            }
        </style>
    </head>

    <body>

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            String successMessage = (String) request.getAttribute("successMessage");
            String nameError = (String) request.getAttribute("nameError");
            String emailError = (String) request.getAttribute("emailError");
            String passwordError = (String) request.getAttribute("passwordError");
        %>

        <div class="main-container">

            <div class="row row-eq-height g-0">

                <!-- IMAGE -->
                <div class="col-md-6 right-panel order-md-2 order-1">
                    <img src="<%= request.getContextPath() %>/user/Images/register.jpg" alt="Signup Image">

                </div>


                <!-- FORM -->
                <div class="col-md-6 card-form order-md-1 order-2">

                    <h2 class="text-center fw-bold mb-2" style="color:#BF932A;">Create Your Account</h2>
                    <p class="text-center text-muted mb-3">Join the Divine Vibes Journey ✨</p>

                    <% if (errorMessage != null && !errorMessage.isEmpty()) {%>
                    <div class="alert alert-danger py-2">
                        <i class="bi bi-exclamation-triangle-fill"></i> <%= errorMessage%>
                    </div>
                    <% } %>

                    <% if (successMessage != null && !successMessage.isEmpty()) {%>
                    <div class="alert alert-success py-2">
                        <i class="bi bi-check-circle-fill"></i> <%= successMessage%>
                    </div>
                    <script>
                        setTimeout(() => {
                            window.location.href = "<%= request.getContextPath()%>/user/login.jsp";
                        }, 3000);
                    </script>
                    <% }%>

                    <form action="${pageContext.request.contextPath}/SignupServlet" method="post">

                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control"
                                   value="<%= request.getParameter("name") != null ? request.getParameter("name") : ""%>">
                            <% if (nameError != null && !nameError.isEmpty()) {%>
                            <div class="field-error">
                                <i class="bi bi-exclamation-triangle-fill"></i> <%= nameError%>
                            </div>
                            <% }%>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
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

                        <button type="submit" class="btn btn-primary w-100 mt-3">SIGN UP</button>

                    </form>

                    <p class="text-center mt-3" style="font-size: 0.95rem; color: #666; margin-bottom: 0;">
                        Already have an account?
                        <a href="<%= request.getContextPath()%>/user/login.jsp" 
                           style="color: #BF932A; text-decoration: none; font-weight: 500; transition: color 0.3s ease;" 
                           onmouseover="this.style.color = '#a67c00'" 
                           onmouseout="this.style.color = '#BF932A'">
                            Login
                        </a>
                    </p>

                </div>
            </div>
        </div>

    </body>
</html>
