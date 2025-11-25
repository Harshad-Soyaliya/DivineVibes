<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String title = request.getParameter("title");
    String file = request.getParameter("file");
    String desc = request.getParameter("desc");
    String img = request.getParameter("img");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title><%= title %> | Play Bhajan</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5fff7;
        }

        .page-title {
            font-size: 32px;
            font-weight: bold;
            color: #0a8a42;
        }

        .bhajan-cover {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.18);
        }

        .player-card {
            border-radius: 20px;
            padding: 25px;
            background: white;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.09);
        }

        audio {
            width: 100%;
            margin-top: 10px;
            border-radius: 10px;
        }

        .back-btn {
            background: #0a8a42;
            color: white;
            border-radius: 25px;
            padding: 8px 18px;
            text-decoration: none;
        }

        .back-btn:hover {
            background: #067835;
            color: #fff;
        }
    </style>
</head>

<body>

    <!-- Navbar -->
    <jsp:include page="navbar.jsp"></jsp:include>

    <div class="container mt-4">

        <a href="bhajans.jsp" class="back-btn mb-3 d-inline-block">← Back to Bhajans</a>

        <div class="player-card">
            <div class="row g-4">

                <!-- Cover Image -->
                <div class="col-md-5">
                    <img src="<%= img %>" class="bhajan-cover" alt="Bhajan Image">
                </div>

                <!-- Player + Info -->
                <div class="col-md-7">
                    <h2 class="page-title"><%= title %></h2>
                    <p class="text-muted"><%= desc %></p>

                    <audio controls>
                        <source src="<%= file %>" type="audio/mpeg">
                    </audio>
                </div>

            </div>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
