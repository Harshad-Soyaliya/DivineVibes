<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand fw-bold text-success" href="index.jsp">BhajanWorld</a>

        <!-- Toggler for mobile -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("index.jsp") ? "active" : "" %>" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("bhajans.jsp") ? "active" : "" %>" href="bhajans.jsp">Bhajans</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("artists.jsp") ? "active" : "" %>" href="artists.jsp">Artists</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link <%= request.getRequestURI().endsWith("contact.jsp") ? "active" : "" %>" href="contact.jsp">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
