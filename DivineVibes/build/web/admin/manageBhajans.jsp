<%-- 
    Document   : ManageBhajans 
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List, java.util.Map, java.util.ArrayList" %>

<%
    String adminName = (String) session.getAttribute("adminName");
    if (adminName == null) {
        response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
        return;
    }

    List<Map<String, String>> bhajans
            = (List<Map<String, String>>) request.getAttribute("bhajans");

    if (bhajans == null) {
        bhajans = new ArrayList<>();
    }

%>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

    :root {
        --grey-dark: #2F2F2F;
        --grey-light: #F5F5F5;
        --gold: #C9A646;
        --primary-dark: #A78932;
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

    .main {
        margin-left: 250px;
        padding: 25px;
        min-height: 100vh;
    }

    .page-title {
        display: inline-block;
        font-size: 26px;
        font-weight: bold;
        border: 2px solid var(--gold);
        padding: 8px 18px;
        border-radius: 10px;
        background: white;
        color: var(--grey-dark);
    }

    .custom-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 25px;
    }

    .custom-table th,
    .custom-table td {
        border: 2px dotted #333;
        padding: 12px;
        font-size: 16px;
    }

    .custom-table th {
        background: #fff;
        font-weight: bold;
    }

    .btn-divine {
        background: var(--gold);
        color: black;
        padding: 6px 15px;
        border-radius: 20px;
        font-weight: 600;
        border: none;
        transition: 0.3s;
    }

    .btn-divine:hover {
        background: var(--primary-dark);
        color: white;
    }

    .btn-delete {
        background: #8b3f3f;
        color: white;
        padding: 6px 15px;
        border-radius: 20px;
        font-weight: 600;
        border: none;
        transition: 0.3s;
    }

    .btn-delete:hover {
        background: #6a2c2c;
    }

    @keyframes fadeInOut {
        0% {
            opacity: 0;
            transform: translate(-50%, 20px);
        }
        10% {
            opacity: 1;
            transform: translate(-50%, 0);
        }
        90% {
            opacity: 1;
        }
        100% {
            opacity: 0;
            transform: translate(-50%, 20px);
        }
    }

</style>

<body>

    <%        String successMsg = (String) session.getAttribute("success");
        if (successMsg != null) {
    %>

    <div id="successToast"
         style="
         position: fixed;
         bottom: 30px;
         left: 50%;
         transform: translateX(-50%);
         background: rgba(80,80,80,0.65);
         color: white;
         padding: 15px 25px;
         border-radius: 12px;
         backdrop-filter: blur(4px);
         font-size: 17px;
         font-weight: 600;
         z-index: 9999;
         animation: fadeInOut 4s ease forwards;
         ">
        <%= successMsg%>
    </div>

    <%
            session.removeAttribute("success");
        }
    %>

    <jsp:include page="sidebar.jsp" />

    <nav class="navbar-custom">
        <span class="title">Admin Panel</span>
        <span class="admin-name">Welcome, <%= adminName%></span>
    </nav>

    <div class="main">

        <h2 class="page-title">Manage Bhajans</h2>
        
        <div class="text-end" style="margin-top: 15px; margin-bottom: 10px;">
            <a href="<%= request.getContextPath()%>/AdminManageBhajanServlet?action=add" class="btn-divine">Add Bhajan</a>
        </div>

        <table class="custom-table mt-4">
            <thead>
                <tr>
                    <th width="80">S.No</th>
                    <th>Title</th>
                    <th>YouTube URL</th>
                    <th>Description</th>
                    <th width="200">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int i = 1;

                    for (Map<String, String> b : bhajans) {
                %>
                <tr>
                    <td><%= i++%></td>
                    <td><%= b.get("title")%></td>
                    <td><a href="<%= b.get("youtube_url")%>" target="_blank">Link</a></td>
                    <td><%= b.get("description")%></td>
                    <td>
                        <a href="<%= request.getContextPath()%>/AdminManageBhajanServlet?action=edit&id=<%= b.get("id")%>" class="btn-divine">Edit</a>
                        <button class="btn-delete" onclick="openDeleteModal('<%= b.get("id")%>')">Delete</button>
                    </td>
                </tr>
                <% }%>
            </tbody>
        </table>

    </div>

    <!-- Delete Bhajan Modal -->
    <div class="modal fade" id="deleteBhajanModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius:15px; border:2px solid var(--gold); background:#fff;">
                <div class="modal-header" style="background: var(--grey-light); border-bottom: 1px solid var(--gold);">
                    <h5 class="modal-title" style="color: var(--gold-dark); font-weight:700;">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body" style="color:#333; font-size:16px;">
                    Are you sure you want to delete this bhajan?
                </div>
                <div class="modal-footer" style="border-top: 1px solid var(--gold); background:var(--grey-light);">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>

                    <form id="deleteBhajanForm" method="get" action="<%= request.getContextPath()%>/AdminManageBhajanServlet">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" id="deleteBhajanId">
                        <button type="submit" class="btn" style="background:var(--gold); color:white; font-weight:600;">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openDeleteModal(id) {
            document.getElementById("deleteBhajanId").value = id;
            var modal = new bootstrap.Modal(document.getElementById("deleteBhajanModal"));
            modal.show();
        }
    </script>

</body>
