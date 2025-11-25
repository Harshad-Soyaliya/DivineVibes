<%@ page contentType="text/html;charset=UTF-8" language="java" %> 

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        return;
    }
%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
    :root {
        --grey-dark: #2F2F2F;
        --grey-light: #FFFFFF;
        --gold: #C9A646;
        --gold-dark: #A78932;
    }

    .main {
        margin-left: 250px;
        padding: 30px;
        background: var(--grey-light);
        min-height: 100vh;
    }

    .breadcrumb-custom {
        font-size: 16px;
        color: var(--gold);
        font-weight: 500;
    }

    .breadcrumb-custom span {
        color: var(--gold-dark);
        font-weight: 700;
    }

    .form-wrapper {
        border: 2px dotted var(--grey-dark);
        border-radius: 15px;
        padding: 25px;
        background: #fff;
    }

    .form-label {
        font-weight: 600;
        color: var(--grey-dark);
    }

    .form-control {
        border: 2px solid #7a5f60;
        border-radius: 15px;
        padding: 10px 15px;
        font-size: 15px;
    }

    .btn-divine {
        width: 100%;
        background: var(--gold);
        color: black;
        padding: 14px;
        font-size: 17px;
        border-radius: 25px;
        font-weight: 700;
        border: none;
        transition: 0.3s;
    }

    .btn-divine:hover {
        background: var(--gold-dark);
        color: white;
    }

    .btn-reset {
        width: 100%;
        background: #d8b965;
        color: black;
        padding: 14px;
        font-size: 17px;
        border-radius: 25px;
        font-weight: 700;
        border: none;
        transition: 0.3s;
    }

    .btn-reset:hover {
        background: #b99b4a;
        color: white;
    }
    
</style>

<body>

    <jsp:include page="sidebar.jsp" />

    <div class="main">

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb" style="--bs-breadcrumb-divider: '>';">
                <li class="breadcrumb-item">
                    <a href="<%= request.getContextPath()%>/admin/dashboard.jsp" 
                       style="color: var(--gold); font-weight: 600; text-decoration:none;">
                        Home
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="<%= request.getContextPath()%>/AdminManageUserServlet?action=list"
                       style="color: var(--gold); font-weight: 600; text-decoration:none;">
                        Manage Users
                    </a>
                </li>
                <li class="breadcrumb-item" aria-current="page"
                    style="color: var(--gold-dark); font-weight: 700;">
                    Edit User
                </li>
            </ol>
        </nav>

        <div class="form-wrapper">
            <form action="<%= request.getContextPath()%>/AdminManageUserServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="userId" value="<%= request.getAttribute("userId")%>">
                <label class="form-label mt-3">Full Name</label>
                <input type="text" class="form-control" name="fullName" value="<%= request.getAttribute("fullName")%>">
                <% if (request.getAttribute("fullNameError") != null) {%>
                <small style="color:red;"><%= request.getAttribute("fullNameError")%></small>
                <% }%>
                <br>
                <label class="form-label mt-3">Email Address</label>
                <input type="text" class="form-control" name="email" value="<%= request.getAttribute("email")%>">
                <% if (request.getAttribute("emailError") != null) {%>
                <small style="color:red;"><%= request.getAttribute("emailError")%></small>
                <% }%><br>
                <div class="row mt-4">
                    <div class="col-md-6 mb-3">
                        <button type="submit" class="btn-divine">Update User</button>
                    </div>
                    <div class="col-md-6 mb-3">
                        <button type="reset" class="btn-reset">Reset Form</button>
                    </div>
                </div>
            </form>
        </div>

    </div>

</body>
