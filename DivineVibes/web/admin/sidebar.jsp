<%-- 
    Document   : Sidebar 
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %> 

<%
    String currentURI = request.getRequestURI();
    String contextPath = request.getContextPath();
    String currentPage = currentURI.substring(contextPath.length());
%>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        return;
    }
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Delius+Swash+Caps&display=swap" rel="stylesheet">

<style>

    :root {
        --light: #F7F7F7;
        --dark-grey: #2B2B2B;
        --mid-grey: #3A3A3A;
        --primary: #C9A646;
        --primary-dark: #A78932;
    }

    ::after, ::before {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    a {
        text-decoration: none;
    }

    li {
        list-style: none;
    }

    .wrapper {
        display: flex;
    }

    #sidebar {
        width: 250px;
        min-width: 250px;
        background-color: var(--dark-grey);
        color: var(--light);
        display: flex;
        flex-direction: column;
        position: fixed;
        top: 0;
        bottom: 0;
    }

    .sidebar-logo {
        padding: 20px 10px;
        text-align: center;
    }

    .brand-text {
        font-size: 28px;
        font-weight: bold;
        color: var(--primary);
    }

    .sidebar-nav {
        flex: 1 1 auto;
        padding: 10px 0;
    }

    .sidebar-item a,
    .sidebar-footer a {
        display: flex;
        align-items: center;
        gap: 12px;
        color: var(--light);
        font-size: 17px;
        padding: 12px 22px;
        transition: 0.3s;
    }

    .sidebar-item:hover,
    .sidebar-footer:hover,
    .active {
        background-color: var(--mid-grey);
        border-left: 3px solid var(--primary);
    }

    .navbar-custom {
        background: var(--primary);
        padding: 12px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .navbar-custom .title {
        color: var(--dark-grey);
        font-size: 22px;
        font-weight: bold;
    }

    .navbar-custom .admin-name {
        color: var(--dark-grey);
        font-size: 18px;
    }
    
    

</style>

<aside id="sidebar">

    <div class="sidebar-logo">
        <span class="brand-text">DivineVibes</span>
        <small class="text-light d-block">Feel • Heal • Transform</small>
        <hr style="border: none; height: 2px; background-color: var(--primary); margin-top: 10px;">
    </div>

    <ul class="sidebar-nav">
        <li class="sidebar-item <%= currentPage.equals("/admin/dashboard.jsp") ? "active" : ""%>">
            <a href="<%= request.getContextPath()%>/AdminDashboardServlet">
                <i class="bi bi-house"></i> Dashboard
            </a>
        </li>
        <li class="sidebar-item <%= currentPage.equals("/admin/manageUsers.jsp") ? "active" : ""%>">
            <a href="<%= request.getContextPath()%>/AdminManageUserServlet">
                <i class="bi bi-people"></i> Manage Users
            </a>
        </li>
        <li class="sidebar-item <%= currentPage.equals("/admin/manageBhajans.jsp") ? "active" : ""%>">
            <a href="<%= request.getContextPath()%>/AdminManageBhajanServlet">
                <i class="bi bi-music-note-list"></i> Manage Bhajans
            </a>
        </li>
        <li class="sidebar-item <%= currentPage.equals("/admin/manageRoadmaps.jsp") ? "active" : ""%>">
            <a href="<%= request.getContextPath()%>/AdminManageRoadmapServlet">
                <i class="bi bi-check2-circle"></i> Manage Roadmap
            </a>
        </li>
       
    </ul>

    <div class="sidebar-footer mt-auto">
        <a href="<%= request.getContextPath()%>/admin/login.jsp">
            <i class="bi bi-box-arrow-left"></i> Logout
        </a>
    </div>
            

</aside>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
