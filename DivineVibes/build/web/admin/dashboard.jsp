<%-- 
    Document   : Dashboard 
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        return;
    }
%>

<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    
    :root {
        --grey-dark: #2F2F2F;
        --grey-light: #EDEDED;
        --gold: #C9A227;
        --gold-dark: #A8841F;
    }

    body {
        background: var(--grey-light);
        margin: 0;
        padding: 0;
    }

    .main {
        margin-left: 250px; 
        padding: 20px;
        min-height: 100vh;
    }

    .navbar-custom {
        background: var(--grey-dark);
        border-bottom: 2px solid var(--gold);
        padding: 15px 20px;
        margin-left: 250px;
        display: flex;
        justify-content: space-between;
    }

    .navbar-custom .title,
    .navbar-custom .admin-name {
        color: var(--gold);
        font-weight: bold;
    }

    .card {
        border-left: 5px solid var(--gold);
        background: white;
        box-shadow: rgba(0,0,0,0.1) 0 4px 10px;
        padding: 20px;
        border-radius: 10px;
    }

    .card .count {
        font-size: 32px;
        font-weight: bold;
        color: var(--gold-dark);
    }

    @media(max-width: 768px) {
        .main {
            margin-left: 0;
        }
        .navbar-custom {
            margin-left: 0;
        }
    }
    
</style>

<body>
    
    <jsp:include page="sidebar.jsp" />

    <nav class="navbar-custom">
        <span class="title">Admin Panel</span>
        <span class="admin-name">Welcome, <%= adminName %></span>
    </nav>

    <div class="main">
        <h3 class="mt-3">Dashboard Overview</h3>
        <div class="row g-4 mt-3">
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title">Total Users</h5>
                    <div class="count"><%= request.getAttribute("totalUsers") %></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title">Stories</h5>
                    <div class="count"><%= request.getAttribute("totalStories") %></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title">Bhajans</h5>
                    <div class="count"><%= request.getAttribute("totalBhajans") %></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title">Completed Activities</h5>
                    <div class="count"><%= request.getAttribute("completedActivities") %></div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <h5 class="card-title">Admins</h5>
                    <div class="count"><%= request.getAttribute("totalAdmins") %></div>
                </div>
            </div>
        </div>
    </div>

</body>
