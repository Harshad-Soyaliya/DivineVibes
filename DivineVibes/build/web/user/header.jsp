<%--<%@ page import="java.sql., java.util." %>--%>
<%@ page session="true" %>

<%
    String userName = (String) session.getAttribute("name");
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <style>
            body {
                background-color: #FCFCF7;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .top-header {
                background-color: #FCFCF7;
                border-bottom: 1px solid rgba(191, 147, 42, 0.2);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .brand-text {
                font-weight: bold;
                color: #BF932A;
                font-size: 28px;
                text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
                transition: color 0.3s ease;
            }

            .brand-text:hover {
                color: #a67c00;
            }

            .navbar-custom {
                background: linear-gradient(135deg, #BF932A 0%, #a67c00 100%);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .navbar-custom .navbar-nav .nav-link {
                color: #FCFCF7 !important;
                font-weight: 500;
                transition: all 0.3s ease;
                position: relative;
            }

            .navbar-custom .navbar-nav .nav-link:hover {
                color: #FCFCF7 !important;
                transform: translateY(-2px);
            }

            /* Remove underline for all links, add only for non-dropdowns */
            .navbar-custom .navbar-nav .nav-link:not(.dropdown-toggle)::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                width: 0;
                height: 2px;
                background-color: #FCFCF7;
                transition: all 0.3s ease;
                transform: translateX(-50%);
            }

            .navbar-custom .navbar-nav .nav-link:not(.dropdown-toggle):hover::after {
                width: 100%;
            }


            .dropdown-menu {
                border-radius: 8px;
                border: none;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                background-color: #FCFCF7;
            }

            .dropdown-item {
                color: #BF932A;
                transition: background-color 0.3s ease;
            }

            .dropdown-item:hover {
                background-color: rgba(191, 147, 42, 0.1);
                color: #a67c00;
            }

            .dropdown:hover .dropdown-menu {
                display: block;
                margin-top: 0;
            }

            .search-bar {
                max-width: 400px;
                flex: 1;
                margin: 0 20px;
            }

            .search-bar .form-control {
                border-radius: 25px;
                border: 2px solid #BF932A;
                background-color: #FCFCF7;
                color: #BF932A;
                transition: all 0.3s ease;
            }

            .search-bar .form-control:focus {
                border-color: #a67c00;
                box-shadow: 0 0 0 0.2rem rgba(191, 147, 42, 0.25);
            }

            .search-bar .btn {
                border-radius: 25px;
                background-color: #BF932A;
                border: none;
                color: #FCFCF7;
                transition: all 0.3s ease;
            }

            .search-bar .btn:hover {
                background-color: #a67c00;
                transform: scale(1.05);
            }

            .user-menu .btn {
                border-radius: 20px;
                transition: all 0.3s ease;
            }

            .user-menu .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            /* Color palette for buttons */
            .btn-signup {
                background-color: #BF932A;
                border-color: #BF932A;
                color: #FCFCF7;
            }

            .btn-signup:hover {
                background-color: #a67c00;
                border-color: #a67c00;
            }

            .btn-login {
                background-color: transparent;
                border-color: #BF932A;
                color: #BF932A;
            }

            .btn-login:hover {
                background-color: #BF932A;
                color: #FCFCF7;
            }

            .btn-header {
                background-color: transparent !important;
                border-color: #BF932A !important;
                color: #BF932A !important;
                transition: all 0.3s ease; /* Added smooth transition for better UX */
            }

            .btn-header:hover {
                background-color: #BF932A !important;
                color: #FCFCF7 !important;
                border-color: #BF932A !important;
            }




            /* Sidebar styles */
            .sidebar {
                position: fixed;
                top: 0;
                left: -350px;
                width: 350px;
                height: 100%;
                background: linear-gradient(135deg, #BF932A 0%, #a67c00 100%);
                color: #FCFCF7;
                transition: left 0.3s ease;
                z-index: 1050;
                padding-top: 60px;
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
                overflow-y: auto;
            }

            .sidebar.show {
                left: 0;
            }

            .sidebar-header {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 60px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 20px;
            }

            .sidebar-close {
                background: none;
                border: none;
                color: #FCFCF7;
                font-size: 24px;
                cursor: pointer;
                transition: color 0.3s ease;
            }

            .sidebar-close:hover {
                color: #a67c00;
            }

            .sidebar .nav-link {
                color: #FCFCF7 !important;
                padding: 15px 20px;
                display: block;
                /*            border: 1px solid white;
                            border-radius: 50px;*/
                margin: 5px  20px;
                transition: background-color 0.3s ease;
            }

            .sidebar .nav-link:hover {
                background-color: rgba(252, 252, 247, 0.1);

            }

            .sidebar .dropdown-menu {
                background-color: rgba(252, 252, 247, 0.1);
                border: none;
                position: static;
                float: none;
                width: 100%;
                box-shadow: none;
                display: none;
            }

            .sidebar .dropdown.show .dropdown-menu {
                display: block;
            }

            .sidebar .dropdown-item {
                color: #FCFCF7;
                ;
                padding: 10px 30px;
            }

            .sidebar .dropdown-item:hover {
                background-color: rgba(252, 252, 247, 0.2);
            }

            .sidebar .user-menu {
                padding: 20px;
                border-top: 1px solid rgba(252, 252, 247, 0.2);
                text-align: center;
            }

            .sidebar .user-menu .btn {
                width: 100%;
                margin-bottom: 10px;
            }

            /* Toggle button */
            .sidebar-toggle {
                display: none;
                background: none;
                border: none;
                color: #BF932A;
                font-size: 24px;
                cursor: pointer;
                padding: 10px;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1040;
                display: none;
            }

            .overlay.show {
                display: block;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .top-header {
                    padding: 10px 0;
                }

                .top-header .container {
                    flex-direction: column;
                    gap: 10px;
                }

                .mobile-header-row {
                    display: flex;
                    justify-content: space-between;
                    align-items: center;
                    width: 100%;
                }

                .mobile-logo {
                    flex: 1;
                    text-align: center;
                }

                .mobile-search {
                    width: 100%;
                    margin-top: 10px;
                }

                .search-bar, .user-menu {
                    display: none;
                }

                .sidebar-toggle {
                    display: block;
                }

                .brand-text {
                    font-size: 24px;
                }

                .navbar-custom {
                    display: none;
                }

                .navbar-custom .navbar-nav .nav-link:not(.dropdown-toggle)::after {
                    display: none;
                }

                .navbar-custom .navbar-nav .dropdown-toggle::after {
                    display: none;
                }
            }
        </style>
    </head>

    <body>

        <!-- Sidebar Overlay -->
        <div class="overlay" id="sidebarOverlay"></div>

        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <span class="brand-text"></span>
                <button class="sidebar-close" id="sidebarClose">
                    <i class="fas fa-times"></i>
                </button>
            </div>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="dashboard.jsp">Home</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Activities</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="activities.jsp">Explore Activities</a></li>
                        <li><a class="dropdown-item" href="activity-complete.jsp">Completed</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">Stories</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="stories.jsp">Read Stories</a></li>
                        <li><a class="dropdown-item" href="post-story.jsp">Share Your Story</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="bhajans.jsp">Bhajans</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="chatbot.jsp">Chatbot</a>
                </li>
                <% if (userName != null) { %>
                <li class="nav-item">
                    <a class="nav-link" href="<%= request.getContextPath() %>/user/ProfileServlet">Profile</a>
                </li>
                <% } %>
            </ul>
            <div class="user-menu">
                <% if (userName != null) {%>
                <span class="fw-semibold text-center d-block mb-3">Hi, <%= userName%> ?</span>
                <a href="dashboard.jsp" class="btn btn-header btn-sm">Dashboard</a>
                <a href="<%= request.getContextPath()%>/user/LogoutServlet" class="btn btn-header  btn-sm">Logout</a>
                <% } else { %>
                <a href="signup.jsp" class="btn btn-signup btn-sm">Signup</a>
                <a href="login.jsp" class="btn btn-login btn-sm">Login</a>
                <% } %>
            </div>
        </div>

        <!-- Top Header -->
        <header class="shadow-sm top-header">
            <div>
                <!-- Mobile Header Row -->
                <div class="mobile-header-row d-md-none">
                    <button class="sidebar-toggle" id="sidebarToggle">
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="mobile-logo">
                        <span class="brand-text">DivineVibes</span>
                        <small class="text-muted d-block">Feel ? Heal ? Transform</small>
                    </div>
                </div>
                <!-- Mobile Search Row -->
                <div class="mobile-search d-md-none">
                    <div class="search-bar d-flex justify-content-center">
                        <input type="text" class="form-control me-2" placeholder="Search activities, stories, bhajans..." style="max-width: 300px;">
                        <button class="btn" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>

                <!-- Desktop Header -->
                <div class="d-none d-md-flex justify-content-between align-items-center flex-wrap py-3 px-5">
                    <!-- Logo -->
                    <div class="d-flex flex-column">
                        <span class="brand-text">DivineVibes</span>
                        <small class="text-muted">Feel ? Heal ? Transform</small>
                    </div>

                    <!-- Search Bar -->
                    <div class="search-bar d-flex">
                        <input type="text" class="form-control me-2" placeholder="Search activities, stories, bhajans...">
                        <button class="btn" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>

                    <!-- Right Menu -->
                    <div class="d-flex align-items-center gap-3 user-menu">
                        <% if (userName != null) {%>
                        <span class="fw-semibold ">Hi, <%= userName%> ?</span>
                        <a href="dashboard.jsp" class="btn btn-header btn-sm">
                            <i class="fa-solid fa-gauge"></i> Dashboard
                        </a>
                        <a href="<%= request.getContextPath()%>/user/LogoutServlet" class="btn btn-header btn-sm">
                            Logout <i class="fa-solid fa-right-from-bracket"></i>
                        </a>
                        <% } else { %>
                        <a href="signup.jsp" class="btn btn-signup btn-sm">Signup</a>
                        <a href="login.jsp" class="btn btn-login btn-sm">Login</a>
                        <% }%>
                    </div>
                </div>

                <!-- Navigation (Desktop) -->
                <nav class="navbar navbar-expand-lg navbar-custom d-none d-md-block">
                    <div class="container">
                        <div class="collapse navbar-collapse justify-content-center" id="navMenu">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="dashboard.jsp">Home</a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle px-3" href="#">Activities</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="activities.jsp">Explore Activities</a></li>
                                        <li><a class="dropdown-item" href="activity-complete.jsp">Completed</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle px-3" href="#">Stories</a>
                                    <ul class="dropdown-menu">
                                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/user/StoryServlet">Read Stories</a></li>
                                        <li><a class="dropdown-item" href="post-story.jsp">Share Your Story</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="<%= request.getContextPath()%>/user/BhajanServlet">Bhajans</a>
                                </li>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="<%= request.getContextPath()%>/user/ChatbotServlet">Chatbot</a>
                                </li>
                                <% if (userName != null) { %>
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="<%= request.getContextPath() %>/user/ProfileServlet">Profile</a>
                                </li>
                                <% }%>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </header>

        <!-- BOOTSTRAP JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            // Sidebar toggle functionality
            const sidebar = document.getElementById('sidebar');
            const sidebarToggle = document.getElementById('sidebarToggle');
            const sidebarClose = document.getElementById('sidebarClose');
            const sidebarOverlay = document.getElementById('sidebarOverlay');

            function toggleSidebar() {
                sidebar.classList.toggle('show');
                sidebarOverlay.classList.toggle('show');
            }

            sidebarToggle.addEventListener('click', toggleSidebar);
            sidebarClose.addEventListener('click', toggleSidebar);
            sidebarOverlay.addEventListener('click', toggleSidebar);
        </script>

    </body>
</html>