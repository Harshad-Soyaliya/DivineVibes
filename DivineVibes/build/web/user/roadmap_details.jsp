<%@ page import="model.Roadmap, model.Activity, java.util.List" %>

<%
    Roadmap roadmap = (Roadmap) request.getAttribute("roadmap");
    List<Activity> activities = (List<Activity>) request.getAttribute("activities");
%>

<h2><%= roadmap.getTitle() %></h2>
<p><%= roadmap.getDescription() %></p>

<h3>Activities</h3>

<ol>
<%
    for (Activity a : activities) {
%>
    <li>
        <b><%= a.getTitle() %></b> <br>
        <%= a.getDescription() %>
    </li>
<%
    }
%>
</ol>

<a href="EnrollServlet?id=<%= roadmap.getId() %>">
    <button>Enroll</button>
</a>
